using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagement
{
    public partial class Change_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usertype"] != null)
            {
                if (Session["usertype"].ToString() != "admin")
                {
                    Response.Redirect("/");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)    //Change password, only accessed by admin
        {
            try { 
            int dropdown = int.Parse(DropDownList1.SelectedValue.ToString());
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            mySqlConnection.Open();
            SqlCommand cmd = new SqlCommand($"Update dbo.Users set Password='{repasswordtb.Text}' where Userid={dropdown}", mySqlConnection);
            cmd.Connection = mySqlConnection;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            mySqlConnection.Close();


                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("stockmanagementbot@gmail.com");
                message.To.Add(new MailAddress(DropDownList1.SelectedItem.Text));
                message.Subject = "New Password";
                message.IsBodyHtml = false; //to make message body as html
                message.Body = "Your password is: " + repasswordtb.Text;
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("stockmanagementbot@gmail.com", "stockmanagementbot123");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);

                ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('Email has been sent!');</script>");

            }
            catch (Exception err)
            {
                string rawMessage = err.Message;
                string convertedMessage = rawMessage.Replace("'", "");
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
              
            }




}
        }
    
}