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
            GvWod.DataBind();
        }
        public void gvInfo()
        {
            dbConnection();
            strSQL = "SELECT a.*, b.pano,b.gstno,b.pfno,b.esicno,b.pfdoc,b.esicdoc FROM tbl_vendor_work_order a,tbl_vendor_info b  where a.vendor_reg_code='" + Session["User"] + "'";
           // strSQL = "SELECT * FROM tbl_vendor_work_order where vendor_reg_code='" + Session["User"] + "'";
            SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GvWod.DataSource = dt;
            GvWod.DataBind();
            GvWod.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

      
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            gvInfo();

        }
    }
}