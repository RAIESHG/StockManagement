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

        public string unsoldItems()
        {

            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            string invoiceddate = DateTime.Now.AddDays(-31).ToString("d");
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand($"Select * from dbo.Stock s Join dbo.Item i on s.ItemCode=i.ItemCode Join dbo.CustomerPurchase c on c.ItemCode=i.ItemCode where c.BillingDate<='{invoiceddate}'", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;

            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        int itemcode = QueryReader.GetInt32(4);
                        string itemname = QueryReader.GetString(5);
                        string description = QueryReader.GetString(6);
                        int price = QueryReader.GetInt32(7);
                        string category = QueryReader.GetString(8);
                        string billingdate = QueryReader.GetDateTime(11).ToString("d");





                        data += "<tr><td> " + itemcode + "</td><td> " + itemname + "</td><td> " + description + "</td><td> " + price + "</td><td> " + category + "</td><td> " + billingdate + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }
                return data;
            }
        }
    }
}