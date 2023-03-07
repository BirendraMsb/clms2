using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.admin
{
    public partial class user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");

            if (!IsPostBack)
            {
                UserTypeList();
            }
           
        }

        public void UserTypeList()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_role"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlUserType.DataSource = ds.Tables[0];
                        ddlUserType.DataTextField = ds.Tables[0].Columns["usertype"].ToString();
                        ddlUserType.DataValueField = ds.Tables[0].Columns["roll_id"].ToString();
                        ddlUserType.DataBind();
                    }
                }
            }
          //  txtUserType.Items.Insert(0, new ListItem("--Select User Type--", "UserType"));
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            string active="";
            if (rdoActiveYes.Checked == true)
                {
                    active= rdoActiveYes.Text;
                }
            else if(rdoActiveNo.Checked== true)
            {
                active = rdoActiveNo.Text;
            }
                



            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("Insert into tbl_user(uid,pwd,usertype,username,phone,email,active) values('" + txtUid.Text.ToUpper() + "','" + txtPassword.Text + "','" + ddlUserType.SelectedItem + "','" + txtUserName.Text + "','" + txtPhone.Text + "','" + txtEmail.Text + "','" + active + "')");
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    lblMsg.Text = "Saved reord successfully";

                }
                catch (Exception ex)
                {
                    lblError.Text = "Record not save due to error : " + ex.Message;
                   
                }
                finally
                {
                    con.Close();
                }
              

            }


           // save_user();

        }


        public void save_user()
        {
           //////string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
           ////// using (SqlConnection con = new SqlConnection(constr))
           ////// {
           //////     SqlCommand cmd = new SqlCommand("Insert into tbl_user(uid,pwd,usertype,username,phone,email) values('" + txtUid.Text + "','" + txtPassword.Text + "','" + ddlUserType.SelectedItem + "','" + txtUserName.Text + "','" + txtPhone.Text + "','" + txtEmail.Text + "')");
                              
           //////         cmd.CommandType = CommandType.Text;
           //////         cmd.Connection = con;
           //////         con.Open();
           //////      int result =   cmd.ExecuteNonQuery();
           //////      con.Close();
                
           ////// }

        }

    }
}