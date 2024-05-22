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
    public partial class annual_bonus : System.Web.UI.Page
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
                year1();
                year2();
                workorder();
               //// per_of_bonus();
            }
            //////txtYear.Text = DateTime.Now.ToString("yyyy");
        }

        protected void year1()
        {
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = currYear-1; i < currYear + 1; i++)
            {
                ddlYearFrom.Items.Add(i.ToString());
            }
            //ddlYearFrom.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;
        }

        protected void year2()
        {
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = currYear; i < currYear + 2; i++)
            {
                ddlYearTo.Items.Add(i.ToString());
            }
            ddlYearTo.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;
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

        //private void per_of_bonus()
        //{
        //    string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

        //    string query = "SELECT * FROM tbl_bonus_percent ";
          

        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
        //        {
        //            using (DataTable dt = new DataTable())
        //            {
        //                sda.Fill(dt);
        //                //ddlBonusPercent.DataSource = dt;
        //                //ddlBonusPercent.DataTextField = "per_of_bonus";
        //                //ddlBonusPercent.DataValueField = "per_of_bonus";
        //                //ddlBonusPercent.DataBind();
        //            }
        //        }
        //    }
        //    //ddlBonusPercent.Items.Insert(0, new ListItem("Select", "Select"));
        //}
        private void CreateEmptyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[8] { new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("designation",typeof(string)),
            new DataColumn("no_of_workdone",typeof(string)),
            //new DataColumn("unit_of_workdone",typeof(string)),
            new DataColumn("daily_rate_of_wages",typeof(string)),
           // new DataColumn("daily_other_allowance",typeof(string)),
            new DataColumn("Basic_earning",typeof(string)),
            //new DataColumn("DA",typeof(string)),
            //new DataColumn("overtime",typeof(string)),
            //new DataColumn("other_case_payment",typeof(string)),
            //new DataColumn("total",typeof(string)),
            //new DataColumn("pf_deduction",typeof(string)),
            //new DataColumn("esic_deduction",typeof(string)),
            //new DataColumn("other_deduction",typeof(string)),
            //new DataColumn("wage",typeof(string)),
            new DataColumn("bonus_per",typeof(string)),
            new DataColumn("bonus_payable",typeof(string)),
            //new DataColumn("signature",typeof(string)),
            //new DataColumn("intial_contractor",typeof(string)),
           
            });

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
                    //dr[8] = string.Empty;
                
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        private void BindTableInGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[8] { new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("designation",typeof(string)),
            new DataColumn("no_of_workdone",typeof(string)),
            //new DataColumn("unit_of_workdone",typeof(string)),
            new DataColumn("daily_rate_of_wages",typeof(string)),
           // new DataColumn("daily_other_allowance",typeof(string)),
            new DataColumn("Basic_earning",typeof(string)),
            //new DataColumn("DA",typeof(string)),
            //new DataColumn("overtime",typeof(string)),
            //new DataColumn("other_case_payment",typeof(string)),
            //new DataColumn("total",typeof(string)),
            //new DataColumn("pf_deduction",typeof(string)),
            //new DataColumn("esic_deduction",typeof(string)),
            //new DataColumn("other_deduction",typeof(string)),
            //new DataColumn("wage",typeof(string)),
            new DataColumn("bonus_per",typeof(string)),
            new DataColumn("bonus_payable",typeof(string)),
            //new DataColumn("signature",typeof(string)),
            //new DataColumn("intial_contractor",typeof(string)),
           
            });

            //----------------------------------//
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            double bonus_per = 0;
            bonus_per = Convert.ToDouble(txtBonusPercent.Text);
            int month_from = 4;
            int month_to = 12;
            int year_from = Convert.ToInt16(ddlYearFrom.Text);
            int year_to = Convert.ToInt16(ddlYearTo.Text);
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
            //string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone, e.basic as daily_basic, e.allowance as daily_other_allowance, cast(e.basic*a.present + e.allowance * a.present as decimal(10,2))  as basic_earnings ,cast((e.basic*a.present + e.allowance * a.present) * 8.33/100 as decimal(10,2)) as bonus_per_amt,cast((e.basic*a.present + e.allowance * a.present) * 8.33/100 as decimal(10,2)) as bonus_pay from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.hr_approval='Approved' and a.dept_approval='Approved'  and a.month1='" + ddlMonthFrom.SelectedValue + "' and a.year1='" + ddlYearFrom.SelectedItem.Text + "' and a.workorder='" + ddlWorkdOrder.SelectedItem.Text + "' and a.vendor_code='" + Session["User"].ToString() + "' ";  
            ////string query = "select a.emp_code,a.emp_name as Name_of_Workman,e.designation,a.present as no_of_days_workdone,e.basic as daily_basic, cast(e.basic*a.present  as decimal(10,2))  as basic_earnings ," + bonus_per + "  as bonus_per, cast((e.basic*a.present) * " + bonus_per/100 + " as decimal(10,2)) as bonus_pay from tbl_attendance a,tbl_emp e where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.hr_approval='Approved' and a.dept_approval='Approved'   and a.workorder='" + ddlWorkdOrder.SelectedItem.Text + "' and a.vendor_code='" + Session["User"].ToString() + "' ";  //and a.month1='" + ddlMonthFrom.SelectedValue + "' and a.year1='" + ddlYearFrom.SelectedItem.Text + "'
            string query = "select a.emp_code,a.emp_name,e.designation , sum(Present) as no_of_days_workdone,e.basic as daily_basic,cast(e.basic* sum(present)  as decimal(10,2)) as basic_earnings ," + bonus_per + "  as bonus_per,cast((e.basic* sum(present)) * " + bonus_per / 100 + "  as decimal(10,2)) as bonus_pay  from tbl_attendance a, tbl_emp e  where a.emp_code=e.emp_code and a.workorder = e.workorderno and a.hr_approval='Approved' and a.dept_approval='Approved' and a.workorder='" + ddlWorkdOrder.SelectedItem.Text + "' and a.month1 between  " + month_from + "  and  " + month_to + "  and year1 between " + year_from + " and " + year_to + "  group by a.emp_code ,a.emp_name,e.designation,e.basic ";


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
            int dtEmpColCount = 8;
            DataRow dr;
            for (int i = 0; i < dtEmpRowCount; i++)
            {
                dr = dt.NewRow();
                for (int j = 0; j < dtEmpColCount; j++)
                {
                    string MyString = dt1.Rows[i].ItemArray[j].ToString();

                    dr[j] = dt1.Rows[i].ItemArray[j].ToString();

                    ////dr[2] = string.Empty;
           
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();

        }

        protected void cmdProcess_Click(object sender, EventArgs e)
        {
            BindTableInGrid();
        }



        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}