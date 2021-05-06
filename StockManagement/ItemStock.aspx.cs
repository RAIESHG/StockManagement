using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace StockManagement
{
    public partial class ItemStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void checkStockBtnPress(object sender, EventArgs e)    //trigger function onlcick
        {
            getStockData();
        }
        public string getStockData()        //get items along with stock status
        {
            try { 
            string dropdown = DropDownList1.SelectedValue.ToString();
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            int Quantity = 0;
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
                        int itemCode = QueryReader.GetInt32(1);
                        Quantity = QueryReader.GetInt32(2);
                        string StockPurchaseDate = QueryReader.GetDateTime(3).ToString("d");
                        /*string StockPurchaseDate = QueryReader.GetString(3);*/
                        string status = "";
                        if (Quantity < 10 && Quantity >0)
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


                        data += "<tr><td>"+itemCode+"</td><td>"+Quantity+"</td><td>"+StockPurchaseDate+"</td><td>"+status+"</td><tr> ";
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
