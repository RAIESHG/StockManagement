using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace StockManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["usertype"] = "";

        }
        public string runningOutofStock()
        {
            try { 
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand("Select * from dbo.Stock where Quantity<10", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;

            string data = "";
            string stock = "";
            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {
                    Response.Redirect("AddItem.aspx");


                    mySqlConnection.Close();

                }
                else {
                    MessageBox.Show("Login Failure Please Try Again");


                }

            } return data;
        }
            catch (Exception err)
            {
                string rawMessage = err.Message;
                string convertedMessage = rawMessage.Replace("'", "");
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
                return "invalid";


            }
}

        protected void Button1_Click(object sender, EventArgs e)
        {
            try { 
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand($"Select * from dbo.Users where dbo.Users.Username='{usernametb.Text}' and dbo.Users.Password='{passwordtb.Text}'", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;

         
            string stock = "";
            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {
                Session["usertype"] = usernametb.Text;
                Response.Redirect("AddItem.aspx");
                
                    /*MessageBox.Show(stock);
                    runningOutofStock();
                    mySqlConnection.Close();*/

                }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('Incorrect Credentials');</script>");

                    }
                }
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