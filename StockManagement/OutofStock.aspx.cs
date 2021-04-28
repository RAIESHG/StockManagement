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
    public partial class OutofStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
      

        }
        public string getOutofStock()
        {
         
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand("Select * from dbo.Stock s join dbo.Item i on i.ItemCode=s.ItemCode where s.Quantity=0", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;

            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        int itemCode = QueryReader.GetInt32(1);
                        string itemname = QueryReader.GetString(5);
                        int Quantity = QueryReader.GetInt32(2);
                        string StockPurchaseDate = QueryReader.GetString(3);
                 
                     


                        data += "<tr><td> " + itemCode + "</td><td> " + itemname + "</td><td> " + Quantity + "</td><td> " + StockPurchaseDate +"</td><tr> ";
                    }
                    mySqlConnection.Close();

                }
                return data;
            }
        }
    }
}