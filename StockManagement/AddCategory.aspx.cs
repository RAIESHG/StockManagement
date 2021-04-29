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
    public partial class AddCategory : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand($"Insert into dbo.Category values('{catnametb.Text}','{categorydesctb.Text}')", mySqlConnection);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                throw new ArithmeticException("Access denied - You must be at least 18 years old.");

            }
            catch (Exception err)
            {
                string rawMessage = err.Message;
                string convertedMessage = rawMessage.Replace("'", "");
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
            }



            /*         cmd.Parameters.AddWithValue("@ItemCode", $"{itemname}");
                     cmd.Parameters.AddWithValue("@MemberNumber", $"{member}");
                     cmd.Parameters.AddWithValue("@BillingDate", "2021-05-04");
                     cmd.Parameters.AddWithValue("@Quantity", $"{quantity}");*/


        }         
           
        }

}