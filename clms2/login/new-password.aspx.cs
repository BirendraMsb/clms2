using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.login
{
    public partial class new_password : System.Web.UI.Page
    {
        public string strSQL;
        private static string strConnection = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(strConnection);

        private SqlCommand cmd;
        private string sql;
        private int result;

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_user Where uid= '" + txtUserID.Text.Trim() + "' and pwd ='" + txtPassword.Text.Trim() + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Close();
                }
                if (ds.Tables[0].Rows.Count > 0)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update tbl_user set pwd ='" + txtNewPassword.Text.Trim() + "' where uid ='" + txtUserID.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblMsg.Text = "Successfully changed password ";
                    txtUserID.Text = "";
                 }
                else
                {
                    lblMsg.Text = "Failed ! Enter correct User ID and Password";
                    txtUserID.Text = "";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                // Console.WriteLine("{0} Exception caught.", ex);
            }

        }
    }
}