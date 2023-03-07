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
    public partial class vendor_detail : System.Web.UI.Page
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

            // '''''''''''''''''''''''''''''''''''''''''''
            if (!Page.IsPostBack)
            {
                BindGrid();
                string vregno = Request.QueryString["id"];
                strSQL = "SELECT * FROM tbl_vendor_info where status<>'A' and vendor_reg_code='" + vregno + "'";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvVendor.DataSource = dt;
                GvVendor.DataBind();
                GvVendor.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
      
        

        private void BindGrid()
        {
            try
            {
                dbConnection();

                // '''''''''''''''''''''''''''''''''''''''''''
                string vregno = Request.QueryString["id"];
                strSQL = "SELECT * FROM tbl_vendor_info where status<>'A' and vendor_reg_code='" + vregno + "'";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvVendor.DataSource = dt;
                GvVendor.DataBind();
            }
            catch (Exception ex)
            {
                lblMSG.Text = ex.Message;
            }
        }

        protected void GvVendor_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvVendor.EditIndex = e.NewEditIndex;
              BindGrid();
        }

        protected void GvVendor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvVendor.PageIndex = e.NewPageIndex;
              GvVendor.DataBind();
        }

        protected void GvVendor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvVendor.EditIndex = -1;
              BindGrid();
        }

        protected void GvVendor_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (DataBinder.Eval(e.Row.DataItem, "status") == "N")
                e.Row.BackColor = System.Drawing.Color.LightPink;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //DataRowView dr = (DataRowView)e.Row.DataItem;
                //string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["venImageData"]);
                //(e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
               
            }
        }

        protected void GvVendor_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GvVendor.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            // Dim rmrks As TextBox = TryCast(GvVendor.Rows(e.RowIndex).FindControl("txt_remarks"), TextBox)
            DropDownList approv = GvVendor.Rows[e.RowIndex].FindControl("ddlApproval") as DropDownList;

            dbConnection();

            string Str = "Update tbl_vendor_info set status='" + approv.SelectedValue + "' where vendor_reg_code=" + id.Text + "";
            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            string Str1 = "Update tbl_vendor_work_order set status='" + approv.SelectedValue + "' where vendor_reg_code=" + id.Text + "";
            SqlCommand cm1 = new SqlCommand(Str1, con);
            cm1.ExecuteNonQuery();


            con.Close();
            GvVendor.EditIndex = -1;

            BindGrid();

        }

    }
}