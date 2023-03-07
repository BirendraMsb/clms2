using System;
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
    public partial class purposed_emp_detail_approval : System.Web.UI.Page
    {
        private int rcnt;
        private string wrkord;
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        private DropDownList approv;

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        //protected void GvEmp_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        //{
        //    GvEmp.PageIndex = e.NewPageIndex;
        //    GvEmp.DataBind();
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            dbConnection();

            if (!Page.IsPostBack)
            {
                BindGrid();
                // 'strSQL = "SELECT * FROM tbl_empwhere vendor_code='" & Request.QueryString("Id") & "'"
                strSQL = "SELECT * FROM tbl_emp";   // 'where hr_approval<>'Reject'
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
                // ' strSQL = "SELECT * FROM tbl_emp where vendor_code='" & Request.QueryString("Id") & "'"
                strSQL = "SELECT * FROM tbl_emp ";
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

        //private void GvEmp_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        //{
        //    GvEmp.EditIndex = e.NewEditIndex;
        //    BindGrid();
        //}

        //private void GvEmp_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        //{
        //    Label id = GvEmp.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        //    TextBox rmrks = GvEmp.Rows[e.RowIndex].FindControl("txt_HRRemarks") as TextBox;
        //    approv = GvEmp.Rows[e.RowIndex].FindControl("ddlHRApproval") as DropDownList;
        //    DropDownList Shift = GvEmp.Rows[e.RowIndex].FindControl("ddlShift") as DropDownList;
        //    DropDownList med_report = GvEmp.Rows[e.RowIndex].FindControl("ddlMedReport") as DropDownList;

        //    // 'If approv.SelectedItem.Text = "Reject" Then
        //    // '    GvEmp.Columns(1).Visible = False
        //    // 'End If

        //    dbConnection();

        //    // ' Dim Str As String = "Update tbl_emp set security_remarks='" & rmrks.Text & "', security_approval='" & approv.SelectedValue & "' where id=" & id.Text & ""
        //    string Str = "Update tbl_emp set hr_remarks='" + rmrks.Text + "',medical_report='" + med_report.SelectedValue + "', shift='" + Shift.SelectedValue + "', hr_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";

        //    SqlCommand cm = new SqlCommand(Str, con);
        //    cm.ExecuteNonQuery();

        //    con.Close();
        //    GvEmp.EditIndex = -1;

        //    BindGrid();
        //}

        private void ToggleCheckState(bool checkState)
        {
            // Iterate through the Products.Rows property
            foreach (GridViewRow row in GvEmp.Rows)
            {
                //// Access the CheckBox
                //CheckBox cb =row.FindControl("chk");
                //if (cb != null)
                //    cb.Checked = checkState;
            }
        }

        protected void CheckAll_Click(object sender, EventArgs e)
        {
        }

        protected void UncheckAll_Click(object sender, EventArgs e)
        {
        }

        //protected void GvEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    GvEmp.EditIndex = -1;
        //    BindGrid();
        //}

        protected void ddlHRApproval_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList list = (DropDownList)sender;
            string str = list.SelectedValue;
            if (str == "Reject")
                GvEmp.Columns[15].Visible = true;
            else
                GvEmp.Columns[15].Visible = false;
        }

        //protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        DataRowView dr = (DataRowView)e.Row.DataItem;
        //        string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["ImageData"]);
        //        (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
              
        //    }
        //}

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmp.PageIndex = e.NewPageIndex;
            GvEmp.DataBind();
        }

        protected void GvEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEmp.EditIndex = -1;
               BindGrid();
        }

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             //if (e.Row.RowType == DataControlRowType.DataRow)
             //{
             //    DataRowView dr = (DataRowView)e.Row.DataItem;
             //    string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["ImageData"]);
             //    (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;

             //}
        }

        protected void GvEmp_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvEmp.EditIndex = e.NewEditIndex;
              BindGrid();
        }

        protected void GvEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GvEmp.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox rmrks = GvEmp.Rows[e.RowIndex].FindControl("txt_HRRemarks") as TextBox;
            approv = GvEmp.Rows[e.RowIndex].FindControl("ddlHRApproval") as DropDownList;
            DropDownList Shift = GvEmp.Rows[e.RowIndex].FindControl("ddlShift") as DropDownList;
            DropDownList med_report = GvEmp.Rows[e.RowIndex].FindControl("ddlMedReport") as DropDownList;

            // 'If approv.SelectedItem.Text = "Reject" Then
            // '    GvEmp.Columns(1).Visible = False
            // 'End If

            dbConnection();

            // ' Dim Str As String = "Update tbl_emp set security_remarks='" & rmrks.Text & "', security_approval='" & approv.SelectedValue & "' where id=" & id.Text & ""
            string Str = "Update tbl_emp set hr_remarks='" + rmrks.Text + "',medical_report='" + med_report.SelectedValue + "', shift='" + Shift.SelectedValue + "', hr_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";

            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GvEmp.EditIndex = -1;

            BindGrid();
        }
    }
}