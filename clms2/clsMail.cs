using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace clms2
{
    public class clsMail
    {
        public void send_mail_Approval_Test(string email = "Kapildevblog@gmail.com", string approval_status = "", string remarks="")
        {
            try
            {
                string from, pass = "";
                System.Net.Mail.MailMessage Msg = new System.Net.Mail.MailMessage();
                // Sender e-mail address.
                //Msg.From = new MailAddress(txtEmail.Text);
                from = "bkbirendramca@outlook.com";
                pass = "bkp@1971";
                Msg.From = new MailAddress(from, "GREENHRM SOLUTION");

                // Msg.From = new MailAddress(txtEmail.Text); 
                // Recipient e-mail address.
                Msg.To.Add(email);
                Msg.Subject = "Your Emp Approval Details";
                //Msg.Body = "This Emplyee has been " + approval_status + " by cc " + "If Rejected Thne Remarks is" + remarks;
                Msg.Body = "Hi, <br/>Please check your Appoval Details<br/><br/>Your Approval Status is -:" + approval_status + "<br/><br/>  Remarks :" + remarks + "<br/><br/>" + "";
                // Msg.Body = "Hi, <br/>Please check your Login Details<br/><br/>Your Username: " + ds.Tables[0].Rows[0]["vendor_reg_code"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["pwd"] + "<br/><br/>";
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

            }
            catch(Exception ex)
            {
             
                
            }
            finally
            {

            }
                  
        }
        //public string send_Emp_Approval_mail_to_Vendor(string email="Kapildevblog@gmail.com" , string emp_code,string approval_status)
        //{
        //    string Msg_Error = "";
        //    try
        //    {
        //        string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        //        DataSet ds = new DataSet();
        //        using (SqlConnection con = new SqlConnection(constr))
        //        {
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_emp Where email= '" + emp_code.Trim() + "' and work_worder='" + workorderno.Trim() + "'", con);
        //           //// SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_vendor_info Where email= '" + txtEmail.Text.Trim() + "' and work_worder='" + txtWONo.Text.Trim() + "'", con);
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            da.Fill(ds);
        //            con.Close();

        //        }
        //        if (ds.Tables[0].Rows.Count > 0)
        //        {
        //            string from, pass = "";
        //            System.Net.Mail.MailMessage Msg = new System.Net.Mail.MailMessage();
        //            // Sender e-mail address.
        //            //Msg.From = new MailAddress(txtEmail.Text);
        //            from = "bkbirendramca@outlook.com";
        //            pass = "bkp@1971";
        //            Msg.From = new MailAddress(from, "GREENHRM SOLUTION");

        //            // Msg.From = new MailAddress(txtEmail.Text); 
        //            // Recipient e-mail address.
        //            Msg.To.Add(email);
        //            Msg.Subject = "Your Password Details";
        //            //Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username:" + "cc" + "<br/><br/>Your Password:" + "1" + "<br/><br/>";
        //            Msg.Body = "Hi, <br/>Please check your Login Details<br/><br/>Your Username: " + ds.Tables[0].Rows[0]["vendor_reg_code"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["pwd"] + "<br/><br/>";
        //            Msg.IsBodyHtml = true;
        //            // your remote SMTP server IP.
        //            SmtpClient smtp = new SmtpClient();
        //            smtp.Host = "smtp-mail.outlook.com";
        //            // smtp.Host = "smtp.mail.yahoo.com";  //Require secure site
        //            //smtp.Host = "smtp.gmail.com";   //Require secure site
        //            smtp.Port = 587;
        //            smtp.EnableSsl = true;
        //            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        //            smtp.Credentials = new System.Net.NetworkCredential(from, pass);
        //            smtp.Send(Msg);
        //            //Msg = null;
        //            //lblMsgError.Text = "";
        //            //lblMsgMail.Text = "";

        //           // lblMsgMail.Text = "Your Password Details Sent to your mail";
        //            // Clear the textbox valuess
        //            // txtEmail.Text = "";
        //        }
        //        else
        //        {

        //            Msg_Error = "The Email you entered does not exists.";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Response.Write(ex.Message);

        //        Msg_Error = "Error : " + ex.Message;
        //    }
        //    return Msg_Error;
        //}
    }
}