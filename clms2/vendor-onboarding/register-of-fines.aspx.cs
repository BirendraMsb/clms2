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
    public partial class register_of_fines : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            if (!this.IsPostBack)
            {


                this.BindGrid();
            }

        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT top 3 * FROM tbl_emp";
            // string query = "SELECT * FROM tbl_emp where vendor_code ='" + Session["User"].ToString() + "' and workorderno= '" + ddlWorkdOrder.SelectedItem.Text + "'  and hr_approval='Approved' and dept_approval='Approved' and safety_approval='Approved' and security_approval='Approved'";
            //// string query = "SELECT * FROM tbl_emp";
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
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}