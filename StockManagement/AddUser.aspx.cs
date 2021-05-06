using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.ComponentModel.DataAnnotations;

namespace StockManagement
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usertype"] != null)        //only admin access
            {
                if (Session["usertype"].ToString() != "admin")
                {
                    Response.Redirect("/");
                }
            }
        }

        protected void addUserBtnPress(object sender, EventArgs e)    //The user data inserted in the textfield is retrieved and added to the user database table.


        {
            try
            {
                if (!(new EmailAddressAttribute().IsValid(userNametb.Text)))
                {
                    throw new Exception("Incorrect Email Format");
                }
                    

                string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
                SqlConnection mySqlConnection = new SqlConnection(connectionstring);
                mySqlConnection.Open();

                SqlCommand cmd = new SqlCommand($"Insert into dbo.Users values('{userNametb.Text}','{passwordtb.Text}')", mySqlConnection);
                cmd.ExecuteNonQuery();

                cmd.Dispose();

                ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('New User Added!');</script>");


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