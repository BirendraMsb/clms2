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
    public partial class purposed_emp_detail : System.Web.UI.Page
    {
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
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            // lblUser1.Text = usrnm

            dbConnection();

            if (!Page.IsPostBack)
            {
                BindGrid();
                strSQL = "SELECT * FROM tbl_emp where vendor_code='" + Request.QueryString["Id"] + "'";
                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvEmp.DataSource = dt;
                GvEmp.DataBind();
                GvEmp.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }
    

        private void BindGrid()
        {
            try
            {
                dbConnection();

                // '''''''''''''''''''''''''''''''''''''''''''
                strSQL = "SELECT * FROM tbl_emp where vendor_code='" + Request.QueryString["Id"] + "'";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvEmp.DataSource = dt;
                GvEmp.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmp.PageIndex = e.NewPageIndex;
             GvEmp.DataBind();

        }

        protected void GvEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GvEmp.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox rmrks = GvEmp.Rows[e.RowIndex].FindControl("txtDept_remarks") as TextBox;
            DropDownList approv = GvEmp.Rows[e.RowIndex].FindControl("ddlApproval") as DropDownList;

            dbConnection();

            string Str = "Update tbl_emp set dept_remarks='" + rmrks.Text + "', dept_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";

            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GvEmp.EditIndex = -1;

            BindGrid();

            lblMsg.Text = "Record Updated......";

        }

        protected void GvEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEmp.EditIndex = -1;
             BindGrid();
        }

        protected void GvEmp_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvEmp.EditIndex = e.NewEditIndex;
              BindGrid();

        }

        // Private Sub ToggleCheckState(ByVal checkState As Boolean)
        // ' Iterate through the Products.Rows property
        // For Each row As GridViewRow In GvEmp.Rows
        // ' Access the CheckBox
        // Dim cb As CheckBox = row.FindControl("chk")
        // If cb IsNot Nothing Then
        // cb.Checked = checkState
        // End If
        // Next
        // End Sub

        // Protected Sub CheckAll_Click(sender As Object, e As EventArgs) _
        // Handles CheckAll.Click

        // ToggleCheckState(True)
        // End Sub
        // Protected Sub UncheckAll_Click(sender As Object, e As EventArgs) _
        // Handles UncheckAll.Click

        // ToggleCheckState(False)
        // End Sub
    
      
    }
}