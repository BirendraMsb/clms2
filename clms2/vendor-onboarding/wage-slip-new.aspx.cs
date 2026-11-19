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
    public partial class wage_slip_new : System.Web.UI.Page
    {
        //private int rcnt;
        //private string wrkord;
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"] != null ? Session["User"].ToString() : "";
            lblUser.Text = usrnm;
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            if (!IsPostBack)
            {
                workorder();
                year();
                Emp_Name_show();
            }
            dbConnection();

        }

        protected void year()
        {
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = 2010; i < currYear + 5; i++)
            {
                ddlYearSearch.Items.Add(i.ToString());
            }
            ListItem currentYearItem = ddlYearSearch.Items.FindByValue(System.DateTime.Now.Year.ToString());
            if (currentYearItem != null)
            {
                currentYearItem.Selected = true;
            }
        }

        private void workorder()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string u = Session["User"] != null ? Session["User"].ToString().Trim() : "";
            string query = "";
            if (!string.IsNullOrEmpty(u) && u.ToLower() != "admin" && u.ToLower() != "vendor")
            {
                query = "SELECT distinct(workorder) FROM tbl_attendance where hr_approval='Approved' and dept_approval='Approved' and vendor_code ='" + u + "'";
            }
            else
            {
                query = "SELECT distinct(workorder) FROM tbl_attendance where hr_approval='Approved' and dept_approval='Approved'";
            }

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count == 0 && !string.IsNullOrEmpty(u))
                        {
                            using (SqlDataAdapter sdaAll = new SqlDataAdapter("SELECT distinct(workorder) FROM tbl_attendance where hr_approval='Approved' and dept_approval='Approved'", con))
                            {
                                sdaAll.Fill(dt);
                            }
                        }
                        ddlWorkorder.DataSource = dt;
                        ddlWorkorder.DataTextField = "workorder";
                        ddlWorkorder.DataValueField = "workorder";
                        ddlWorkorder.DataBind();
                    }
                }
            }
            ddlWorkorder.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void Emp_Name_show()
        {
            dbConnection();

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "";
                string selectedWorkorder = (ddlWorkorder.SelectedItem != null && ddlWorkorder.SelectedItem.Text != "Select") ? ddlWorkorder.SelectedItem.Text.Trim() : "";

                if (!string.IsNullOrEmpty(selectedWorkorder))
                {
                    query = "SELECT distinct emp_code, emp_name FROM tbl_attendance WHERE hr_approval='Approved' and dept_approval='Approved' and workorder='" + selectedWorkorder + "' ORDER BY emp_name";
                }
                else
                {
                    string u = Session["User"] != null ? Session["User"].ToString().Trim() : "";
                    if (!string.IsNullOrEmpty(u) && u.ToLower() != "admin" && u.ToLower() != "vendor")
                    {
                        query = "SELECT distinct emp_code, emp_name FROM tbl_attendance WHERE hr_approval='Approved' and dept_approval='Approved' and vendor_code='" + u + "' ORDER BY emp_name";
                    }
                    else
                    {
                        query = "SELECT distinct emp_code, emp_name FROM tbl_attendance WHERE hr_approval='Approved' and dept_approval='Approved' ORDER BY emp_name";
                    }
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlEmpCodeSearch.DataSource = ds.Tables[0];
                        ddlEmpCodeSearch.DataTextField = "emp_name";
                        ddlEmpCodeSearch.DataValueField = "emp_code";
                        ddlEmpCodeSearch.DataBind();
                    }
                }
            }
            ddlEmpCodeSearch.Items.Insert(0, new ListItem("--Select Emp Name--", "0"));
        }

        public void WageSlipDetails()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string selectedWorkorder = (ddlWorkorder.SelectedItem != null && ddlWorkorder.SelectedItem.Text != "Select") ? ddlWorkorder.SelectedItem.Text.Trim() : "";
                string selectedEmpCode = (ddlEmpCodeSearch.SelectedValue != null && ddlEmpCodeSearch.SelectedValue != "0") ? ddlEmpCodeSearch.SelectedValue.Trim() : "";
                string u = Session["User"] != null ? Session["User"].ToString().Trim() : "";

                string query = "select vi.vendor_name ,vi.firm_address, a.emp_name as Name_of_Workman,vo.nature_of_work,vo.job_location,a.year1 , a.month1 , a.present as no_of_days_workdone, a.monthly_ot_hrs as ot_hrs, e.basic as daily_basic, e.allowance as daily_other_allowance, cast(e.basic*a.present + e.allowance * a.present as decimal(10,2))  as basic_earnings , e.allowance *0 as other_allowance_earnings,cast(a.monthly_ot_hrs * e.[basic]/8 as decimal(10,2))  as ot_earning , cast((e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0) as decimal(10,2)) as total_earnings , cast((a.Present * (e.basic +e.allowance) ) * 12/100 as decimal(10,2)) as PF_Deduction , cast( (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as decimal(10,2) )as ESIC_deduction , e.other_deduction , cast( (((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction) as decimal(10,2)) as total_duduction ,cast( (((e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0)) - ((((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction))) as decimal(10,2)) as total_payable,a.sign from tbl_attendance a,tbl_emp e,tbl_vendor_work_order vo ,tbl_vendor_info vi  where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.workorder = vo.work_worder and a.workorder=vi.work_worder  and a.hr_approval='Approved' and a.dept_approval='Approved'  and a.month1='" + ddlMonthSearch.SelectedValue + "' and a.year1='" + ddlYearSearch.SelectedItem.Text + "'";

                if (!string.IsNullOrEmpty(selectedWorkorder))
                {
                    query += " and a.workorder='" + selectedWorkorder + "'";
                }

                if (!string.IsNullOrEmpty(selectedEmpCode))
                {
                    query += " and a.emp_code='" + selectedEmpCode + "'";
                }

                if (!string.IsNullOrEmpty(u) && u.ToLower() != "admin" && u.ToLower() != "vendor")
                {
                    query += " and a.vendor_code='" + u + "'";
                }

                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        lblVendorName.Text = r["vendor_name"].ToString();
                        lblFirnAddress.Text = r["firm_address"].ToString();

                        lblNameOfWorkMan.Text = r["Name_of_Workman"].ToString();
                        lblNatueOfWork.Text = r["nature_of_work"].ToString();
                        lblJobLocation.Text = r["job_location"].ToString();

                        lblYear1.Text = r["year1"].ToString();
                        lblMonth1.Text = r["month1"].ToString();
                        lblNoOfDayWorkDone.Text = r["no_of_days_workdone"].ToString();

                        lblDailyBasic.Text = r["daily_basic"].ToString();
                        lblOtEaning.Text = r["ot_earning"].ToString();

                        lblTotalEarning.Text = r["total_earnings"].ToString();
                        lblTotalDeduction.Text = r["total_duduction"].ToString();
                        lblTotPayable.Text = r["total_payable"].ToString();

                    }
                    else
                    {
                        clear_pay_slip_fields();
                    }


                    con.Close();
                }
            }
        }

        protected  void clear_pay_slip_fields()
        {
            lblVendorName.Text = "";
            lblFirnAddress.Text = "";

            lblNameOfWorkMan.Text = "";
            lblNatueOfWork.Text = "";
            lblJobLocation.Text = "";

            lblYear1.Text = "";
            lblMonth1.Text = "";
            lblNoOfDayWorkDone.Text = "";

            lblDailyBasic.Text = "";
            lblOtEaning.Text = "";

            lblTotalEarning.Text = "";
            lblTotalDeduction.Text = "";
            lblTotPayable.Text = "";
        }

        protected void ddlWorkorder_SelectedIndexChanged(object sender, EventArgs e)
        {
            Emp_Name_show();
        }

        protected void btnProcess_Click(object sender, EventArgs e)
        {
            WageSlipDetails();
        }
    }
}
