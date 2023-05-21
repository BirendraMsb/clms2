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
    public partial class fnf_request : System.Web.UI.Page
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
               ///// emp_code();
                workorder();
                reason_for_separation();
                Auto_ID();
            }
          txtDateOfRequest.Text = DateTime.Now.ToString("dd-MM-yyyy");
            
        }

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        private int Auto_ID()
        {
            int x = 0;

            string StrSql = "Select max(id) from tbl_full_final_request";
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

            string query = "SELECT distinct(workorder) FROM tbl_attendance where  hr_approval='Approved' and dept_approval='Approved' and vendor_code ='" + Session["User"].ToString() + "'";
            ////  string query = "SELECT distinct(a.workorder),vendor_code FROM tbl_Attendance a,tbl_vendor_info v where vendor_code ='" + Session["User"].ToString() + "' ";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlWorkOrder.DataSource = dt;
                        ddlWorkOrder.DataTextField = "workorder";
                        ddlWorkOrder.DataValueField = "workorder";
                        ddlWorkOrder.DataBind();
                    }
                }
            }
            ddlWorkOrder.Items.Insert(0, new ListItem("Select", "Select"));
        }

        private void emp_code()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT distinct(emp_code) FROM tbl_attendance where  hr_approval='Approved' and dept_approval='Approved' and workorder ='" + ddlWorkOrder.SelectedItem.Text + "'";
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

        private void reason_for_separation()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT * from tbl_reason_for_separation" ;
           
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlReasonforSep.DataSource = dt;
                        ddlReasonforSep.DataTextField = "reason_for_separation";
                        ddlReasonforSep.DataValueField = "reason_for_separation";
                        ddlReasonforSep.DataBind();
                    }
                }
            }
            ddlReasonforSep.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void ShowEmpDetails()
        {
           
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("select v.vendor_reg_code,a.emp_name,v.department from tbl_attendance a,tbl_vendor_work_order v where  a.vendor_code=v.vendor_reg_code and a.workorder = v.work_worder and a.emp_code ='" + ddlEmpCode.SelectedItem.Text + "'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        txtVendorCode.Text = r["vendor_reg_code"].ToString();
                        txtEmpName.Text = r["emp_name"].ToString();

                        txtDeptment.Text = r["department"].ToString();
                       
                    
                    }
                 
                    con.Close();
                }
            }
        }
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

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
          if( duplicate_record())
          {
              lblMsgError.Text = "This record already exist";
              return;
          }
            try
            {
                var idd = txtID.Text;

                string Str = "insert into tbl_full_final_request(id, " + "work_order, " + " emp_code, " + "vendor_code, " + "emp_name,  " + "department, " + "last_working_day," + "reason_for_separation," + "date_of_request)";

                Str = Str + " values(" + idd + "," + "'" + ddlWorkOrder.SelectedItem.Text + "', " + "'" + ddlEmpCode.SelectedItem.Text + "', " + "'" + txtVendorCode.Text + "', " + "'" + txtEmpName.Text + "', " + "'" + txtDeptment.Text + "', " + "'" + txtLastWorkinDay.Text + "', " + "'" + ddlReasonforSep.SelectedItem.Text + "'," + "'" + txtDateOfRequest.Text + "')";

                SqlCommand cm = new SqlCommand(Str, con);
                cm.ExecuteNonQuery();
               
                lblMsg.Text = "Record Saved.......";

           
            }
            catch (Exception ex)
            {
                lblMsgError.Text = ex.Message;
            }
        }

        protected bool duplicate_record()
        {
            bool x = false;

            string StrSql = "Select * from tbl_full_final_request where vendor_code='" + txtVendorCode.Text + "' and work_order='" + ddlWorkOrder.SelectedItem.Text + "' and emp_code='" + ddlEmpCode.SelectedItem.Text + "' ";
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
    }
}