using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.admin
{
    public partial class generate_shift : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            if (!this.IsPostBack)
            {
               //this.BindGrid();
                Emp_Code();
                year();
            }
            ////txtYear.Text = DateTime.Now.ToString("yyyy");
               
        }

        protected void year()
        {
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = 2010; i < currYear + 5; i++)
            {
                ddlYear.Items.Add(i.ToString());
            }
            ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;
        }
        private void Emp_Code(string empcode)
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT emp_name FROM tbl_emp where emp_code= " + empcode +"";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        if( dt.Rows.Count > 0)
                        {
                            txtEmpName.Text = dt.Rows[0][0].ToString();
                        }
    
                    }
                }
            }
        }
        private void Emp_Code()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_emp";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlEmpCode.DataSource = dt;
                        ddlEmpCode.DataTextField = "emp_code";
                        ddlEmpCode.DataValueField = "emp_code";
                        ddlEmpCode.DataBind();
                    }
                }
            }
            ddlEmpCode.Items.Insert(0, new ListItem("--Select Emp code--", "0"));
        }

        //private void BindGrid()
        //   {
        //       string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        //       string query = "SELECT * FROM tbl_holiday";
        //       using (SqlConnection con = new SqlConnection(constr))
        //       {
        //           using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
        //           {
        //               using (DataTable dt = new DataTable())
        //               {
        //                   sda.Fill(dt);
        //                   GridView1.DataSource = dt;
        //                   GridView1.DataBind();
        //               }
        //           }
        //       }
        //   }

        private int Auto_ID()
        {
            int x = 0;
            string StrSql = "Select max(id) from tbl_emp";
            SqlCommand cmd = new SqlCommand(StrSql, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if ((dr.Read()))
                {
                    if ((dr[0] == DBNull.Value))
                        txtID.Text = "1";
                    else
                        txtID.Text = (Convert.ToInt16(dr[0]) + 1).ToString();
                }
                else
                    txtID.Text = "1";
            }
            catch (Exception ex)
            {
            }
            dr.Close();
            x = Convert.ToInt16(txtID.Text);
            return x;
        }

        protected void ddlEmpCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            Emp_Code(ddlEmpCode.SelectedItem.Text);
        }





    }

}