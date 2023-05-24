using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.vendor_onboarding
{
    public partial class payroll_process : System.Web.UI.Page
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
                workorder();
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

        private void workorder()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT distinct(workorder) FROM tbl_attendance where  hr_approval='Approved' and dept_approval='Approved' and vendor_code ='" + Session["User"].ToString() + "'";
          ////  string query = "SELECT distinct(a.workorder),vendor_code FROM tbl_Attendance a,tbl_vendor_info v where vendor_code ='" + Session["User"].ToString() + "' ";
           
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlWorkdOrder.DataSource = dt;
                        ddlWorkdOrder.DataTextField = "workorder";
                        ddlWorkdOrder.DataValueField = "workorder";
                        ddlWorkdOrder.DataBind();
                    }
                }
            }
            ddlWorkdOrder.Items.Insert(0, new ListItem("Select", "Select"));
        }
        private void CreateEmptyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[17] { new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("designation",typeof(string)),
            new DataColumn("no_of_days_workdone",typeof(string)),
            new DataColumn("ot_hrs",typeof(string)),
            new DataColumn("daily_Basic",typeof(string)),
            new DataColumn("daily_other_allowance",typeof(string)),
            new DataColumn("basic_earnings",typeof(string)),
            new DataColumn("other_allowance_earnings",typeof(string)),
            new DataColumn("ot_earnings",typeof(string)),
            new DataColumn("total_earnings",typeof(string)),
            new DataColumn("pf_contribution",typeof(string)),
            new DataColumn("esic",typeof(string)),
            new DataColumn("other_deduction",typeof(string)),
            new DataColumn("total_deduction",typeof(string)),
            new DataColumn("total_payable",typeof(string)),
            new DataColumn("signature",typeof(string)),
           
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
                    dr[0] = string.Empty;
                    dr[1] = string.Empty;
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
                    dr[16] = string.Empty;
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        private void BindTableInGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[17] { new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("designation",typeof(string)),
            new DataColumn("no_of_days_workdone",typeof(string)),
            new DataColumn("ot_hrs",typeof(string)),
            new DataColumn("daily_Basic",typeof(string)),
            new DataColumn("daily_other_allowance",typeof(string)),
            new DataColumn("basic_earnings",typeof(string)),
            new DataColumn("other_allowance_earnings",typeof(string)),
            new DataColumn("ot_earnings",typeof(string)),
            new DataColumn("total_earnings",typeof(string)),
            new DataColumn("pf_contribution",typeof(string)),
            new DataColumn("esic",typeof(string)),
            new DataColumn("other_deduction",typeof(string)),
            new DataColumn("total_deduction",typeof(string)),
            new DataColumn("total_payable",typeof(string)),
            new DataColumn("signature",typeof(string)),
           
            });

            //----------------------------------//
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            //string query = "SELECT emp_code,emp_name,date,in_time,out_time FROM tbl_manual_punch";
            // string query = "SELECT emp_code,emp_name,designation FROM tbl_emp where vendor_code ='" + Session["User"].ToString() + "' ";
            //string query = "SELECT emp_code,emp_name,designation,no_of_workdone,unit_of_workdone,daily_rate_of_wages,Basic,DA,overtime," +
            //"other_case_payment,total,pf_deduction,esic_deduction,other_deduction,net_amount_paid,signature,signature,intial_contractor FROM tbl_form16 ";
            ///string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone,a.present as unit_of_workdone,e.[basic]/8 as daily_rate_of_wages , a.Present * e.basic as Basic_wages, e.basic*0 as Dearness_Allowances ,a.monthly_ot_hrs * e.[basic]/8 as overtime ,e.allowance as other_cash_payment,(a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance as Total , (a.Present * e.basic ) * 12/100 as PF_Deduction , ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100 as ESIC_deduction,other_deduction,((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) -( ((a.Present * e.basic ) * 12/100 ) + ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100 ) as Net_Amount_Paid,a.sign,a.initial_contr_or_rep  from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code";
           //// string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone,a.present as unit_of_workdone,e.[basic]/8 as daily_rate_of_wages , a.Present * e.basic as Basic_wages, e.basic*0 as Dearness_Allowances ,a.monthly_ot_hrs * e.[basic]/8 as overtime ,e.allowance as other_cash_payment,(a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance as Total , (a.Present * e.basic ) * 12/100 as PF_Deduction , ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100 as ESIC_deduction,e.other_deduction, (((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) - ((a.Present * e.basic ) * 12/100 ) - ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100) - e.other_deduction  as Net_Amount_Paid,a.sign,a.initial_contr_or_rep  from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "' and a.workorder='" + ddlWorkdOrder.SelectedItem.Text + "' and a.vendor_code='" + Session["User"].ToString() + "' ";
          ///  a.monthly_ot_hrs * e.[basic]/8 as ot_earning ,e.allowance as other_cash_payment,(a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance as Total , (a.Present * (e.basic +e.allowance) ) * 12/100 as PF_Deduction , (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as ESIC_deduction,e.other_deduction, (( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction  as wage,a.sign,a.initial_contr_or_rep  from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.hr_approval='Approved' and a.dept_approval='Approved' and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "' and a.workorder='" + ddlWorkdOrder.SelectedItem.Text + "' and a.vendor_code='" + Session["User"].ToString() + "' ";
          ///  --------------------------------------------------------------------------------------------------//
            /// (e.basic*a.present + e.allowance * a.present) as basic_earnings
            ///  a.monthly_ot_hrs * e.[basic]/8 as ot_earning
            ///  e.allowance *0 as other_allowance_earnings
            ///  Total Earning = basic_earnings + other_allowance_earnings + ot_earning
            ///  (e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0) as total_earnings 
            ///  (a.Present * (e.basic +e.allowance) ) * 12/100 as PF_Deduction
            ///  (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as ESIC_deduction
            ///  Total Deduction = Pf contribution + ESIC + Other deduction 
            ///  (((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction) as total_duduction
            ///  Total Payable = Total Earning - Total deduction
            ///  (((e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0)) - ((((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction))) as total_payable
            ////string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone,a.monthly_ot_hrs as ot_hrs, e.basic as daily_basic, e.allowance as daily_other_allowance,(e.basic*a.present + e.allowance * a.present) as basic_earnings , e.allowance *0 as other_allowance_earnings, a.monthly_ot_hrs * e.[basic]/8 as ot_earning ,(e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0) as total_earnings, (a.Present * (e.basic +e.allowance) ) * 12/100 as PF_Deduction , (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as ESIC_deduction,e.other_deduction, (((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction) as total_duduction,(((e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0)) - ((((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction))) as total_payable,a.sign from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.hr_approval='Approved' and a.dept_approval='Approved' and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "' and a.workorder='" + ddlWorkdOrder.SelectedItem.Text + "' and a.vendor_code='" + Session["User"].ToString() + "' ";
            string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone,a.monthly_ot_hrs as ot_hrs, e.basic as daily_basic, e.allowance as daily_other_allowance, cast(e.basic*a.present + e.allowance * a.present as decimal(10,2))  as basic_earnings , e.allowance *0 as other_allowance_earnings,cast(a.monthly_ot_hrs * e.[basic]/8 as decimal(10,2))  as ot_earning , cast((e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0) as decimal(10,2)) as total_earnings , cast((a.Present * (e.basic +e.allowance) ) * 12/100 as decimal(10,2)) as PF_Deduction , cast( (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as decimal(10,2) )as ESIC_deduction , e.other_deduction , cast( (((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction) as decimal(10,2)) as total_duduction ,cast( (((e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0)) - ((((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction))) as decimal(10,2)) as total_payable,a.sign from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.hr_approval='Approved' and a.dept_approval='Approved'  and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "' and a.workorder='" + ddlWorkdOrder.SelectedItem.Text + "' and a.vendor_code='" + Session["User"].ToString() + "' ";

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
            int dtEmpColCount = 17;
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
            //string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            //string query = "SELECT emp_code,emp_name,date,in_time,out_time FROM tbl_manual_punch";
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
            //    {
            //        using (DataTable dt = new DataTable())
            //        {
            //            sda.Fill(dt);
            //            GridView2.DataSource = dt;
            //            GridView2.DataBind();
            //        }
            //    }
            //}
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

        protected void cmdProcess_Click(object sender, EventArgs e)
        {
            BindTableInGrid();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}