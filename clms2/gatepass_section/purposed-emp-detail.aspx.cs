using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.gatepass_section
{
    public partial class purposed_emp_detail : System.Web.UI.Page
    {
        private int rcnt;
        private string wrkord;
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
                // 'strSQL = "SELECT * FROM tbl_emp where vendor_code='" & Request.QueryString("Id") & "'"
                strSQL = "SELECT * FROM tbl_emp where hr_approval='Approved' and dept_approval='Approved' and safety_approval='Approved' and vendor_code='" + Request.QueryString["Id"] + "'";
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
                strSQL = "SELECT * FROM tbl_emp where hr_approval='Approved' and dept_approval='Approved' and safety_approval='Approved' and vendor_code='" + Request.QueryString["Id"] + "'";

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

     

        private void ToggleCheckState(bool checkState)
        {
            // Iterate through the Products.Rows property
            foreach (GridViewRow row in GvEmp.Rows)
            {
                // Access the CheckBox
                CheckBox cb =(CheckBox)row.FindControl("chk");
                if (cb != null)
                    cb.Checked = checkState;
            }
        }

        protected void CheckAll_Click(object sender, EventArgs e)
        {
        }

        protected void UncheckAll_Click(object sender, EventArgs e)
        {
        }

        private void btnGenerate_GP_Click(object sender, System.EventArgs e)
        {
            dbConnection();

            foreach (GridViewRow row in GvEmp.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    bool isChecked = row.Cells[1].Controls.OfType<CheckBox>().FirstOrDefault().Checked;
                    if (isChecked)
                    {
                        strSQL = "select * from tbl_vendor_work_order where vendor_reg_code = '" + Request.QueryString["Id"] + "'";
                        SqlCommand cm = new SqlCommand(strSQL, con);
                        SqlDataReader r = cm.ExecuteReader();
                        if (r.Read())
                            wrkord = r["work_worder"].ToString();
                        r.Close();

                        rcnt = rcnt + 1;
                    }
                }
            }


            // Response.Redirect("gp-print.aspx?rcnt=" & rcnt & "&vcd=" & Request.QueryString("Id") & "&wrkord=" & wrkord)

            con.Close();
        }

        protected void OpenWindow(object sender, EventArgs e)
        {
            string url = "gp-print.aspx?rcnt=" + rcnt + "&vcd=" + Request.QueryString["Id"] + "&wrkord=" + wrkord;
            string s = "window.open('" + url + "', 'popup_window', 'width=1000,height=500,left=5,top=5,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmp.PageIndex = e.NewPageIndex;
              GvEmp.DataBind();
        }

        protected void GvEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEmp.EditIndex = -1;
             BindGrid();
        }

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             //if (e.Row.RowType == DataControlRowType.DataRow)
             //{
             //    DataRowView dr = (DataRowView)e.Row.DataItem;
             //    string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["ImageData"]);
             //    (e.Row.FindControl("image1") as Image).ImageUrl = imageUrl;
             //    //(Image)e.Row.FindControl("image1").ImageUrl = imageUrl;
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
            TextBox rmrks = GvEmp.Rows[e.RowIndex].FindControl("txt_SectRemarks") as TextBox;
            DropDownList approv = GvEmp.Rows[e.RowIndex].FindControl("ddlSecApproval") as DropDownList;
            string doj = DateTime.Now.ToString("dd-MM-yyyy");
            dbConnection();

            string Str = "Update tbl_emp set security_remarks='" + rmrks.Text + "', security_approval='" + approv.SelectedValue + "',date_of_joining = '" + doj + "' where id=" + id.Text + "";

            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GvEmp.EditIndex = -1;

            BindGrid();
        }


      

      
       
    }
}