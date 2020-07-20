package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetLeaseRepayPlanTable(ctx *context.Context) table.Table {

	leaseRepayPlan := table.NewDefaultTable(table.DefaultConfigWithDriver("postgresql"))

	info := leaseRepayPlan.GetInfo().HideFilterArea()

	info.AddField("Pid", "pid", db.Int4)
	info.AddField("Cid", "cid", db.Int4)
	info.AddField("Period", "period", db.Int2)
	info.AddField("Plan_date", "plan_date", db.Date)
	info.AddField("Plan_amount", "plan_amount", db.Int8)
	info.AddField("Plan_principal", "plan_principal", db.Int8)
	info.AddField("Plan_interest", "plan_interest", db.Int8)
	info.AddField("Actual_date", "actual_date", db.Date)
	info.AddField("Actual_amount", "actual_amount", db.Int8)
	info.AddField("Actual_principal", "actual_principal", db.Int8)
	info.AddField("Actual_interest", "actual_interest", db.Int8)
	info.AddField("Create_time", "create_time", db.Timestamp)
	info.AddField("Modify_time", "modify_time", db.Timestamp)

	info.SetTable("fzzl.lease_repay_plan").SetTitle("LeaseRepayPlan").SetDescription("LeaseRepayPlan")

	formList := leaseRepayPlan.GetForm()
	formList.AddField("Pid", "pid", db.Int4, form.Number)
	formList.AddField("Cid", "cid", db.Int4, form.Number)
	formList.AddField("Period", "period", db.Int2, form.Text)
	formList.AddField("Plan_date", "plan_date", db.Date, form.Datetime)
	formList.AddField("Plan_amount", "plan_amount", db.Int8, form.Text)
	formList.AddField("Plan_principal", "plan_principal", db.Int8, form.Text)
	formList.AddField("Plan_interest", "plan_interest", db.Int8, form.Text)
	formList.AddField("Actual_date", "actual_date", db.Date, form.Datetime)
	formList.AddField("Actual_amount", "actual_amount", db.Int8, form.Text)
	formList.AddField("Actual_principal", "actual_principal", db.Int8, form.Text)
	formList.AddField("Actual_interest", "actual_interest", db.Int8, form.Text)
	formList.AddField("Create_time", "create_time", db.Timestamp, form.Datetime)
	formList.AddField("Modify_time", "modify_time", db.Timestamp, form.Datetime)

	formList.SetTable("fzzl.lease_repay_plan").SetTitle("LeaseRepayPlan").SetDescription("LeaseRepayPlan")

	return leaseRepayPlan
}