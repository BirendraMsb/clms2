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
    public partial class dashboard : System.Web.UI.Page
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
            lblDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");

            if (!Page.IsPostBack)
            {
            }

            dbConnection();
            strSQL = "select count(*) as regven from tbl_vendor_work_order"; // ' where vendor_reg_code = '" & Session("User") & "'"
            SqlCommand cm = new SqlCommand(strSQL, con);
            SqlDataReader r = cm.ExecuteReader();
            if (r.Read())
                lblRegVendor.Text = r["regven"].ToString();
            r.Close();

            strSQL = "select count(*) as awo from tbl_vendor_work_order where status = 'A'";
            SqlCommand cm1 = new SqlCommand(strSQL, con);
            SqlDataReader r1 = cm1.ExecuteReader();
            if (r1.Read())
                lblActiveOrkOrder.Text = r1["awo"].ToString();

            r1.Close();
        }
    }
}