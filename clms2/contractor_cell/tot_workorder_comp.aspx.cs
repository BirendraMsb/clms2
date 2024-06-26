﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.contractor_cell
{
    public partial class tot_workorder_comp : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            if (!this.IsPostBack)
            {
                CreateEmptyTable();
                ////   this.BindGrid();
                ////  Emp_Code();
                year();
                VendorCode();
            }
            //////txtYear.Text = DateTime.Now.ToString("yyyy");

        }

        protected void year()
        {
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = 2010; i < currYear + 5; i++)
            {
                ddlYear.Items.Add(i.ToString());
            }
            ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;
        }

        private void VendorCode()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

                string query = "SELECT distinct(a.workorder),a.vendor_code FROM tbl_Attendance a,tbl_vendor_info v where a.vendor_code = v.vendor_reg_code ";
            /////string query = "SELECT distinct(a.workorder),vendor_code FROM tbl_Attendance a,tbl_vendor_info v where vendor_code ='" + Session["User"].ToString() + "' ";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlVendorCode.DataSource = dt;
                        ddlVendorCode.DataTextField = "vendor_code";
                        ddlVendorCode.DataValueField = "vendor_code";
                        ddlVendorCode.DataBind();
                    }
                }
            }
            ddlVendorCode.Items.Insert(0, new ListItem("Select", "Select"));
        }
        private void CreateEmptyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[16] {new DataColumn("vendor_code",typeof(string)),
            new DataColumn("workorder",typeof(string)),
            new DataColumn("month1",typeof(string)),
            new DataColumn("department",typeof(string)),
             new DataColumn("tot_emp",typeof(string)),
            new DataColumn("no_of_workdone",typeof(string)),
            new DataColumn("daily_rate_of_wages",typeof(string)),
            new DataColumn("Basic",typeof(string)),
            new DataColumn("DA",typeof(string)),
            new DataColumn("overtime",typeof(string)),
            new DataColumn("other_case_payment",typeof(string)),
            new DataColumn("total",typeof(string)),
            new DataColumn("pf_deduction",typeof(string)),
            new DataColumn("esic_deduction",typeof(string)),
            new DataColumn("other_deduction",typeof(string)),
            new DataColumn("net_amount_paid",typeof(string)),
            //new DataColumn("signature",typeof(string)),
            //new DataColumn("intial_contractor",typeof(string)),
           
            });



            ////----------------------------------//
            //string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            ////string query = "SELECT emp_code,emp_name,date,in_time,out_time FROM tbl_manual_punch";
            //string query = "SELECT emp_code,emp_name,basic FROM tbl_emp where vendor_code ='" + Session["User"].ToString() + "' ";
            //DataTable dt_emp;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
            //    {
            //        using (dt_emp = new DataTable())
            //        {

            //            sda.Fill(dt_emp);
            //            string MyString = dt_emp.Rows[0].ItemArray[0].ToString();
            //            //GridView2.DataSource = dt;
            //            //GridView2.DataBind();
            //        }
            //    }
            //}


            //------------------------------------//

            // int dtEmpRowCount = dt_emp.Rows.Count;
            int dtEmpRowCount = 3;
            int dtEmpColCount = 2;
            DataRow dr;
            for (int i = 0; i < dtEmpRowCount; i++)
            {
                dr = dt.NewRow();
                for (int j = 0; j < dtEmpColCount; j++)
                {

                    //  string MyString = dt_emp.Rows[i].ItemArray[j].ToString();

                    // dr[j] = dt_emp.Rows[i].ItemArray[j].ToString();
                    dr[1] = string.Empty;
                    dr[0] = string.Empty;
                    dr[2] = string.Empty;
                    dr[3] = string.Empty;
                    dr[4] = string.Empty;
                    dr[5] = string.Empty;
                    dr[6] = string.Empty;
                    dr[7] = string.Empty;
                    dr[8] = string.Empty;
                    dr[9] = string.Empty;
                    dr[10] = string.Empty;
                    dr[11] = string.Empty;
                    dr[12] = string.Empty;
                    dr[13] = string.Empty;
                    dr[14] = string.Empty;
                    dr[15] = string.Empty;
                    //dr[16] = string.Empty;
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        private void BindTableInGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[16] { new DataColumn("vendor_code",typeof(string)),
            new DataColumn("workorder",typeof(string)),
            new DataColumn("month1",typeof(string)),
            new DataColumn("department",typeof(string)),
             new DataColumn("tot_emp",typeof(string)),
            new DataColumn("no_of_workdone",typeof(string)),
            new DataColumn("daily_rate_of_wages",typeof(string)),
            new DataColumn("Basic",typeof(string)),
            new DataColumn("DA",typeof(string)),
            new DataColumn("overtime",typeof(string)),
            new DataColumn("other_case_payment",typeof(string)),
            new DataColumn("total",typeof(string)),
            new DataColumn("pf_deduction",typeof(string)),
            new DataColumn("esic_deduction",typeof(string)),
            new DataColumn("other_deduction",typeof(string)),
            new DataColumn("net_amount_paid",typeof(string)),
            //new DataColumn("signature",typeof(string)),
            //new DataColumn("intial_contractor",typeof(string)),
           
            });

            //----------------------------------//
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            //string query = "SELECT emp_code,emp_name,date,in_time,out_time FROM tbl_manual_punch";
            // string query = "SELECT emp_code,emp_name,designation FROM tbl_emp where vendor_code ='" + Session["User"].ToString() + "' ";
            //string query = "SELECT emp_code,emp_name,designation,no_of_workdone,unit_of_workdone,daily_rate_of_wages,Basic,DA,overtime," +
            //"other_case_payment,total,pf_deduction,esic_deduction,other_deduction,net_amount_paid,signature,signature,intial_contractor FROM tbl_form16 ";
            ///string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone,a.present as unit_of_workdone,e.[basic]/8 as daily_rate_of_wages , a.Present * e.basic as Basic_wages, e.basic*0 as Dearness_Allowances ,a.monthly_ot_hrs * e.[basic]/8 as overtime ,e.allowance as other_cash_payment,(a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance as Total , (a.Present * e.basic ) * 12/100 as PF_Deduction , ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100 as ESIC_deduction,other_deduction,((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) -( ((a.Present * e.basic ) * 12/100 ) + ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100 ) as Net_Amount_Paid,a.sign,a.initial_contr_or_rep  from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code";
            ///string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone,a.present as unit_of_workdone,e.[basic]/8 as daily_rate_of_wages , a.Present * e.basic as Basic_wages, e.basic*0 as Dearness_Allowances ,a.monthly_ot_hrs * e.[basic]/8 as overtime ,e.allowance as other_cash_payment,(a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance as Total , (a.Present * e.basic ) * 12/100 as PF_Deduction , ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100 as ESIC_deduction,e.other_deduction, (((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) - ((a.Present * e.basic ) * 12/100 ) - ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100) - e.other_deduction  as Net_Amount_Paid,a.sign,a.initial_contr_or_rep  from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "' and a.workorder='" + ddlWorkdOrder.SelectedItem.Text + "' and a.vendor_code='" + Session["User"].ToString() + "' ";
            //// string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone,a.present as unit_of_workdone,e.[basic]/8 as daily_rate_of_wages , (( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction as Basic_wages, e.basic*0 as Dearness_Allowances ,a.monthly_ot_hrs * e.[basic]/8 as overtime ,e.allowance as other_cash_payment,(( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction  + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance as Total , (a.Present * (e.basic +e.allowance) ) * 12/100 as PF_Deduction , (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as ESIC_deduction,e.other_deduction, (((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) - ((a.Present * e.basic ) * 12/100 ) - ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100) - e.other_deduction  as Net_Amount_Paid,a.sign,a.initial_contr_or_rep  from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code and a.workorder = e.workorderno  and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "'  and a.vendor_code='" + Session["User"].ToString() + "' ";
            ///string query = "select a.vendor_code,a.workorder,e.department,v.workers_authorised as tot_emp,a.present as no_of_days_workdone ,e.[basic]/8 as daily_rate_of_wages , (( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction as Basic_wages, e.basic*0 as Dearness_Allowances ,a.monthly_ot_hrs * e.[basic]/8 as overtime ,e.allowance as other_cash_payment,(( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction  + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance as Total , (a.Present * (e.basic +e.allowance) ) * 12/100 as PF_Deduction , (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as ESIC_deduction,e.other_deduction, (((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) - ((a.Present * e.basic ) * 12/100 ) - ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100) - e.other_deduction  as Net_Amount_Paid,a.sign,a.initial_contr_or_rep  from tbl_attendance a,tbl_emp e,tbl_vendor_info v where  a.emp_code = e.emp_code and a.workorder = e.workorderno and a.workorder= v.work_worder   and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "'  and a.vendor_code='" + Session["User"].ToString() + "' ";
            /// string query = "select a.vendor_code,a.workorder,a.month1,e.department,v.workers_authorised as tot_emp,a.present as no_of_days_workdone ,e.[basic]/8 as daily_rate_of_wages , (( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction as Basic_wages, e.basic*0 as Dearness_Allowances ,a.monthly_ot_hrs * e.[basic]/8 as overtime ,e.allowance as other_cash_payment,(( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction  + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance as Total , (a.Present * (e.basic +e.allowance) ) * 12/100 as PF_Deduction , (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as ESIC_deduction,e.other_deduction, (((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) - ((a.Present * e.basic ) * 12/100 ) - ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100) - e.other_deduction  as Net_Amount_Paid,a.sign,a.initial_contr_or_rep  from tbl_attendance a,tbl_emp e,tbl_vendor_info v where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.workorder= v.work_worder and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "'  and a.vendor_code='" + Session["User"].ToString() + "' ";  // withouth grouping
            string query = "select  a.vendor_code,a.workorder,a.month1,e.department,sum(v.workers_authorised) as tot_emp,sum(a.present) as no_of_days_workdone ,cast(sum(e.[basic]/8) as decimal(10,2)) as daily_rate_of_wages, cast(sum( (( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction)as decimal(10,2)) as Basic_wages,sum(e.basic*0) as Dearness_Allowances , cast(sum(a.monthly_ot_hrs * e.[basic]/8)as decimal(10,2)) as overtime,sum(e.allowance) as other_cash_payment, cast(sum((( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction  + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) as decimal(10,2)) as Total, cast(sum((a.Present * (e.basic +e.allowance) ) * 12/100) as decimal(10,2)) as PF_Deduction, cast(sum((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) as decimal(10,2)) as ESIC_deduction,sum(e.other_deduction) as other_deduction, cast(sum((((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) - ((a.Present * e.basic ) * 12/100 ) - ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100) - e.other_deduction) as decimal(10,2))  as Net_Amount_Paid   from tbl_attendance a,tbl_emp e,tbl_vendor_info v where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.workorder= v.work_worder  and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "'  and a.vendor_code='" + ddlVendorCode.SelectedItem.Text + "' group by a.vendor_code,a.workorder,a.month1,e.department";
           //// string query = "select a.vendor_code,count(a.emp_code) as no_of_emp_paid, a.month1,sum(a.present) as no_of_days_workdone ,cast(sum(e.[basic]/8) as decimal(10,2)) as daily_rate_of_wages, cast(sum( (( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction)as decimal(10,2)) as Basic_wages,sum(e.basic*0) as Dearness_Allowances , cast(sum(a.monthly_ot_hrs * e.[basic]/8)as decimal(10,2)) as overtime,sum(e.allowance) as other_cash_payment, cast(sum((( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction  + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) as decimal(10,2)) as Total, cast(sum((a.Present * (e.basic +e.allowance) ) * 12/100) as decimal(10,2)) as PF_Deduction, cast(sum((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) as decimal(10,2)) as ESIC_deduction,sum(e.other_deduction) as other_deduction, cast(sum((((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) - ((a.Present * e.basic ) * 12/100 ) - ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100) - e.other_deduction) as decimal(10,2))  as Net_Amount_Paid   from tbl_attendance a,tbl_emp e where e.emp_code = a.emp_code and a.vendor_code = e.vendor_code  and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "'  and a.vendor_code='" + ddlVendorCode.SelectedItem.Text + "' group by a.vendor_code,a.month1";
           
            
            DataTable dt1;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (dt1 = new DataTable())
                    {

                        sda.Fill(dt1);
                        if (dt1.Rows.Count > 0)
                        {
                            string MyString = dt1.Rows[0].ItemArray[0].ToString();
                            //GridView2.DataSource = dt;
                            //GridView2.DataBind();
                        }
                        else
                        {
                            CreateEmptyTable();
                            ////GridView2.DataSource = null;
                            ////GridView2.DataBind();
                            return;
                        }

                    }
                }
            }


            //------------------------------------//

            int dtEmpRowCount = dt1.Rows.Count;
            int dtEmpColCount = 16;
            DataRow dr;
            for (int i = 0; i < dtEmpRowCount; i++)
            {
                dr = dt.NewRow();
                for (int j = 0; j < dtEmpColCount; j++)
                {
                    string MyString = dt1.Rows[i].ItemArray[j].ToString();

                    dr[j] = dt1.Rows[i].ItemArray[j].ToString();

                    ////dr[2] = string.Empty;
                    //dr[3] = string.Empty;
                    //dr[4] = string.Empty;
                    //dr[5] = string.Empty;
                    //dr[6] = string.Empty;
                    //dr[7] = string.Empty;
                    //dr[8] = string.Empty;
                    //dr[9] = string.Empty;
                    //dr[10] = string.Empty;
                    //dr[11] = string.Empty;
                    //dr[12] = string.Empty;
                    //dr[13] = string.Empty;
                    //dr[14] = string.Empty;
                    //dr[15] = string.Empty;
                    //dr[16] = string.Empty;
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();

        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT emp_code,emp_name,date,in_time,out_time FROM tbl_manual_punch";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                }
            }
        }
        int GetDaysInMonth(int month, int year)
        {
            if (month < 1 || month > 12)
            {
                throw new System.ArgumentOutOfRangeException("month", month, "month mustbe between 1 and 12");
            }
            if (1 == month || 3 == month || 5 == month || 7 == month || 8 == month ||
            10 == month || 12 == month)
            {
                return 31;
            }
            else if (2 == month)
            {
                // Check for leap year
                if (0 == (year % 4))
                {
                    // If date is divisible by 400, it's a leap year.
                    // Otherwise, if it's divisible by 100 it's not.
                    if (0 == (year % 400))
                    {
                        return 29;
                    }
                    else if (0 == (year % 100))
                    {
                        return 28;
                    }

                    // Divisible by 4 but not by 100 or 400
                    // so it leaps
                    return 29;
                }
                // Not a leap year
                return 28;
            }
            return 30;
        }
        private int Auto_ID()
        {
            int x = 0;
            string StrSql = "Select max(id) from tbl_emp";
            SqlCommand cmd = new SqlCommand(StrSql, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if ((dr.Read()))
                {
                    if ((dr[0] == DBNull.Value))
                        txtID.Text = "1";
                    else
                        txtID.Text = (Convert.ToInt16(dr[0]) + 1).ToString();
                }
                else
                    txtID.Text = "1";
            }
            catch (Exception ex)
            {
            }
            dr.Close();
            x = Convert.ToInt16(txtID.Text);
            return x;
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            BindTableInGrid();
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            // diplaying calender 
            if (ddlMonth.SelectedItem.Text != "Select")
            {
                DateTime dt = DateTime.Now;
                int year = Convert.ToInt32(ddlYear.SelectedItem.Text);   //Convert.ToInt32(DateTime.Now.Year);
                int month = Convert.ToInt32(ddlMonth.SelectedValue);
                int days = GetDaysInMonth(month, year);

                // int days = GetDaysInMonth(Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(DateTime.Now.Year));


                // string dayname = DateTime.Now.DayOfWeek();
                DataTable myDT = new DataTable();
                //myDT.Columns.Add("Emp_Code",typeof(String));
                //myDT.Columns.Add("Emp_Name", typeof(String));

                for (int i = 1; i <= days; i++)
                {
                    // DataColumn id = new DataColumn("Day-");
                    DataColumn id = new DataColumn();
                    id.ColumnName = id + i.ToString();
                    // id.DataType = System.Type.GetType("System.Int32");
                    id.DataType = System.Type.GetType("System.String");
                    myDT.Columns.Add(id);

                }

                //for (int i = 1; i <= 1; i++)
                //{
                //    DataRow dr = myDT.NewRow();
                //    for (int ii = 0; ii < days; ii++)
                //    {
                //        dr[ii] = (ii+1).ToString();
                //    }
                //    myDT.Rows.Add(dr);
                //}

                for (int i = 1; i <= 1; i++)
                {
                    DataRow dr = myDT.NewRow();

                    for (int ii = 0; ii < days; ii++)
                    {
                        string dayname = (Convert.ToDateTime((ii + 1).ToString() + "-" + month.ToString() + "-" + year.ToString())).ToString("ddd");
                        dr[ii] = dayname;
                        //  dr[ii] = (ii + 1).ToString()+ "-" + month.ToString()+ "-" + year.ToString();
                        // dr[ii] = "bk";
                    }
                    myDT.Rows.Add(dr);
                }

                //GridView1.DataSource = myDT;
                //GridView1.DataBind();
            }

        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}