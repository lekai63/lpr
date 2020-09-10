package inscalc

import (
	"context"
	"fmt"
	"log"
	"math/big"
	"os"
	"strconv"
	"strings"
	"time"

	"cloud.google.com/go/civil"
	"github.com/guregu/null"

	dataframe "github.com/rocketlaunchr/dataframe-go"
	"github.com/rocketlaunchr/dataframe-go/imports"
)

// BankRepayPlanCalcModel  定义单个合同的计算模型
type BankRepayPlanCalcModel struct {
	Bc BankLoanContractMini
	// Brps存储Bc合同项下的所有还款记录, Brp []BankRepayPlan
	Brps *dataframe.DataFrame
}

// BankLoanContractMini 提取BankLoanContract与利息计算相关的字段
type BankLoanContractMini struct {
	// ID,InterestCalcMethod ,BankName,LoanMethod ,CurrentRate对应bank_loan_contract 中的同名字段
	//[ 0] id                                             INT4                 null: false  primary: true   isArray: false  auto: true   col: INT4            len: -1      default: []
	ID int32 `gorm:"primary_key;AUTO_INCREMENT;column:id;type:INT4;" json:"id"`
	//[ 4] interest_calc_method                           VARCHAR(255)         null: true   primary: false  isArray: false  auto: false  col: VARCHAR         len: 255     default: []
	InterestCalcMethod null.String `gorm:"column:interest_calc_method;type:VARCHAR;size:255;" json:"interest_calc_method"`
	//[ 5] bank_name                                      VARCHAR(255)         null: false  primary: false  isArray: false  auto: false  col: VARCHAR         len: 255     default: []
	BankName string `gorm:"column:bank_name;type:VARCHAR;size:255;" json:"bank_name"`
	//[ 8] loan_method                                    VARCHAR(255)         null: true   primary: false  isArray: false  auto: false  col: VARCHAR         len: 255     default: []
	LoanMethod null.String `gorm:"column:loan_method;type:VARCHAR;size:255;" json:"loan_method"`
	//[16] current_rate                                   INT4                 null: false  primary: false  isArray: false  auto: false  col: INT4            len: -1      default: []
	CurrentRate int32 `gorm:"column:current_rate;type:INT4;" json:"current_rate"`
}

var ctx = context.Background()

// NewModel 根据bankLoanContractID 从数据库中获取数据 并生成 BankRepayPlanCalcModel
func NewModel(bankLoanContractID int32) (model BankRepayPlanCalcModel, err error) {
	// conn := models.GlobalConn
	// to change back to models.GlobalConn
	db, _ := gormInitForTest()

	// gen model.Bc
	var bc BankLoanContractMini
	bc.ID = bankLoanContractID
	db.Table("bank_loan_contract").First(&bc)
	// db.First(&bc)
	model.Bc = bc

	// gen model.Brps
	sqldb, _ := db.DB()
	tx, _ := sqldb.Begin()
	op := imports.SQLLoadOptions{
		// KnownRowCount: &[]int{13}[0],
		DictateDataType: map[string]interface{}{
			"id":                    int64(0),
			"bank_loan_contract_id": int64(0),
			"plan_date":             time.Unix(0, 0),
			"plan_amount":           int64(0),
			"plan_principal":        int64(0),
			"plan_interest":         int64(0),
			"actual_date":           time.Unix(0, 0),
			"actual_amount":         int64(0),
			"actual_principal":      int64(0),
			"actual_interest":       int64(0),
			"created_at":            time.Unix(0, 0),
			"updated_at":            time.Unix(0, 0),
			"accrued_principal":     int64(0),
		},
		Database: imports.PostgreSQL,
		Query:    `select * from "bank_repay_plan"` + `where bank_loan_contract_id =` + strconv.Itoa(int(bc.ID)),
	}
	brps, err := imports.LoadFromSQL(ctx, tx, &op)
	if err != nil {
		fmt.Printf("从数据库中读取数据组装dataframe时发生错误：%+v", err)
		return model, err
	}
	model.Brps = brps
	model.convTimeToDate()

	return model, nil

}

// AddAccruedPrincipal 重新计算应计本金并替换原Series
// todo:根据实际还款情况计算未还部分的应计本金
func (model *BankRepayPlanCalcModel) AddAccruedPrincipal() *BankRepayPlanCalcModel {
	model.Sort("plan_date")
	brps := model.Brps
	errorColl := dataframe.NewErrorCollection()
	i, err := brps.NameToColumn("plan_principal")
	if err != nil {
		errorColl.AddError(err)
	}

	copiedSerie, ok := brps.Series[i].Copy().(*dataframe.SeriesInt64)

	sums := dataframe.NewSeriesInt64("accrued_principal", nil)
	if ok {
		for i = 0; i < copiedSerie.NRows(); copiedSerie.Remove(i) {
			sumfloat, err := copiedSerie.Sum(ctx)
			sum := int64(sumfloat)
			if err != nil {
				errorColl.AddError(err)
				fmt.Printf("%s", errorColl)
			}
			sums.Append(sum)
		}
		brps.RemoveSeries("accrued_principal")
		brps.AddSeries(sums, nil)
	}

	return model
}

// todo:根据银行不同 生成不同的计划还款日期
func (model *BankRepayPlanCalcModel) FillInsPlanDate() *BankRepayPlanCalcModel {

	return nil
}

// Sort 根据 model 的 fieldname 字段升序排列
func (model *BankRepayPlanCalcModel) Sort(fieldname string) *BankRepayPlanCalcModel {
	df := model.Brps

	df.Sort(ctx, []dataframe.SortKey{
		{Key: fieldname, Desc: false},
	})

	model.Brps = df
	return model
}

