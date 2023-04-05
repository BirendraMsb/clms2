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
                this.BindGrid();
                //  UserID();
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_user";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
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

        public void UserID()
        {
            //// Call dbConnection()
            //string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand("SELECT uid FROM tbl_user where usertype ='" + ddlUserType.SelectedItem + "'"))
            //    {
            //        cmd.CommandType = CommandType.Text;
            //        cmd.Connection = con;
            //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            //        {
            //            DataSet ds = new DataSet();
            //            sda.Fill(ds);
            //            txtUid.DataSource = ds.Tables[0];
            //            txtUid.DataTextField = ds.Tables[0].Columns["uid"].ToString();
            //            txtUid.DataValueField = ds.Tables[0].Columns["uid"].ToString();
            //            txtUid.DataBind();
            //        }
            //    }
            //}
            ////  txtUserType.Items.Insert(0, new ListItem("--Select User Type--", "UserType"));
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            string active = "";
            if (rdoActiveYes.Checked == true)
            {
                active = rdoActiveYes.Text;
            }
            else if (rdoActiveNo.Checked == true)
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

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridView1.EditIndex = e.NewEditIndex;
            //this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string usertype = (row.FindControl("usertype") as DropDownList).Text;
            string username = (row.FindControl("username") as TextBox).Text;
            string uid = (row.FindControl("uid") as TextBox).Text;
            string phone = (row.FindControl("phone") as TextBox).Text;
            string email = (row.FindControl("email") as TextBox).Text;
            string active = (row.FindControl("active") as TextBox).Text;

            string query = "UPDATE tbl_user SET username=@username,uid=@uid,phone=@phone,email=@email,active=@active WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", Id);
                    cmd.Parameters.AddWithValue("@usertype", usertype);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@uid", uid);
                    cmd.Parameters.AddWithValue("@phone", phone);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@active", active);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void ddlUserType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // UserID();
        }




    }
}