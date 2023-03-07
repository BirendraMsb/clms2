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
    public partial class login : System.Web.UI.Page
    {
        public string strSQL;
        private static string strConnection = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(strConnection);

       // private SqlCommand cmd;
        private string sql;
        private int result;

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                UserTypeList();
        }

        public void UserTypeList()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_User"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlUserType.DataSource = ds.Tables[0];
                        ddlUserType.DataTextField = ds.Tables[0].Columns["usertype"].ToString();
                        ddlUserType.DataValueField = ds.Tables[0].Columns["usertype"].ToString();
                        ddlUserType.DataBind();
                    }
                }
            }
           // ddlUserType.Items.Insert(0, new ListItem("--Select User Type--", "UserType"));
        }
        protected void txtSubmit_Click(object sender, EventArgs e)
        {
            dbConnection();

            if (IsValid)
            {


                if (ddlUserType.SelectedValue == "Admin")
                {
                    Session["User"] = ddlUserType.Text;

                    strSQL = "select * from tbl_user where uid = '" + txtLogin.Text.Trim() + "' and pwd ='" + (txtPWD.Text.Trim()) + "' and usertype='" + ddlUserType.SelectedValue + "'";
                    SqlCommand cm = new SqlCommand(strSQL, con);
                    SqlDataReader r = cm.ExecuteReader();
                    if (r.Read())
                      Response.Redirect("../admin/admin_dashboard.aspx");
                    else
                     lblMsg.Text = "Invalid Credentials";
                    r.Close();
                }
                else if (ddlUserType.SelectedValue == "Contractor Cell")
                {
                    Session["User"] = ddlUserType.Text;
                    strSQL = "select * from tbl_user where uid = '" + txtLogin.Text.Trim() + "' and pwd ='" + (txtPWD.Text.Trim()) + "' and usertype='" + ddlUserType.SelectedValue + "'";
                    SqlCommand cm = new SqlCommand(strSQL, con);
                    SqlDataReader r = cm.ExecuteReader();
                    if (r.Read())
                        Response.Redirect("../contractor_cell/dashboard.aspx");
                    else
                        lblMsg.Text = "Enter valid Credentials";
                    r.Close();
                }
                else if (ddlUserType.SelectedValue == "Vendor")
                {
                    strSQL = "select * from tbl_vendor_info where vendor_reg_code = '" + txtLogin.Text.Trim() + "' and pwd ='" + (txtPWD.Text.Trim()) + "'";
                    SqlCommand cm = new SqlCommand(strSQL, con);
                    SqlDataReader r = cm.ExecuteReader();
                    if (r.Read())
                    {
                        Session["User"] = r["vendor_reg_code"];
                        Response.Redirect("../vendor-onboarding/dashboard.aspx");
                    }
                    else
                        lblMsg.Text = "Invalid Credentials";
                    r.Close();
                }
                else if (ddlUserType.SelectedValue == "User Department")
                {
                    strSQL = "select * from tbl_user where uid = '" + txtLogin.Text.Trim() + "' and pwd ='" + (txtPWD.Text.Trim()) + "'and usertype='" + ddlUserType.SelectedValue + "'";
                    SqlCommand cm = new SqlCommand(strSQL, con);
                    SqlDataReader r = cm.ExecuteReader();
                    if (r.Read())
                    {
                        Session["User"] = r["uid"];
                        Session["dept"] = r["username"];
                        Response.Redirect("../user_dept/dept-home.aspx");
                    }
                    else
                        lblMsg.Text = "Invalid Credentials";
                    r.Close();
                }
                else if (ddlUserType.SelectedValue == "Gatepass")
                {
                    strSQL = "select * from tbl_user where uid = '" + txtLogin.Text.Trim() + "' and pwd ='" + (txtPWD.Text.Trim()) + "'and usertype='" + ddlUserType.SelectedValue + "'";
                    SqlCommand cm = new SqlCommand(strSQL, con);
                    SqlDataReader r = cm.ExecuteReader();
                    if (r.Read())
                    {
                        Session["dept"] = r["username"];
                        Session["User"] = r["uid"];
                        Response.Redirect("../gatepass_section/gp-dashboard.aspx");
                    }
                    else
                        lblMsg.Text = "Invalid Credentials";
                    r.Close();
                }
                else if (ddlUserType.SelectedValue == "Safety")
                {
                    strSQL = "select * from tbl_user where uid = '" + txtLogin.Text.Trim() + "' and pwd ='" + (txtPWD.Text.Trim()) + "'and usertype='" + ddlUserType.SelectedValue + "'";
                    SqlCommand cm = new SqlCommand(strSQL, con);
                    SqlDataReader r = cm.ExecuteReader();
                    if (r.Read())
                    {
                        Session["dept"] = r["username"];
                        Session["User"] = r["uid"];
                        Response.Redirect("../safety_dept/safety-dashboard.aspx");
                    }
                    else
                        lblMsg.Text = "Invalid Credentials";
                    r.Close();
                }

            }
          
          
        }
    }
}