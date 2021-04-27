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
    public partial class ItemStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getWhileLoopData();
        }
        public string getWhileLoopData()
        {
            string dropdown = DropDownList1.SelectedValue.ToString();
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand("Select * from dbo.Stock where ItemCode='"+dropdown+"'", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;
           
            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        string itemCode = QueryReader.GetString(1);
                        int Quantity = QueryReader.GetInt32(2);
                        string StockPurchaseDate = QueryReader.GetString(3);
                        string status = "";
                        if (Quantity < 10)
                        {
                            status = "Running out of stock";
                        }
                        else if (Quantity == 0)
                        {
                            status = "Out of  Stock";
                        }
                        else {
                            status = "Available in Stock";
                        }

                        data += "<tr><td> " + itemCode + "</td><td> " + Quantity+ "</td><td> "+StockPurchaseDate+ "</td><td> " + status + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }
                return data;
            }
        }
    }

}
