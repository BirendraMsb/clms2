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
    public partial class AllowancesMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            if (!this.IsPostBack)
                this.BindGrid();
        }
        private void BindGrid()
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
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
           // string VendorCode = (row.FindControl("txtVendorCode") as TextBox).Text;
           // string EmpName = (row.FindControl("txtEmpName") as TextBox).Text;
           // string Skill = (row.FindControl("txtSkillCategory") as TextBox).Text;
            string Basic = (row.FindControl("txtBasic") as TextBox).Text;
            string Allowance = (row.FindControl("txtAllowance") as TextBox).Text;
            string query = "UPDATE tbl_emp SET basic=@basic,allowance=@allowance WHERE id=@id";
            //string query = "UPDATE tbl_emp SET vendor_code=@vendor_code, emp_name=@emp_name ,skill_category=@skill_category,basic=@basic,allowance=@allowance WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", Id);
                   // cmd.Parameters.AddWithValue("@vendor_code", VendorCode);
                   // cmd.Parameters.AddWithValue("@emp_name", EmpName);
                  //  cmd.Parameters.AddWithValue("@skill_category", Skill);
                    cmd.Parameters.AddWithValue("@basic", Basic);
                    cmd.Parameters.AddWithValue("@allowance", Allowance);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

      
    }
}