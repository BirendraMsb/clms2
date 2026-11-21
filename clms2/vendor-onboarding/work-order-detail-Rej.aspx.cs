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
    public partial class work_order_detail_Rej : System.Web.UI.Page
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
            string usrnm = Session["User"] != null ? Session["User"].ToString() : "2001";
            lblUser.Text = usrnm;
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            if (!IsPostBack)
            {
                gvInfo();
            }
        }
        public void gvInfo()
        {
            try
            {
                dbConnection();
                strSQL = "SELECT a.*,b.vendor_name,b.vendor_reg_code, b.pano,b.gstno,b.pfno,b.esicno,b.pfdoc,b.esicdoc FROM tbl_vendor_work_order a,tbl_vendor_info b  where a.vendor_reg_code=b.vendor_reg_code and a.work_worder=b.work_worder and b.status='R'";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvWod.DataSource = dt;
                GvWod.DataBind();
                if (GvWod.Rows.Count > 0 && GvWod.HeaderRow != null)
                {
                    GvWod.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            catch (Exception)
            {
            }
        }

        protected void GvWod_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string chk = Request.QueryString["vl"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var row = (DataRowView)e.Row.DataItem;
                string sts = row["status"].ToString();
                //if (sts == "N" && chk == "awo")
                if (sts == "N")
                {
                    e.Row.BackColor = System.Drawing.Color.LightSalmon;
                }

                else
                {
                    e.Row.BackColor = System.Drawing.Color.LightBlue;
                }
            }
        }

        protected void GvWod_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvWod.PageIndex = e.NewPageIndex;
            gvInfo();
        }





    }


}