using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.contractor_cell
{
    public partial class work_order_entry1 : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        private int intTimerStart;
        private int intTimerUsed;
        private int intCountdown;

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        public void naturofwork()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id, nature_of_work FROM tbl_nature_of_work"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        txtNatureofWork.DataSource = ds.Tables[0];
                        txtNatureofWork.DataTextField = "nature_of_work";
                        txtNatureofWork.DataValueField = "nature_of_work";
                        txtNatureofWork.DataBind();
                    }
                }
            }
            ////txtNatureofWork.Items.Insert(0, new ListItem("--Select Nature Of Work--", "0"));
            txtNatureofWork.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void dept()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id, department FROM tbl_department"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        txtDepartment.DataSource = ds.Tables[0];
                        txtDepartment.DataTextField = "department";
                        txtDepartment.DataValueField = "department";
                        txtDepartment.DataBind();
                    }
                }
            }
            ////txtDepartment.Items.Insert(0, new ListItem("--Select Department--", "0"));
            txtDepartment.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void contracttype()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id, contract_type FROM tbl_contract_type"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        txtTypeofContract.DataSource = ds.Tables[0];
                        txtTypeofContract.DataTextField = "contract_type";
                        txtTypeofContract.DataValueField = "contract_type";
                        txtTypeofContract.DataBind();
                    }
                }
            }
            ///txtTypeofContract.Items.Insert(0, new ListItem("--Select Contract Type--", "0"));
            txtTypeofContract.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void joblocation()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id, job_location FROM tbl_job_location"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        txtJobLocation.DataSource = ds.Tables[0];
                        txtJobLocation.DataTextField = "job_location";
                        txtJobLocation.DataValueField = "job_location";
                        txtJobLocation.DataBind();
                    }
                }
            }
            ////txtJobLocation.Items.Insert(0, new ListItem("--Select Job Location--", "0"));
            txtJobLocation.Items.Insert(0, new ListItem("Select", "Select"));
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");

           if (!this.IsPostBack)
            {
                txtBocwLibility.Text = "0";
                naturofwork();
                dept();
                contracttype();
                joblocation();

                AutoID();
                Auto_ID();

                
            }

        }

        private int Auto_ID()
        {
            int x=0;

            string StrSql = "Select max(id) from tbl_vendor_work_order";
            SqlCommand cmd = new SqlCommand(StrSql, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if ((dr.Read()))
                {
                    if ((dr[0] == DBNull.Value))
                        txtID.Text = "1";
                    else
                        txtID.Text =(Convert.ToInt16(dr[0]) + 1).ToString();
                }
                else
                    txtID.Text = "1";
            }
            catch (Exception ex)
            {
            }
            dr.Close();

            return x;
        }

        private int AutoID()
        {
            int y=0;

            string StrSql = "Select max(id) from tbl_vendor_info";
            SqlCommand cmd = new SqlCommand(StrSql, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if ((dr.Read()))
                {
                    if ((dr[0] == DBNull.Value))
                        txtID1.Text = "1";
                    else
                        txtID1.Text = (Convert.ToInt16(dr[0]) + 1).ToString(); 
                }
                else
                    txtID1.Text = "1";
            }
            catch (Exception ex)
            {
            }
            dr.Close();

            return y;
        }

        protected bool check_dup_rec()
        {  // tbl_vendor_work_order

            bool result = false;

            string StrSql = "Select * from tbl_vendor_work_order where work_worder='" + txtWONo.Text + "'";
            SqlCommand cmd = new SqlCommand(StrSql, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                string wo = "";
                if ((dr.Read()))
                {
                  
                    if ((dr["work_worder"] != DBNull.Value))
                    {
                         wo = dr["work_worder"].ToString();
                        if (wo.ToString() == txtWONo.Text)
                        {
                           
                            result = true;
                        }
                    }
                }
               
            }
            catch (Exception ex)
            {
            }
            dr.Close();

            return result;


        }
        protected void cmdSave_Click(object sender, EventArgs e)
        {
            string result = check_dup_rec().ToString();
            if (result == "True")
            {
                lblMsgError.Text = "Work order no " + txtWONo.Text + " already exist. ";
                return;
            }
   
            dbConnection();
            AutoID();
            Auto_ID();
            try
            {
                ////Import  NOT --  here in this form status saving as blank  in vendor-> vendor_detail_entry status will be update to P - Pneding 
                /////////////and in Contractor cell Pending record will  Approved status will A- and Rejected then status updated to R , Rejected record will
                //////////// again come to vendor-> vendor_detail_entry and after updated status will be upated to P - Pending and it will go to contracot cell
                //////////// word_order_details pending grid

                var idd = txtID.Text;

                string Str = "insert into tbl_vendor_work_order(id, " + "vendor_reg_code, " + "work_worder, " + "valid_from, " + "valid_to, " + "nature_of_work, " + "type_of_contract, " + "department, " + "job_location, " + "status,work_description,act_covered,work_order_value,bocw_liability)";

                Str = Str + " values(" + idd + "," + "'" + txtVendorRegNo.Text + "', " + "'" + txtWONo.Text + "', " + "'" + txtValidFrom.Text + "', " + "'" + txtValidTo.Text + "', " + "'" + txtNatureofWork.Text + "', " + "'" + txtTypeofContract.Text + "', " + "'" + txtDepartment.Text + "', " + "'" + txtJobLocation.Text + "', " + "' ','" + txtDescription.Text + "','" + ddlActCovered.SelectedItem.Text + "','" + txtWorkOrderValue.Text + "','" + txtBocwLibility.Text + "')";  // Status P- Pending ,A -Approved , R - Rejected

                SqlCommand cm = new SqlCommand(Str, con);
                cm.ExecuteNonQuery();
                // ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                string Str1 = "insert into tbl_vendor_info(id,  " + "vendor_reg_code, " + "vendor_name, " + "vendor_owner_name, " + "email, " + "contact_no1,contact_no2, " + "firm_address,firm_city, " + "firm_state,firm_pin,license_no, " + "valid_from,valid_to, " + "workers_authorised, " + "pfno,esicno,pwd,img_file,status,work_worder,un_skilled,semi_skilled,skilled,high_skilled,owner_address)";

                Str1 = Str1 + " values(" + txtID1.Text + "," + "'" + txtVendorRegNo.Text + "', " + "'" + txtVendorName.Text + "', " + "'" + txtOwnerName.Text + "', " + "'" + txtEmail.Text + "', " + "'" + txtPhNo.Text + "', " + "'', " + "'', " + "'', " + "'', " + "'', " + "' ', " + "'2022-01-01', " + "'2022-01-01', " + "'" + txtNoEmp.Text + "', " + "'', " + "'', " + "'123@123', " + "'-', " + "' ','" + txtWONo.Text + "'," + txtUnskilled.Text + "," + txtSemiSkilled.Text + "," + txtSkilled.Text + "," + txtHighSkilled.Text + ",'" + txtOwnerAddress.Text + "')";// Status P- Pending ,A -Approved , R - Rejected

                SqlCommand cm1 = new SqlCommand(Str1, con);
                cm1.ExecuteNonQuery();

             

                lblMsg.Text = "UID : " + txtVendorRegNo.Text + " Password : 123@123";
                //lblMSG1.Text = "Record Saved.......";

                // sending email to vendor with login details
                send_mail();

                Thread.Sleep(5000);

               // lblMSG1.Text = "";
            }
            catch (Exception ex)
            {
                lblMsgError.Text = ex.Message;
            }
        }

        protected void BtnMail_Click(object sender, EventArgs e)
        {
            send_mail();
 
        }

        protected void send_mail()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_vendor_info Where  work_worder='" + txtWONo.Text.Trim() + "'", con);
                   // SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_user Where email= '" + txtEmail.Text.Trim() + "'", con);
                    //SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_vendor_info Where email= '" + txtEmail.Text.Trim() + "' and work_worder='" + txtWONo.Text.Trim() + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Close();

                }
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string from, pass = "";
                    System.Net.Mail.MailMessage Msg = new System.Net.Mail.MailMessage();
                    // Sender e-mail address.
                    //Msg.From = new MailAddress(txtEmail.Text);
                    //from = "bkbirendramca@outlook.com";
                    //pass = "bkp@1971";
                    from = "birendra@electrowebsolution.com";
                    pass = "clms@1980";
                    Msg.From = new MailAddress(from,"GREENHRM SOLUTION");

                   // Msg.From = new MailAddress(txtEmail.Text); 
                    // Recipient e-mail address.
                    Msg.To.Add(txtEmail.Text);
                    Msg.Subject = "Your Password Details";
                    //Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username:" + "cc" + "<br/><br/>Your Password:" + "1" + "<br/><br/>";
                    Msg.Body = "Hi, <br/>Please check your Login Details<br/><br/>Your Username: " + ds.Tables[0].Rows[0]["vendor_reg_code"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["pwd"] + "<br/><br/>";
                    Msg.IsBodyHtml = true;
                    // your remote SMTP server IP.
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "mail.electrowebsolution.com";
                    //smtp.Host = "smtp-mail.outlook.com";
                    // smtp.Host = "smtp.mail.yahoo.com";  //Require secure site
                    //smtp.Host = "smtp.gmail.com";   //Require secure site
                    //smtp.Port = 587;
                    smtp.Port = 25;
                    smtp.EnableSsl = false;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Credentials = new System.Net.NetworkCredential(from, pass);
                    smtp.Send(Msg);
                    //Msg = null;
                    lblMsgError.Text = "";
                    lblMsgMail.Text = "";
 
                    lblMsgMail.Text = "Your password details sent to your mail";
                    // Clear the textbox valuess
                    // txtEmail.Text = "";
                }
                else
                {

                    lblMsgError.Text = "The Email you entered does not exists. Prees Mail button after saving the record";
                }
            }
            catch (Exception ex)
            {
                // Response.Write(ex.Message);

                lblMsgError.Text = "Error : " + ex.Message;
            }

        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            txtVendorRegNo.Text = "";
            txtWONo.Text = "";
            txtValidFrom.Text = "";
            txtValidTo.Text = "";
            txtNatureofWork.SelectedIndex = 0;
            txtTypeofContract.SelectedIndex = 0;
            txtDepartment.SelectedIndex = 0;
            txtJobLocation.SelectedIndex = 0;
            txtVendorRegNo.Text = "";
            txtVendorName.Text = "";
            txtOwnerName.Text = "";
            txtEmail.Text = "";
            txtPhNo.Text = "";
            txtNoEmp.Text = "";
            txtDescription.Text = "";
            lblMsg.Text = "";
            lblMsgError.Text = "";
            lblMsgMail.Text = "";

        }

        protected void txtUnskilled_TextChanged(object sender, EventArgs e)
        {
            if (txtUnskilled.Text == "")
                txtUnskilled.Text = "0";
            if (txtSemiSkilled.Text == "")
                txtSemiSkilled.Text = "0";
            if (txtSkilled.Text == "")
                txtSkilled.Text = "0";
            if (txtHighSkilled.Text == "")
                txtHighSkilled.Text = "0";

            txtNoEmp.Text = (Convert.ToInt32(txtUnskilled.Text) + Convert.ToInt32(txtSemiSkilled.Text) + Convert.ToInt32(txtSkilled.Text) + Convert.ToInt32(txtHighSkilled.Text)).ToString();
        }

        protected void txtSemiSkilled_TextChanged(object sender, EventArgs e)
        {
            if (txtUnskilled.Text == "")
                txtUnskilled.Text = "0";
            if (txtSemiSkilled.Text == "")
                txtSemiSkilled.Text = "0";
            if (txtSkilled.Text == "")
                txtSkilled.Text = "0";
            if (txtHighSkilled.Text == "")
                txtHighSkilled.Text = "0";

            txtNoEmp.Text = (Convert.ToInt32(txtUnskilled.Text) + Convert.ToInt32(txtSemiSkilled.Text) + Convert.ToInt32(txtSkilled.Text) + Convert.ToInt32(txtHighSkilled.Text)).ToString();

        }

        protected void txtSkilled_TextChanged(object sender, EventArgs e)
        {
            if (txtUnskilled.Text == "")
                txtUnskilled.Text = "0";
            if (txtSemiSkilled.Text == "")
                txtSemiSkilled.Text = "0";
            if (txtSkilled.Text == "")
                txtSkilled.Text = "0";
            if (txtHighSkilled.Text == "")
                txtHighSkilled.Text = "0";

            txtNoEmp.Text = (Convert.ToInt32(txtUnskilled.Text) + Convert.ToInt32(txtSemiSkilled.Text) + Convert.ToInt32(txtSkilled.Text) + Convert.ToInt32(txtHighSkilled.Text)).ToString();

        }

        protected void txtHighSkilled_TextChanged(object sender, EventArgs e)
        {
            if (txtUnskilled.Text == "")
                txtUnskilled.Text = "0";
            if (txtSemiSkilled.Text == "")
                txtSemiSkilled.Text = "0";
            if (txtSkilled.Text == "")
                txtSkilled.Text = "0";
            if (txtHighSkilled.Text == "")
                txtHighSkilled.Text = "0";

            txtNoEmp.Text = (Convert.ToInt32(txtUnskilled.Text) + Convert.ToInt32(txtSemiSkilled.Text) + Convert.ToInt32(txtSkilled.Text) + Convert.ToInt32(txtHighSkilled.Text)).ToString();

        }

        protected void rbBocwY_CheckedChanged(object sender, EventArgs e)
        {
            if (txtWorkOrderValue.Text != "" )
            {
               double workorderValue = Convert.ToDouble(txtWorkOrderValue.Text);
               txtBocwLibility.Text =   (workorderValue * 1 / 100).ToString();
               ReqBocwLiability.Enabled = true;
            }
            else
            {
                ReqBocwLiability.Enabled = true;
            }
        }

        protected void rbBocwN_CheckedChanged(object sender, EventArgs e)
        {
            txtBocwLibility.Text = "0";
            txtBocwLibility.ReadOnly = true;
            ReqBocwLiability.Enabled = false;
            
        }

        protected void txtTypeofContract_SelectedIndexChanged(object sender, EventArgs e)
        {
           if (txtTypeofContract.SelectedItem.Text=="Labour Supply")
           {
               txtUnskilled.ReadOnly = false;
               txtSemiSkilled.ReadOnly=false;
               txtSkilled.ReadOnly=false;
               txtHighSkilled.ReadOnly = false;
               txtNoEmp.ReadOnly = true;

               ReqUnskilled.Enabled = true;
               ReqSemiSkilled.Enabled = true;
               ReqSkilled.Enabled = true;
               ReqHighSkilled.Enabled = true;

               txtUnskilled.Text = "0";
               txtSemiSkilled.Text = "0";
               txtSkilled.Text = "0";
               txtHighSkilled.Text = "0";
               txtNoEmp.Text = "0";
            }
           else
           {

               txtUnskilled.ReadOnly = true;
               txtSemiSkilled.ReadOnly = true;
               txtSkilled.ReadOnly = true;
               txtHighSkilled.ReadOnly = true;
               txtNoEmp.ReadOnly = false;

               ReqUnskilled.Enabled = false;
               ReqSemiSkilled.Enabled = false;
               ReqSkilled.Enabled = false;
               ReqHighSkilled.Enabled = false;

               txtUnskilled.Text = "0";
               txtSemiSkilled.Text = "0";
               txtSkilled.Text = "0";
               txtHighSkilled.Text = "0";
               txtNoEmp.Text = "0";

           }
        }





    }
}