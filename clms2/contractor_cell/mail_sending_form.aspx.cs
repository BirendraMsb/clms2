using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.contractor_cell
{
    public partial class mail_sending_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnMail_Click(object sender, EventArgs e)
        {
            // System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            // //create the mail message 
            // MailMessage mail = new MailMessage();

            // //set the addresses 
            // mail.From = new MailAddress("birendra@electrowebsolution.com"); //IMPORTANT: This must be same as your smtp authentication address.
            // //mail.To.Add("postmaster@electrowebsolution.com");
            //// mail.To.Add("birendra@electrowebsolution.com");
            // mail.To.Add("bkbirendramca@gmail.com");
            // //set the content 
            // mail.Subject = "This is an email";
            // mail.Body = "This is from system.net.mail using C sharp with smtp authentication.";
            // //send the message 
            // SmtpClient smtp = new SmtpClient("mail.electrowebsolution.com");

            // //IMPORANT:  Your smtp login email MUST be same as your FROM address. 
            // NetworkCredential Credentials = new NetworkCredential("birendra@electrowebsolution.com", "clms@1980");
            // smtp.UseDefaultCredentials = false;
            // smtp.Credentials = Credentials;
            // smtp.Port = 25;    //alternative port number is 8889
            // smtp.EnableSsl = false;
            // smtp.Send(mail);
            // lblStatus.Text = "Mail Sent";

            try
            {
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                MailMessage mail = new MailMessage();
                txtFrom.Text = "birendra@electrowebsolution.com";
                txtPass.Text = "clms@1980";
                mail.From = new MailAddress(txtFrom.Text); //IMPORTANT: This must be same as your smtp authentication address.

                mail.To.Add(txtTo.Text);

                //set the content 
                mail.Subject = txtSubject.Text;
                mail.Body = txtContent.Text;


                //send the message 
                txtMailServer.Text = "mail.electrowebsolution.com";
                SmtpClient smtp = new SmtpClient(txtMailServer.Text, 25);

                //IMPORANT:  Your smtp login email MUST be same as your FROM address. 
                NetworkCredential Credentials = new NetworkCredential(txtFrom.Text, txtPass.Text);
                smtp.Credentials = Credentials;

                smtp.Send(mail);
                lblMsgMail.Text = "Sent email (" + txtSubject.Text + ") to " + txtTo.Text;  

            }
            catch (Exception ex)
            {
                lblMsgError.Text = ex.Message;
                //throw;
            }

             
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {

        }
    }
}