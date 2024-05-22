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
    public partial class purposed_wages_doc_approval : System.Web.UI.Page
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
                // 'strSQL = "SELECT * FROM tbl_emp where vendor_code='" & Request.QueryString("Id") & "'"
               // strSQL = "SELECT * FROM tbl_emp";   // 'where hr_approval<>'Reject'
                strSQL = "SELECT * FROM tbl_wages_document where hr_approval != 'Approved'";   // 'where hr_approval<>'Reject'
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
                strSQL = "SELECT * FROM tbl_wages_document where hr_approval != 'Approved'"; 
                // ' strSQL = "SELECT * FROM tbl_emp where vendor_code='" & Request.QueryString("Id") & "'"
                //strSQL = "SELECT * FROM tbl_emp ";
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

            BindGrid();
        }

        protected void GvEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEmp.EditIndex = -1;
            BindGrid();
        }

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GvEmp_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvEmp.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GvEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            {
                Label id = GvEmp.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
                TextBox rmrks = GvEmp.Rows[e.RowIndex].FindControl("txt_HRRemarks") as TextBox;
                approv = GvEmp.Rows[e.RowIndex].FindControl("ddlHRApproval") as DropDownList;
                //DropDownList Shift = GvEmp.Rows[e.RowIndex].FindControl("ddlShift") as DropDownList;
                //DropDownList med_report = GvEmp.Rows[e.RowIndex].FindControl("ddlMedReport") as DropDownList;

                ////'If approv.SelectedItem.Text = "Reject" Then
                ////'    GvEmp.Columns(1).Visible = False
                ////'End If

                if (approv.SelectedItem.Text == "Approved")
                {
                    rmrks.Text = "";
                }
                ////else if (approv.SelectedItem.Text == "Reject")
                ////{
                ////    if (rmrks.Text=="")
                ////    {
                ////        rmrks.Focus();
                ////    }
                ////}

                dbConnection();

                // ' Dim Str As String = "Update tbl_emp set security_remarks='" & rmrks.Text & "', security_approval='" & approv.SelectedValue & "' where id=" & id.Text & ""
                //string Str = "Update tbl_emp set hr_remarks='" + rmrks.Text + "',medical_report='" + med_report.SelectedValue + "', shift='" + Shift.SelectedValue + "', hr_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";
                string Str = "Update tbl_wages_document set hr_remarks='" + rmrks.Text + "',  hr_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";

                SqlCommand cm = new SqlCommand(Str, con);
                cm.ExecuteNonQuery();

                con.Close();
                GvEmp.EditIndex = -1;

                BindGrid();

                ///////---- mail sending-------------------////
                //string reciever_mail = "bkbirendramca@gmail.com";
                ////string reciever_mail = "Kapildevblog@gmail.com";
                //string approval = approv.SelectedValue;
                //string remarks = rmrks.Text;
                //clsMail cls_mail = new clsMail();
                //cls_mail.send_mail_Approval_Test(reciever_mail, approval, remarks);
            }

        }

        protected void GvEmp_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlHRApproval_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl_hr_approv = (DropDownList)sender;
            string str = ddl_hr_approv.SelectedValue;
            if (str == "Reject")
                GvEmp.Columns[20].Visible = true;  //Remarks
            else
                GvEmp.Columns[20].Visible = false;

            // CheckBox chkbox = sender as CheckBox;
            GridViewRow currentRow = ddl_hr_approv.NamingContainer as GridViewRow;
            RequiredFieldValidator rfv = GvEmp.Rows[currentRow.RowIndex]
                                               .FindControl("ReqValHRRemarks") as RequiredFieldValidator;
            if (ddl_hr_approv.SelectedItem.Text == "Reject")
            {
                rfv.Enabled = true;
            }
            else
            {
                rfv.Enabled = false;
            }
        }
    }
}