// FillPlanDateMonthly 对还未还款的记录（actual_date 为nil），生成每月21日的还息日期plan_date，并按planDate升序排序。
// 其他字段以nil进行填充 （bank_loan_contract_id 用 bc.id填充）
func (model *BankRepayPlanCalcModel) FillPlanDateMonthly() *BankRepayPlanCalcModel {
	brps := model.Brps
	col, _ := brps.NameToColumn("plan_date")
	se := brps.Series[col]
	se.Sort(ctx, dataframe.SortOptions{Desc: false})

	n, err := getLatestNilActualRowNum(brps)
	nrow := se.NRows()
	check(err)

	startDate := se.Value(n).(civil.Date)
	endDate := se.Value(nrow - 1).(civil.Date)
	planDateSlice := genIcbcInsPlanDate(startDate, endDate)

	// 填充生成的planDate，并对其他字段进行填充
	model.Brps = brps
	maps := model.slice2maps("plan_date", planDateSlice...)

	// 组装dataframe
	// 注意maps中字段要与series一一对应，否则报错"no. of args not equal to no. of series"
	for _, val := range maps {
		brps.Append(nil, val)
	}

	model.Brps = brps

	return model
}

// ConvTimeToDate 将 model 中含有_date字段 的 time转换为civil.date：time2date
func (model *BankRepayPlanCalcModel) convTimeToDate() *BankRepayPlanCalcModel {
	df := model.Brps
	for _, name := range df.Names() {
		if strings.Contains(name, "_date") {
			n, err := df.NameToColumn(name)
			check(err)
			se, err := timeSerie2dateSerie(&df.Series[n])
			check(err)
			err = df.RemoveSeries(name)
			check(err)
			err = df.AddSeries(se, nil)
			check(err)
		}
	}
	model.Brps = df
	return model
}

// AddPlanAmount 加入列“计划还款总额”
func (model *BankRepayPlanCalcModel) AddPlanAmount() *BankRepayPlanCalcModel {
	df := model.Brps
	nrows := df.NRows()
	// 对原始df的直接迭代更新，只能更新部分数据，故每次都另外生成slice，再添加到df
	planAmount := make([]interface{}, nrows)

	// 计算当前行的计划还款总额planAmount
	rowPlanAmountCalc := func(vals map[interface{}]interface{}) (planAmount int64) {
		planInterest := vals["plan_interest"].(int64)
		if vals["plan_principal"] == nil {
			planAmount = planInterest
		} else {
			planAmount = planInterest + vals["plan_principal"].(int64)
		}
		return
	}

	applyDfFn := dataframe.ApplyDataFrameFn(func(val map[interface{}]interface{}, row, nRows int) map[interface{}]interface{} {
		planAmount[row] = rowPlanAmountCalc(val)
		return val
	})

	dataframe.Apply(ctx, df, applyDfFn, dataframe.FilterOptions{InPlace: true})

	se2 := dataframe.NewSeriesInt64("plan_amount", nil, planAmount...)
	df.RemoveSeries("plan_amount")
	df.AddSeries(se2, nil)
	model.Brps = df
	return model
}

// rowInsCalc 计算本行的计划利息。参数vals传入本行row值，upperVals传入上一行值
// 在传入本函数前，应该先完成sort排序 model.Sort("plan_date")
// 不在本函数里做sort 是担心与其他调用函数形成死锁
func (model *BankRepayPlanCalcModel) rowInsCalc(vals map[interface{}]interface{}, upperVals map[interface{}]interface{}) int64 {

	calcDays := vals["plan_date"].(civil.Date).DaysSince(upperVals["plan_date"].(civil.Date))
	planInsB := big.NewInt(0)
	accruedB := big.NewInt(vals["accrued_principal"].(int64))
	RateB := big.NewInt(int64(model.Bc.CurrentRate))
	// 计划利息 = 应计本金×年利率×期间天数/360 （因利率单位为0.01%，所以再除以10000）
	planInsB = planInsB.Mul(accruedB, RateB).Mul(planInsB, big.NewInt(int64(calcDays))).Div(planInsB, big.NewInt(3600000))
	return planInsB.Int64()
}

func timeSerie2dateSerie(d *dataframe.Series) (*dataframe.SeriesGeneric, error) {

	typ := (*d).Type()
	if typ != "time" {
		fmt.Println(typ)
		return nil, fmt.Errorf("格式错误")
	}
	t := (*d).Copy()
	colname := (t).Name()
	// vals := []civil.Date{}
	x := (t).NRows()
	vals := make([]interface{}, x)
	// 将time转换为date并放到另一个slice中 （直接in place替换，可能会有更新不全的问题）
	fconvert := dataframe.ApplySeriesFn(func(val interface{}, row, nRows int) interface{} {
		if val == nil {
			vals[row] = nil
		} else {
			z := val.(time.Time)
			vals[row] = civil.DateOf(z)
		}
		return val
	})
	dataframe.Apply(ctx, t, fconvert, dataframe.FilterOptions{InPlace: true})

	// 生成dateSerie
	se := dataframe.NewSeriesGeneric(colname, civil.Date{}, nil, vals...)

	// 定义比较函数，以便用于排序
	f := func(a, b interface{}) bool {
		a1 := a.(civil.Date)
		b1 := b.(civil.Date)
		return a1.Before(b1)
	}
	se.SetIsLessThanFunc(f)

	return se, nil

}

func check(err error) {
	if err != nil {
		log.Fatalln(err)
		os.Exit(10086)
	}
}