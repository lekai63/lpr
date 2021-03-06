package inscalc

import (
	"fmt"

	"cloud.google.com/go/civil"
	dataframe "github.com/rocketlaunchr/dataframe-go"
)

// ToDefault 根据model生成默认的还本付息计划：利息在每月或每季度21日偿还，本金在其他日期偿还，且本金偿还时不额外付息
// 适用工行、农行、建行
// 首次生成，可使用fillInsPlanDate 为true,生成后写入数据库；非首次生成，则预期数据库中已有InsPlanDate信息
func (model *BankRepayPlanCalcModel) ToDefault(fillInsPlanDate bool) (*BankRepayPlanCalcModel, error) {

	// 注意使用括号决定计算优先级，不要直接链式调用
	if fillInsPlanDate {
		model.FillInsPlanDate()
	}
	model.AddAccruedPrincipal()

	// 如没有指定loan_method 默认为"保理"
	switch model.Bc.LoanMethod.ValueOrZero() {
	case "短期流贷":
		model.AddDefaultShortTermIns()
	default:
		model.AddDefaultFactoringIns()
	}

	model.AddPlanAmount()
	return model, nil
}

// AddDefaultShortTermIns 计算短期流贷利息并添加到列，本函数将df.lock 注意避免与其他函数形成死锁
// # 默认短期流贷利息方案为：
// 利息在每月或每季度21日偿还，本金在到期日一次性还本，利随本清。
func (model *BankRepayPlanCalcModel) AddDefaultShortTermIns() *BankRepayPlanCalcModel {
	model.Sort("plan_date")
	df := model.Brps
	// upperVal 用于存储上一个row的信息
	upperVals := make(map[interface{}]interface{})
	nrows := df.NRows()
	// planInsterest Slice用于存储计算后的计划利息,因最后要将 planInsterest 传入NewSeries，故类型直接选择[]interface{} ,如定义为[]int,还需再循环转换为[]interface{}
	// https://golang.org/doc/faq#convert_slice_of_interface
	planInsterest := make([]interface{}, nrows)
	var e error

	iterator := df.ValuesIterator(dataframe.ValuesOptions{0, 1, true})
	df.Lock()
	for {
		row, vals, _ := iterator()
		if row == nil {
			break
		}
		if (*row) == 0 {
			upperVals["plan_date"] = civil.DateOf(model.Bc.ActualStartDate.ValueOrZero())
		}
		planInsterest[*row], e = model.rowInsCalc(vals, upperVals)
		check(e)

		// 本次循环结束时，将本行赋值给upperVal用于下次循环
		upperVals = vals
	}
	df.Unlock()
	// 移除旧的plan_interest 以及不需要用的几个字段
	df.RemoveSeries("plan_interest")
	df.RemoveSeries("created_at")
	df.RemoveSeries("updated_at")
	// df.RemoveSeries("accrued_principal")

	//添加新的plan_interest
	se := dataframe.NewSeriesInt64("plan_interest", nil, planInsterest...)
	df.AddSeries(se, nil)

	model.Brps = df
	return model
}

