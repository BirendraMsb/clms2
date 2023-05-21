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
    public partial class fnf_settlement : System.Web.UI.Page
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
                
                ////   this.BindGrid();
                ////  Emp_Code();
                ///year();
                workorder();
                principal_employer();
            }
            //////txtYear.Text = DateTime.Now.ToString("yyyy");
            //-- convert date fromate-----//
            if (txtDateOfJoining.Text != "")
            {
                txtDateOfJoining.Text =Convert.ToDateTime(txtDateOfJoining.Text).ToString("MM-dd-yyyy");
            }
        }

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        private int Auto_ID()
        {
            int x = 0;

            string StrSql = "Select max(id) from tbl_full_final_settlement";
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

            return x;
        }

        private void workorder()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT distinct(work_order) FROM tbl_full_final_request where  hr_approval='Approved' and  vendor_code ='" + Session["User"].ToString() + "'";
           //// string query = "SELECT distinct(workorder) FROM tbl_attendance where  hr_approval='Approved' and dept_approval='Approved' and vendor_code ='" + Session["User"].ToString() + "'";
  
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlWorkOrder.DataSource = dt;
                        ddlWorkOrder.DataTextField = "work_order";
                        ddlWorkOrder.DataValueField = "work_order";
                        ddlWorkOrder.DataBind();
                    }
                }
            }
            ddlWorkOrder.Items.Insert(0, new ListItem("Select", "Select"));
        }

        private void emp_code()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT distinct(emp_code) FROM tbl_full_final_request where  work_order ='" + ddlWorkOrder.SelectedItem.Text + "'";
            ////  string query = "SELECT distinct(a.workorder),vendor_code FROM tbl_Attendance a,tbl_vendor_info v where vendor_code ='" + Session["User"].ToString() + "' ";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlEmpCode.DataSource = dt;
                        ddlEmpCode.DataTextField = "emp_code";
                        ddlEmpCode.DataValueField = "emp_code";
                        ddlEmpCode.DataBind();
                    }
                }
            }
             ddlEmpCode.Items.Insert(0, new ListItem("Select", "Select"));
        }

        private void principal_employer()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT principal_employer FROM tbl_principal_employer";
           

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlPrincipalEmployer.DataSource = dt;
                        ddlPrincipalEmployer.DataTextField = "principal_employer";
                        ddlPrincipalEmployer.DataValueField = "principal_employer";
                        ddlPrincipalEmployer.DataBind();
                    }
                }
            }
            ddlPrincipalEmployer.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void ShowEmpDetails()
        {
            txtPayOfGratuity.Text = gratuity().ToString();

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("select v.vendor_name,v.vendor_reg_code,f.emp_name,f.emp_code,f.department,f.last_working_day from tbl_full_final_request f,tbl_vendor_info v where  f.vendor_code=v.vendor_reg_code and f.work_order = v.work_worder and f.emp_code ='" + ddlEmpCode.SelectedItem.Text + "'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        txtEstVendor.Text = r["vendor_name"].ToString();
                        txtVendorCode.Text = r["vendor_reg_code"].ToString();
                        txtEmpName.Text = r["emp_name"].ToString();
                        txtGatePassNo.Text = r["emp_code"].ToString();
                        txtDepartment.Text = r["department"].ToString();
                        txtLastWorkingDay.Text = r["last_working_day"].ToString();
                    }

                    con.Close();
                }
            }
        }
        protected void ddlWorkOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            emp_code();

        }

        protected void ddlEmpCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowEmpDetails();
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            lblMsgError.Text = "";

            dbConnection();
            Auto_ID();

            string result = duplicate_record().ToString();
            if (duplicate_record())
            {
                lblMsgError.Text = "This record already exist";
                return;
            }
            try
            {
                var idd = txtID.Text;

                

                string Str = "insert into tbl_full_final_settlement(id, " + "work_order, " + " emp_code, " + "principal_employer, " + "establishment_vendor,  " + "vendor_code, " + "employee_name," + "gate_pass_no," + "Department ," + "date_of_joining," + "last_working_day," + "year_of_service," + "annual_bonus_prev_year," + "annual_bonus_current_year," + "pay_of_leave," + "pay_of_gratuity," + "notice_period_of_pay," + "last_month_salary," + "adv_deduction)";

                Str = Str + " values(" + idd + "," + "'" + ddlWorkOrder.SelectedItem.Text + "', " + "'" + ddlEmpCode.SelectedItem.Text + "', " + "'" + ddlPrincipalEmployer.SelectedItem.Text + "', " + "'" + txtEstVendor.Text + "', " + "'" + txtVendorCode.Text + "', " + "'" + txtEmpName.Text + "' , " + "'" + txtGatePassNo.Text + "', " + "'" + txtDepartment.Text + "',  " + "'" + txtDateOfJoining.Text + "', " + "'" + txtLastWorkingDay.Text + "', " + "'" + txtYearOfService.Text + "', " + "'" + txtAnnualBonusPrevYear.Text + "', " + "'" + txtAnnualBonusCurrYear.Text + "', " + "'" + txtPayOfLeave.Text + "', " + "'" + txtPayOfGratuity.Text + "', " + "'" + txtNoticePeriodOfPay.Text + "', " + "'" + txtLastMonthSalary.Text + "', " + "'" + txtAdvDeduction.Text + "')";

                SqlCommand cmd = new SqlCommand(Str, con);
                cmd.ExecuteNonQuery();

                lblMsg.Text = "Record Saved.......";


            }
            catch (Exception ex)
            {
                lblMsgError.Text = ex.Message;
            }

        }

        protected double gratuity()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("select v.vendor_name,v.vendor_reg_code,f.emp_name,f.emp_code,f.department,f.last_working_day from tbl_full_final_request f,tbl_vendor_info v where  f.vendor_code=v.vendor_reg_code and f.work_order = v.work_worder and f.emp_code ='" + ddlEmpCode.SelectedItem.Text + "'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        txtEstVendor.Text = r["vendor_name"].ToString();
                        txtVendorCode.Text = r["vendor_reg_code"].ToString();
                        txtEmpName.Text = r["emp_name"].ToString();
                        txtGatePassNo.Text = r["emp_code"].ToString();
                        txtDepartment.Text = r["department"].ToString();
                        txtLastWorkingDay.Text = r["last_working_day"].ToString();
                    }

                    con.Close();
                }
            }


            return 1000;
        }
        protected void clear_fields()
        {
            ddlWorkOrder.SelectedIndex = -1;
            ddlEmpCode.SelectedIndex = -1;
            ddlPrincipalEmployer.SelectedIndex = -1;
            txtEstVendor.Text = "";
            txtVendorCode.Text = "";
            txtEmpName.Text = "";
            txtGatePassNo.Text = "";
            txtDepartment.Text = "";
            txtDateOfJoining.Text = "";
            txtLastWorkingDay.Text = "";
            txtYearOfService.Text = "";
            txtAnnualBonusPrevYear.Text = "";
            txtAnnualBonusCurrYear.Text = "";
            txtPayOfLeave.Text = "";
            txtPayOfGratuity.Text = "";
            txtNoticePeriodOfPay.Text = "";
            txtLastMonthSalary.Text = "";
            txtAdvDeduction.Text = "";


        }
        protected bool duplicate_record()
        {
            bool x = false;

            string StrSql = "Select * from tbl_full_final_settlement where vendor_code='" + txtVendorCode.Text + "' and work_order='" + ddlWorkOrder.SelectedItem.Text + "' and emp_code='" + ddlEmpCode.SelectedItem.Text + "' ";
            SqlCommand cmd = new SqlCommand(StrSql, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if ((dr.Read()))
                {
                    if ((dr[0] == DBNull.Value))
                        return false;
                    else
                        return true;
                }
                else
                    return false;
            }
            catch (Exception ex)
            {
            }
            finally
            {
                dr.Close();
            }


            return x;
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            clear_fields();
        }
    }
}