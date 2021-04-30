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

        protected void Button1_Click(object sender, EventArgs e)    // The category data inserted in the textfield is retrieved and added to the category database table.


        {
            try
            {

                string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString; 

                SqlConnection mySqlConnection = new SqlConnection(connectionstring);

                mySqlConnection.Open();
                SqlCommand cmd = new SqlCommand($"Insert into dbo.Category values('{catnametb.Text}','{categorydesctb.Text}')", mySqlConnection);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('Values Updated');</script>");//show values updated alert

            }
            catch (Exception err)
            {
                string rawMessage = err.Message;
                string convertedMessage = rawMessage.Replace("'", "");
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>"); //show error alert
            }




        }         
           
        }

}