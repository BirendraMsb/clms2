using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.user_dept
{
    public partial class vendor_list : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        public void workorder()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                
                ///using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_vendor_work_order where status='A'"))
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_emp where status='P' and hr_approval='Approved'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlWorkOrder.DataSource = ds.Tables[0];
                        ddlWorkOrder.DataTextField = "workorderno";
                        ddlWorkOrder.DataValueField = "workorderno";
                        ddlWorkOrder.DataBind();
                    }
                }
            }
            ddlWorkOrder.Items.Insert(0, new ListItem("--Select Work Order--", "0"));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            if (!Page.IsPostBack)
                workorder();

        }

     
        private void BindGrid()
        {
            try
            {
                dbConnection();

                // '''''''''''''''''''''''''''''''''''''''''''
                strSQL = "SELECT a.*,b.work_worder FROM tbl_vendor_info a, tbl_vendor_work_order b where (a.work_worder=b.work_worder) and b.work_worder='" + ddlWorkOrder.SelectedValue + "'";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvVendor.DataSource = dt;
                GvVendor.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddlWorkOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbConnection();
            if (ddlWorkOrder.SelectedValue != "")
            {
                strSQL = "SELECT a.*,b.work_worder FROM tbl_vendor_info a, tbl_vendor_work_order b where (a.work_worder=b.work_worder) and b.work_worder='" + ddlWorkOrder.SelectedValue + "'";
               ///// strSQL = "SELECT a.*,b.work_worder FROM tbl_vendor_info a, tbl_vendor_work_order b where a.vendor_reg_code=b.vendor_reg_code and b.work_worder='" + ddlWorkOrder.SelectedValue + "'";
                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvVendor.DataSource = dt;
                GvVendor.DataBind();
                GvVendor.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            con.Close();

        }

        protected void GvVendor_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //GvVendor.PageIndex = e.NewPageIndex;
            //GvVendor.DataBind();
        }
      
    }
}