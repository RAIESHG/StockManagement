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
    public partial class AddStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try { 
            string itemcode = DropDownList1.SelectedValue.ToString();

        

            int quantity = 0;
            int Quantity = 0; 
            if (quantitytb.Text != "")
            {
                quantity = int.Parse(quantitytb.Text);
            }
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            mySqlConnection.Open();
            SqlCommand selectcommand = new SqlCommand($"Select * from dbo.Stock where ItemCode = '{itemcode}' ", mySqlConnection);
                  
            selectcommand.Connection = mySqlConnection;
            string data = "";

            using (SqlDataReader QueryReader = selectcommand.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {

                         Quantity = QueryReader.GetInt32(2) + quantity;
                        string StockPurchaseDate = QueryReader.GetDateTime(3).ToString("d");



                    }
            

                }
          
                /*         cmd.Parameters.AddWithValue("@ItemCode", $"{itemname}");
                         cmd.Parameters.AddWithValue("@MemberNumber", $"{member}");
                         cmd.Parameters.AddWithValue("@BillingDate", "2021-05-04");
                         cmd.Parameters.AddWithValue("@Quantity", $"{quantity}");*/

          
            }
        
            SqlCommand commandd = new SqlCommand($"Update dbo.Stock set Quantity={Quantity}, StockPurchaseDate='{DateTime.Now.ToString("d")}' where ItemCode='{itemcode}'", mySqlConnection);
            commandd.ExecuteNonQuery();
            commandd.Dispose();
            mySqlConnection.Close();
            ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('Values Updated');</script>");

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