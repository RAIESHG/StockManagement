using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagement
{
    public partial class UserChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string email = Session["usertype"].ToString();

                string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
                SqlConnection mySqlConnection = new SqlConnection(connectionstring);
                mySqlConnection.Open();
                SqlCommand cmd = new SqlCommand($"Update dbo.Users set Password='{passwordtb.Text}' where username='{email}'", mySqlConnection);
                cmd.Connection = mySqlConnection;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                mySqlConnection.Close();
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