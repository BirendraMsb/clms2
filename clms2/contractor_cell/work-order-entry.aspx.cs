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
            txtNatureofWork.Items.Insert(0, new ListItem("--Select Nature Of Work--", "0"));
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
            txtDepartment.Items.Insert(0, new ListItem("--Select Department--", "0"));
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
            txtTypeofContract.Items.Insert(0, new ListItem("--Select Contract Type--", "0"));
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
            txtJobLocation.Items.Insert(0, new ListItem("--Select Job Location--", "0"));
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");

           if (!this.IsPostBack)
            {
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

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            dbConnection();

            try
            {
                var idd = txtID.Text;

                string Str = "insert into tbl_vendor_work_order(id, " + "vendor_reg_code, " + "work_worder, " + "valid_from, " + "valid_to, " + "nature_of_work, " + "type_of_contract, " + "department, " + "job_location, " + "status,work_description)";

                Str = Str + " values(" + idd + "," + "'" + txtVendorRegNo.Text + "', " + "'" + txtWONo.Text + "', " + "'" + txtValidFrom.Text + "', " + "'" + txtValidTo.Text + "', " + "'" + txtNatureofWork.Text + "', " + "'" + txtTypeofContract.Text + "', " + "'" + txtDepartment.Text + "', " + "'" + txtJobLocation.Text + "', " + "'N','" + txtDescription.Text + "')";

                SqlCommand cm = new SqlCommand(Str, con);
                cm.ExecuteNonQuery();
                // ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                string Str1 = "insert into tbl_vendor_info(id,  " + "vendor_reg_code, " + "vendor_name, " + "vendor_owner_name, " + "email, " + "contact_no1,contact_no2, " + "firm_address,firm_city, " + "firm_state,firm_pin,license_no, " + "valid_from,valid_to, " + "workers_authorised, " + "pfno,esicno,pwd,img_file,status,work_worder)";

                Str1 = Str1 + " values(" + txtID1.Text + "," + "'" + txtVendorRegNo.Text + "', " + "'" + txtVendorName.Text + "', " + "'" + txtOwnerName.Text + "', " + "'" + txtEMail.Text + "', " + "'" + txtPhNo.Text + "', " + "'0', " + "'0', " + "'0', " + "'0', " + "'0', " + "'0', " + "'2022-01-01', " + "'2022-01-01', " + "'" + txtNoEmp.Text + "', " + "'0', " + "'0', " + "'123@123', " + "'-', " + "'N','" + txtWONo.Text + "')";

                SqlCommand cm1 = new SqlCommand(Str1, con);
                cm1.ExecuteNonQuery();

                AutoID();
                Auto_ID();

                lblMSG.Text = "UID : " + txtVendorRegNo.Text + " Password : 123@123";
                lblMSG1.Text = "Record Saved.......";


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
                txtEMail.Text = "";
                txtPhNo.Text = "";

                Thread.Sleep(5000);

                lblMSG1.Text = "";
            }
            catch (Exception ex)
            {
                lblMSG1.Text = ex.Message;
            }
        }

        protected void BtnMail_Click(object sender, EventArgs e)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            mail.From = new MailAddress("bkbirendramca@gmail.com");
            mail.To.Add("Email Id to kapildevblog@gmail.com");
            mail.Subject = "Test mail";
            mail.Body = "Test mail";
            // mail.Attachments.Add(New Attachment(OpenFileDialog1.FileName))
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("bkbirendramca@gmail.com", "bkp#1971");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            mail.From = new MailAddress("bkbirendramca@gmail.com");
            //Interaction.MsgBox("E-mail Has Been Send Successfully !");
        }




    }
}