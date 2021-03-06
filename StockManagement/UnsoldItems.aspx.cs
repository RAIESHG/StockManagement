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
    public partial class UnsoldItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string unsolditems()     //Retrieves current date and check for stock which are not sold for more than 31days and displays it in a table.


        {
            try { 

            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            string dateForButton = DateTime.Now.AddDays(-31).ToString("d");
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand($@"Select * from dbo.Item Join dbo.Stock on dbo.Stock.ItemCode=dbo.Item.ItemCode Join dbo.CustomerPurchase on dbo.CustomerPurchase.ItemCode=dbo.Item.ItemCode where dbo.Item.ItemCode IN ((Select (dbo.Item.ItemCode) from dbo.Item
            Join dbo.CustomerPurchase on dbo.Item.ItemCode = dbo.CustomerPurchase.ItemCode)
            EXCEPT
            (Select dbo.Item.ItemCode MemberNumber from dbo.Item
            Join dbo.CustomerPurchase on dbo.Item.ItemCode = dbo.CustomerPurchase.ItemCode
            where dbo.CustomerPurchase.BillingDate >= '{dateForButton}')); ", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;

            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        int itemCode = QueryReader.GetInt32(0);
                        string itemname = QueryReader.GetString(1);
                        int Quantity = QueryReader.GetInt32(7);
                        string lastpurchasedon = QueryReader.GetDateTime(12).ToString("d");




                        data += "<tr><td> " + itemCode + "</td><td> " + itemname + "</td><td> " + Quantity + "</td><td> " + lastpurchasedon + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }
                return data;
            }
        }
            catch (Exception err)
            {
                string rawMessage = err.Message;
        string convertedMessage = rawMessage.Replace("'", "");
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
                return "invalid";


            }
}
    }
}