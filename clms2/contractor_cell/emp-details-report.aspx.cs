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
    public partial class emp_details_report : System.Web.UI.Page
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
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            if (!Page.IsPostBack)
            {
                SearchEmpbyName();
            }

            BindGrid();
        }

        private void BindGrid()
        {
            try
            {
                dbConnection();

                // '''''''''''''''''''''''''''''''''''''''''''
               /// strSQL = "SELECT * FROM tbl_emp where vendor_code='" + Session["User"].ToString() + "'";
                strSQL = "SELECT * FROM tbl_emp";
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
            this.SearchEmpbyName();
        }

        protected void GvEmp_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["EmpID"] = GvEmp.SelectedValue;
            //Response.Redirect("emp_onboarding.aspx");
        }

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.SearchEmpbyName();
        }
        private void SearchEmpbyName()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM tbl_emp";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        sql += " WHERE emp_name LIKE @emp_name + '%'";
                        cmd.Parameters.AddWithValue("@emp_name", txtSearch.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GvEmp.DataSource = dt;
                        GvEmp.DataBind();
                    }
                }
            }
        }

      
    }
}