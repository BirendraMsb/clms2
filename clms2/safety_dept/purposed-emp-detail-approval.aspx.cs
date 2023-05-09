using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.safety_dept
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
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            dbConnection();

            if (!Page.IsPostBack)
            {
                BindGrid();
                ////strSQL = "SELECT * FROM tbl_emp where vendor_code='" + Request.QueryString["Id"] + "'";
                strSQL = "SELECT * FROM tbl_emp where hr_approval='Approved' and dept_approval='Approved'  and vendor_code='" + Request.QueryString["Id"] + "'";
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
                /// strSQL = "SELECT * FROM tbl_emp where vendor_code='" + Request.QueryString["Id"] + "'";
                strSQL = "SELECT * FROM tbl_emp where hr_approval='Approved' and dept_approval='Approved' and vendor_code='" + Request.QueryString["Id"] + "'";
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
            TextBox rmrks = GvEmp.Rows[e.RowIndex].FindControl("txt_SafetyRemarks") as TextBox;
            DropDownList approv = GvEmp.Rows[e.RowIndex].FindControl("ddlSafetyApproval") as DropDownList;
            DropDownList SafetyTraining = GvEmp.Rows[e.RowIndex].FindControl("ddlSefetyTraining") as DropDownList;
            DropDownList medical_report = GvEmp.Rows[e.RowIndex].FindControl("ddlMedReport") as DropDownList;
            dbConnection();

            string Str = "Update tbl_emp set  medical_report='" + medical_report.SelectedItem.Text + "' , safety_training='" + SafetyTraining.SelectedItem.Text + "',  safety_remarks='" + rmrks.Text + "', safety_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";

            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GvEmp.EditIndex = -1;

            BindGrid();

            //lblMsg.Text = "Record Updated......";

        }
    }
}