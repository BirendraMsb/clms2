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
    public partial class attendance_approval : System.Web.UI.Page
    {

        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        private DropDownList approv;
        
        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        public void workorder()
        {
            try
            {
                // Call dbConnection()
              
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT distinct work_worder from tbl_vendor_work_order where  department='" + Session["User"].ToString() + "'"))  // tbl_attendance
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            sda.Fill(ds);
                            ddlWorkOrder.DataSource = ds.Tables[0];
                            ddlWorkOrder.DataTextField = "work_worder";
                            ddlWorkOrder.DataValueField = "work_worder";
                            ddlWorkOrder.DataBind();
                        }
                    }
                }
                ddlWorkOrder.Items.Insert(0, new ListItem("--Select Work Order--", "0"));

            }
            catch (Exception)
            {

                throw;
            }

        }

        private void BindGrid()
        {
            try
            {
                dbConnection();

                // '''''''''''''''''''''''''''''''''''''''''''
                strSQL = "SELECT * FROM tbl_attendance where  workorder = '" + ddlWorkOrder.Text + "' and department='" + Session["User"].ToString() + "' ";
               // strSQL = "SELECT * FROM tbl_attendance";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvAttn.DataSource = dt;
                GvAttn.DataBind();
            }
            catch (Exception ex)
            {
                lblMSG.Text = ex.Message;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string usrnm = Session["User"].ToString();
                lblUser.Text = usrnm;
                // lblUser1.Text = usrnm
                lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
                if (!Page.IsPostBack)
                    workorder();

            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void ddlWorkOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbConnection();
            if (ddlWorkOrder.SelectedValue != "")
            {
                strSQL = "SELECT * FROM tbl_attendance where  workorder = '" + ddlWorkOrder.SelectedItem.Text + "' and department='" + Session["User"].ToString() +"' ";
                ///dont delete///strSQL = "SELECT a.*,b.* FROM tbl_vendor_info a, tbl_attendance b where a.vendor_reg_code=b.vendor_code and workorder = '" + ddlWorkOrder.Text + "'";
                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvAttn.DataSource = dt;
                GvAttn.DataBind();
                GvAttn.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            con.Close();
        }

        protected void GvAttn_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvAttn.PageIndex = e.NewPageIndex;
            GvAttn.DataBind();
        }

        protected void GvAttn_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvAttn.EditIndex = -1;
            BindGrid();
        }

        protected void GvAttn_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvAttn.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GvAttn_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GvAttn.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox rmrks = GvAttn.Rows[e.RowIndex].FindControl("txt_DeptRemarks") as TextBox;
            approv = GvAttn.Rows[e.RowIndex].FindControl("ddlDeptApproval") as DropDownList;
            ////DropDownList Shift = GvAttn.Rows[e.RowIndex].FindControl("ddlShift") as DropDownList;
            ////DropDownList med_report = GvAttn.Rows[e.RowIndex].FindControl("ddlMedReport") as DropDownList;

            //// 'If approv.SelectedItem.Text = "Reject" Then
            //// '    GvEmp.Columns(1).Visible = False
            //// 'End If

            dbConnection();
            string Str = "Update tbl_attendance set dept_remarks='" + rmrks.Text + "', dept_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";
            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GvAttn.EditIndex = -1;

            BindGrid();

        }
    }
}