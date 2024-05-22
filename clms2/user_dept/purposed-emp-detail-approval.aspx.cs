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
    public partial class purposed_emp_detail_approval : System.Web.UI.Page
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
            lblDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
           

            dbConnection();

            if (!Page.IsPostBack)
            {
                BindGrid();
                strSQL = "SELECT e.* FROM tbl_emp e,tbl_vendor_work_order vwo where vwo.vendor_reg_code=e.vendor_code and vwo.work_worder= e.workorderno and vwo.work_worder= e.workorderno and vwo.department= '" + Session["User"].ToString() + "' AND e.dept_approval ='Pending'  order by e.id desc";
                ////strSQL = "SELECT * FROM tbl_emp where vendor_code='" + Request.QueryString["Id"] + "' order by id desc";
               /// strSQL = "SELECT * FROM tbl_emp where hr_approval='Approved' and vendor_code='" + Request.QueryString["Id"] + "'";
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
                strSQL = "SELECT e.* FROM tbl_emp e,tbl_vendor_work_order vwo where vwo.vendor_reg_code=e.vendor_code and vwo.work_worder= e.workorderno and vwo.work_worder= e.workorderno and vwo.department= '" + Session["User"].ToString() + "' AND e.dept_approval ='Pending'  order by e.id desc";
                ///strSQL = "SELECT e.* FROM tbl_emp e,tbl_vendor_work_order vwo where vwo.vendor_reg_code=e.vendor_code and vwo.department= '" + Session["User"].ToString() + "' AND dept_approval ='Pending'  order by e.id desc";
                //// strSQL = "SELECT * FROM tbl_emp where vendor_code='" + Request.QueryString["Id"] + "' order by id desc";
               //// strSQL = "SELECT * FROM tbl_emp where hr_approval='Approved' and vendor_code='" + Request.QueryString["Id"] + "'";
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

        protected void GvEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEmp.EditIndex = -1;
            BindGrid();
        }

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (DataBinder.Eval(e.Row.DataItem, "status") == "N")
            //    e.Row.BackColor = System.Drawing.Color.LightPink;

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    //DataRowView dr = (DataRowView)e.Row.DataItem;
            //    //string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["venImageData"]);
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
            TextBox rmrks = GvEmp.Rows[e.RowIndex].FindControl("txt_DeptRemarks") as TextBox;
            DropDownList approv = GvEmp.Rows[e.RowIndex].FindControl("ddlDeptApproval") as DropDownList;

            dbConnection();

            string Str = "Update tbl_emp set dept_remarks='" + rmrks.Text + "', dept_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";

            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GvEmp.EditIndex = -1;

            BindGrid();

            //lblMsg.Text = "Record Updated......";
        }

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmp.PageIndex = e.NewPageIndex;
            //GvEmp.DataBind();
            BindGrid();
        }

        protected void ddlDeptApproval_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl_dept_approv = (DropDownList)sender;
            string str = ddl_dept_approv.SelectedValue;
            if (str == "Reject")
                GvEmp.Columns[16].Visible = true;  //Remarks
            else
                GvEmp.Columns[16].Visible = false;

            // CheckBox chkbox = sender as CheckBox;
            GridViewRow currentRow = ddl_dept_approv.NamingContainer as GridViewRow;
            RequiredFieldValidator rfv = GvEmp.Rows[currentRow.RowIndex]
                                               .FindControl("ReqValDeptRemarks") as RequiredFieldValidator;
            if (ddl_dept_approv.SelectedItem.Text == "Reject")
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