using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.vendor_onboarding
{
    public partial class show_gen_shift : System.Web.UI.Page
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
                //CreateEmptyTable();
               // this.BindGrid();
                Emp_Code();
                year();
            }

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
        private void BindGrid()  // show all records 
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_shfit_schedule";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                }
            }
        }

        private void BindGrid(string month, string year)
        {
            lblMsg.Text ="";
            if (month !="Select" && year !="Select")
            {
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                string query = "SELECT * FROM tbl_shfit_schedule where month= '" + month + "' and year='" + year + "' ";
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView2.DataSource = dt;
                            GridView2.DataBind();
                        }
                    }
                }
            }
            else
            {
                lblMsg.Text = "Select Month and Year";
            }
          
        }

        private void BindGrid(string empcode, string month, string year)
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_shfit_schedule where emp_code= '" + empcode + "' and month='" + month + "' and year='" + year + "' ";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                }
            }
        }


        private void Emp_Name(string empcode)
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT emp_name FROM tbl_emp where emp_code= " + empcode + "";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
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
            string query = "SELECT * FROM tbl_shfit_schedule";
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
            //ddlEmpCode.Items.Insert(0, new ListItem("Select", "0"));
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            BindGrid( ddlMonth.SelectedItem.Text, ddlYear.SelectedItem.Text );
            //string empcode = ddlEmpCode.SelectedItem.Text;
            //string month  = ddlMonth.SelectedItem.Text;
            //string year = ddlYear.SelectedItem.Text;
            //BindGrid(month, year);
            //BindGrid(empcode, month, year);  // show all record in the grid emp_code wise
        }

        protected void ddlEmpCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string empcode = ddlEmpCode.SelectedItem.Text;
            string month = ddlMonth.SelectedItem.Text;
            string year = ddlYear.SelectedItem.Text;
            Emp_Name(empcode);  // sho emp_name
            BindGrid(empcode, month, year);
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string month = ddlMonth.SelectedItem.Text;
            //string year = ddlYear.SelectedItem.Text;
            //BindGrid(month, year); 
        }

        protected void btnGenShift_Click(object sender, EventArgs e)
        {
            Response.Redirect("generate-shift.aspx");
        }





    }
}