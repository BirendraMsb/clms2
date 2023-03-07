using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2
{
    public partial class logout : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        public void log_out()
        {
            Session["User"] = "";
            // Response.Redirect("default.aspx", True)
            HttpCookie cookie3 = new HttpCookie("SMSESSION", "NO");
            cookie3.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie3);


            FormsAuthentication.SignOut();
            Session.RemoveAll();
            Session.Abandon();
            Session.Clear();

            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore();
            HttpContext.Current.Response.Cache.SetExpires(DateTime.Now);
            Response.Redirect("login/login.aspx", true);
        }
        protected void Page_Unload(object sender, System.EventArgs e)
        {
            con.Close();
            con = null;
        }
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                log_out();
                Response.Redirect("login/login.aspx", true);
            }
        }
    }
}