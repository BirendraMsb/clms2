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


            strSQL = "select count(*) as ActiveGP from tbl_emp  where hr_approval='Approved' and dept_approval='Approved' and safety_approval='Approved' and security_approval='Approved'";
            SqlCommand cm2 = new SqlCommand(strSQL, con);
            SqlDataReader r2 = cm2.ExecuteReader();
            if (r2.Read())
                lblActiveGP.Text = r2["ActiveGP"].ToString();
            r2.Close();

            strSQL = "select count(*) as PendingGP from tbl_emp  where  security_approval <>'Approved'";
            SqlCommand cm3 = new SqlCommand(strSQL, con);
            SqlDataReader r3 = cm3.ExecuteReader();
            if (r3.Read())
                lblPendingGP.Text = r3["PendingGP"].ToString();
            r3.Close();

            strSQL = "SELECT count(*) as TotAttendance FROM tbl_Attendance where  hr_approval='Approved' and dept_approval='Approved' ";
            SqlCommand cm4 = new SqlCommand(strSQL, con);
            SqlDataReader r4 = cm4.ExecuteReader();
            if (r4.Read())
                lblTotAttendance.Text = r4["TotAttendance"].ToString();
            r4.Close();
        }
    }
}