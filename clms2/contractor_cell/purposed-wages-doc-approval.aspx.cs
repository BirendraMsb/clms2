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
                strSQL = "SELECT * FROM tbl_wages_document";   // 'where hr_approval<>'Reject'
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
                strSQL = "SELECT * FROM tbl_wages_document"; 
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

        }

        protected void GvEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GvEmp_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GvEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GvEmp_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}