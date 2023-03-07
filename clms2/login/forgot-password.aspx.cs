using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace clms2.login
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
               try
                    {
                    string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                    DataSet ds = new DataSet();
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT uid,pwd FROM tbl_user Where email= '" + txtEmail.Text.Trim() + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Close();
                    }
                    if(ds.Tables[0].Rows.Count>0)
                    {
                    string from, pass ="";
                    MailMessage Msg = new MailMessage();
                    // Sender e-mail address.
                    //Msg.From = new MailAddress(txtEmail.Text);
                    from = "bkbirendramca@outlook.com";
                    pass = "bkp@1971"; 
                     Msg.From = new MailAddress(from); 
                    //Msg.From = new MailAddress(txtEmail.Text); 
                    // Recipient e-mail address.
                    Msg.To.Add(txtEmail.Text);
                    Msg.Subject = "Your Password Details";
                   //Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username:" + "cc" + "<br/><br/>Your Password:" + "1" + "<br/><br/>";
                    Msg.Body = "Hi, <br/>Please check your Login Details<br/><br/>Your Username: " + ds.Tables[0].Rows[0]["uid"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["pwd"] + "<br/><br/>";
                    Msg.IsBodyHtml = true;
                    // your remote SMTP server IP.
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp-mail.outlook.com";
                   // smtp.Host = "smtp.mail.yahoo.com";  //Require secure site
                    //smtp.Host = "smtp.gmail.com";   //Require secure site
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Credentials = new System.Net.NetworkCredential(from, pass);
                    smtp.Send(Msg);
                    //Msg = null;
                    lblMsg.Text = "Your Password Details Sent to your mail";
                    // Clear the textbox valuess
                    txtEmail.Text = "";
                    }
                    else
                    {
                       
                        lblError.Text = "The Email you entered does not exists.";
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