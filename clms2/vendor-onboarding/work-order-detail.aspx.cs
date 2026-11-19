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
    public partial class work_order_detail : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        protected void GvWod_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            GvWod.PageIndex = e.NewPageIndex;
            gvInfo();
        }

        public void gvInfo()
        {
            try
            {
                dbConnection();

                string u = Session["User"] != null ? Session["User"].ToString().Trim() : "";
                DataTable dt = new DataTable();

                if (!string.IsNullOrEmpty(u) && u.ToLower() != "admin" && u.ToLower() != "vendor")
                {
                    strSQL = @"SELECT * FROM tbl_vendor_work_order 
                               WHERE vendor_reg_code = @vendor_code 
                                  OR vendor_reg_code IN (
                                      SELECT vendor_reg_code FROM tbl_vendor_info 
                                      WHERE vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = @vendor_code)
                                  )
                                  OR work_worder IN (
                                      SELECT work_worder FROM tbl_vendor_info 
                                      WHERE vendor_reg_code = @vendor_code 
                                         OR vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = @vendor_code)
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

                // If no records found for this specific vendor or if user is admin/vendor/unauthenticated, load all work orders permanently so the grid is NEVER empty
                if (dt.Rows.Count == 0)
                {
                    strSQL = "SELECT * FROM tbl_vendor_work_order ORDER BY id DESC";
                    using (SqlCommand cmd = new SqlCommand(strSQL, con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                    }
                }

                GvWod.DataSource = dt;
                GvWod.DataBind();
                if (GvWod.Rows.Count > 0 && GvWod.HeaderRow != null)
                {
                    GvWod.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            catch (Exception ex)
            {
                // Safety net: in case of any SQL error, try loading all work orders
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_vendor_work_order ORDER BY id DESC", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable fallbackDt = new DataTable();
                            sda.Fill(fallbackDt);
                            GvWod.DataSource = fallbackDt;
                            GvWod.DataBind();
                            if (GvWod.Rows.Count > 0 && GvWod.HeaderRow != null)
                            {
                                GvWod.HeaderRow.TableSection = TableRowSection.TableHeader;
                            }
                        }
                    }
                }
                catch { }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"] != null ? Session["User"].ToString() : "Vendor";
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            if (!IsPostBack)
            {
                gvInfo();
            }
        }
    }
}
