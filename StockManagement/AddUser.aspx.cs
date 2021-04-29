using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace StockManagement
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {


                string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
                SqlConnection mySqlConnection = new SqlConnection(connectionstring);
                mySqlConnection.Open();

                SqlCommand cmd = new SqlCommand($"Insert into dbo.Users values('{userNametb.Text}','{passwordtb.Text}')", mySqlConnection);
                cmd.ExecuteNonQuery();

                cmd.Dispose();

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