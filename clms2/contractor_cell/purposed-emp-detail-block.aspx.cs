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
    public partial class purposed_emp_detail_block : System.Web.UI.Page
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
        //   
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
              
                strSQL = "SELECT * FROM tbl_emp where dept_approval='Approved'";
                //strSQL = "SELECT * FROM tbl_emp";
                // 'strSQL = "SELECT * FROM tbl_empwhere vendor_code='" & Request.QueryString("Id") & "'"
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
                //strSQL = "SELECT * FROM tbl_emp ";
                strSQL = "SELECT * FROM tbl_emp where dept_approval='Approved'";
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
        //    
        //}

        private void ToggleCheckState(bool checkState)
        {
            // Iterate through the Products.Rows property
            foreach (GridViewRow row in GvEmp.Rows)
            {
                //// Access the CheckBox
                //CheckBox cb = row.FindControl("chk");
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
        //    
        //}

        //protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //   
        //}



        //protected void ddlHRApproval_SelectedIndexChanged(object sender, EventArgs e)
        //{
            
        //}

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmp.PageIndex = e.NewPageIndex;
            BindGrid();
             // GvEmp.DataBind();
        }

        protected void GvEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEmp.EditIndex = -1;
               BindGrid();
        }

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            /// show column'''
            //GvEmp.Columns[17].Visible = true;  // start date
            //GvEmp.Columns[17].Visible = true;  // end date 
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    //DataRowView dr = (DataRowView)e.Row.DataItem;
            //    //string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["ImageData"]);
            //    //(e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
               
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
            TextBox rmrks = GvEmp.Rows[e.RowIndex].FindControl("txt_HRRemOfBlocking") as TextBox;
            DropDownList approv = GvEmp.Rows[e.RowIndex].FindControl("ddlBlockingByHR") as DropDownList;
            TextBox start_date = GvEmp.Rows[e.RowIndex].FindControl("txtStartDate") as TextBox;
            TextBox end_date = GvEmp.Rows[e.RowIndex].FindControl("txtEndDate") as TextBox;

            dbConnection();


            // ' Dim Str As String = "Update tbl_emp set security_remarks='" & rmrks.Text & "', security_approval='" & approv.SelectedValue & "' where id=" & id.Text & ""
            string Str = "Update tbl_emp set hr_rem_of_blocking='" + rmrks.Text + "',start_date_of_blocking='" + start_date.Text + "', end_date_of_blocking='" + end_date.Text + "', blocking_by_hr='" + approv.SelectedItem.Text + "' where id=" + id.Text + "";

            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GvEmp.EditIndex = -1;

            BindGrid();


        }

        //protected void ddlHRBlocking_SelectedIndexChanged(object sender, EventArgs e)
        //{
 
        //}

        protected void ddlBlockingByHR_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl_hr_blocking = (DropDownList)sender;
            string str = ddl_hr_blocking.SelectedValue;
            if (str == "TB")
            {
                //// remarkofblocking - col17 
                //// StartDate -col18
                ////EndDate - col19
                GvEmp.Columns[17].Visible = false;
                GvEmp.Columns[18].Visible = true;
                GvEmp.Columns[19].Visible = true;
            }
            else if (str == "PB")
            {
                GvEmp.Columns[17].Visible = true;  //remarks
                GvEmp.Columns[18].Visible = false;
                GvEmp.Columns[19].Visible = false;
            }

            GridViewRow currentRow = ddl_hr_blocking.NamingContainer as GridViewRow;
            RequiredFieldValidator rfv = GvEmp.Rows[currentRow.RowIndex]
                                               .FindControl("ReqHRRemOfBlocking") as RequiredFieldValidator;
            if (ddl_hr_blocking.SelectedValue== "PB")
            {
                rfv.Enabled = true;
            }
            else 
            {
                rfv.Enabled = false;
            }

            // -------- date field  Requirefiled validation for Temporary Block--------------//
            GridViewRow currentRow1 = ddl_hr_blocking.NamingContainer as GridViewRow;
            RequiredFieldValidator rfv1 = GvEmp.Rows[currentRow1.RowIndex]
                                               .FindControl("ReqStartDate") as RequiredFieldValidator;
            RequiredFieldValidator rfv2 = GvEmp.Rows[currentRow1.RowIndex]
                                              .FindControl("ReqEndDate") as RequiredFieldValidator;
            if (ddl_hr_blocking.SelectedValue == "TB")
            {
                rfv1.Enabled = true;
                rfv2.Enabled = true;

            }
            else 
            {
                rfv1.Enabled = false;
                rfv2.Enabled = false;
            }



        }
    }
}