// AddDefaultFactoringIns 计算默认保理利息并添加到列，本函数将df.lock 注意避免与其他函数形成死锁
// # 默认保理利息方案为：
// 利息在每月或每季度21日偿还，本金在其他日期偿还，且本金偿还时不额外付息
// # 注意：
// 如遇节假日，付息时间不顺延。工行还本时间提前，建行还本时间不变，农行还本时间顺延并收顺延期间资金占用利息。
// 故利息计算时，需根据actual_date测算期间利息。
func (model *BankRepayPlanCalcModel) AddDefaultFactoringIns() *BankRepayPlanCalcModel {
	model.Sort("plan_date")
	df := model.Brps
	// upperVal 用于存储上一个row的信息
	upperVals := make(map[interface{}]interface{})
	var temp int64
	nrows := df.NRows()
	// planInsterest Slice用于存储计算后的计划利息,因最后要将 planInsterest 传入NewSeries，故类型直接选择[]interface{} ,如定义为[]int,还需再循环转换为[]interface{}
	// https://golang.org/doc/faq#convert_slice_of_interface
	planInsterest := make([]interface{}, nrows)
	var e error

	iterator := df.ValuesIterator(dataframe.ValuesOptions{0, 1, true})
	df.Lock()
	for {
		row, vals, _ := iterator()
		if row == nil {
			break
		}
		switch {
		// 第0行为第一笔利息还款计划
		case (*row) == 0:
			upperVals["plan_date"] = civil.DateOf(model.Bc.ActualStartDate.ValueOrZero())
			planInsterest[*row], e = model.rowInsCalc(vals, upperVals)
			check(e)
			// 最后一行 利随本清
		case (*row) == nrows-1: // 如使用(*row) == df.NRows() 游标直接到最后，从而无法执行
			t, e := model.rowInsCalc(vals, upperVals)
			check(e)
			// 把暂存与temp中的利息加回来
			planInsterest[*row] = t +temp
		default:
			// 保理利息在每季末/月末21日扣，故本金还款日当天的利息，应加到下一季末/月末的21日一并扣息
			// 本row还款日非21日，将计划还款利息暂存入temp
			if d := vals["plan_date"].(civil.Date); d.Day != 21 {
				temp, e = model.rowInsCalc(vals, upperVals)
				check(e)
				planInsterest[*row] = 0
			} else if x := upperVals["plan_date"].(civil.Date); x.Day != 21 {
				// 上一row为非21日，将temp提取出来，加入本row
				m, e := model.rowInsCalc(vals, upperVals)
				check(e)
				planInsterest[*row] = m + temp
			} else {
				// 默认planInsterest算法
				planInsterest[*row], e = model.rowInsCalc(vals, upperVals)
				check(e)
			}
		}

		// 存在数据竞争，如直接更新row，最后的df数据不全，故删去，转而在前面数据处理时，组装一个series，再将series整体加入到df
		// df.UpdateRow(*row, &dataframe.DontLock, vals)

		// 本次循环结束时，将本行赋值给upperVal用于下次循环
		upperVals = vals
	}
	df.Unlock()
	// 移除旧的plan_interest 以及不需要用的几个字段
	df.RemoveSeries("plan_interest")
	df.RemoveSeries("created_at")
	df.RemoveSeries("updated_at")
	// df.RemoveSeries("accrued_principal")

	//添加新的plan_interest
	se := dataframe.NewSeriesInt64("plan_interest", nil, planInsterest...)
	df.AddSeries(se, nil)

	model.Brps = df
	return model

}

// ToABC 生成农行还款计划
func (model *BankRepayPlanCalcModel) ToABC(fillInsPlanDate bool) (*BankRepayPlanCalcModel, error) {
	if model.Bc.BankName != "农业银行" {
		return nil, fmt.Errorf("输入模型的银行名称不是农业银行，请检查 %w", ErrName)
	}
	model.ToDefault(fillInsPlanDate)
	return model, nil

}

// ToCCB 生成建行还款计划
func (model *BankRepayPlanCalcModel) ToCCB(fillInsPlanDate bool) (*BankRepayPlanCalcModel, error) {
	if model.Bc.BankName != "建设银行" {
		return nil, fmt.Errorf("输入模型的银行名称不是建设银行，请检查 %w", ErrName)
	}
	model.ToDefault(fillInsPlanDate)
	return model, nil

}

// ToICBC 生成工行还本付息计划
func (model *BankRepayPlanCalcModel) ToICBC(fillInsPlanDate bool) (*BankRepayPlanCalcModel, error) {
	if model.Bc.BankName != "工商银行" {
		return nil, fmt.Errorf("输入模型的银行名称不是工商银行，请检查 %w", ErrName)
	}
	model.ToDefault(fillInsPlanDate)
	return model, nil
}

// ToSPDB 生成浦发还本付息计划
func (model *BankRepayPlanCalcModel) ToSPDB(fillInsPlanDate bool) (*BankRepayPlanCalcModel, error) {
	if model.Bc.BankName != "浦发银行" {
		return nil, fmt.Errorf("输入模型的银行名称不是浦发银行，请检查 %w", ErrName)
	}
	model.ToDefault(fillInsPlanDate)
	return model, nil
}
