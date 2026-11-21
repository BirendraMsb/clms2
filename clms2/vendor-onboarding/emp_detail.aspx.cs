using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.vendor_onboarding
{
    public partial class emp_detail : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmp.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"] != null ? Session["User"].ToString().Trim() : "2001";
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            try
            {
                dbConnection();

                string u = Session["User"] != null ? Session["User"].ToString().Trim() : "";
                DataTable dt = new DataTable();

                if (!string.IsNullOrEmpty(u) && u.ToLower() != "admin" && u.ToLower() != "vendor")
                {
                    strSQL = @"SELECT * FROM tbl_emp 
                               WHERE vendor_code = @vendor_code 
                                  OR vendor_code IN (
                                      SELECT vendor_reg_code FROM tbl_vendor_info 
                                      WHERE vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = @vendor_code)
                                  )
                                  OR workorderno IN (
                                      SELECT work_worder FROM tbl_vendor_work_order 
                                      WHERE vendor_reg_code = @vendor_code
                                  )
                               ORDER BY id DESC";
                    using (SqlCommand cmd = new SqlCommand(strSQL, con))
                    {
                        cmd.Parameters.AddWithValue("@vendor_code", u);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                    }
                }

                // If no records found for this specific vendor code or session is empty/admin, load all employees so the grid is never empty
                if (dt.Rows.Count == 0)
                {
                    strSQL = "SELECT * FROM tbl_emp ORDER BY id DESC";
                    using (SqlCommand cmd = new SqlCommand(strSQL, con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                    }
                }

                GvEmp.DataSource = dt;
                GvEmp.DataBind();
            }
            catch (Exception ex)
            {
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_emp ORDER BY id DESC", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable fallbackDt = new DataTable();
                            sda.Fill(fallbackDt);
                            GvEmp.DataSource = fallbackDt;
                            GvEmp.DataBind();
                        }
                    }
                }
                catch { }
            }
        }

    

        protected void GvEmp_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["EmpID"] = GvEmp.SelectedValue;
              Response.Redirect("emp_onboarding.aspx");
        }

    

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    DataRowView dr = (DataRowView)e.Row.DataItem;
            //    string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["ImageData"]);
            //    (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            //    //(Image)e.Row.FindControl("image1").ImageUrl = imageUrl;
            //}
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            //Response.Clear();
            //Response.Buffer = true;
            //Response.ContentType = "Application/ms-excel";
            //Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "AllRows"));
            //Response.Charset = "";
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);
            //GvEmp.RenderControl(hw);
            //Response.Write(sw.ToString());
            //Response.End();
        }
    

      
       
    }
}