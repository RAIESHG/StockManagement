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
        public string getOutofStock()       //get items and sort.. if quantity less than 10
        {
            try {
                string query = "";
                if (DropDownList1.SelectedValue == "namAsc")
                {
                    query = $"Select * from dbo.Stock s join dbo.Item i on i.ItemCode=s.ItemCode where s.Quantity<10 order by ItemName";
                }
                else if(DropDownList1.SelectedValue == "namDesc")
                {
                    query = $"Select * from dbo.Stock s join dbo.Item i on i.ItemCode=s.ItemCode where s.Quantity<10 order by ItemName DESC";
                }
                else if(DropDownList1.SelectedValue == "quaDesc")
                {
                    query = $"Select * from dbo.Stock s join dbo.Item i on i.ItemCode=s.ItemCode where s.Quantity<10 order by quantity DESC";
                }
                else if(DropDownList1.SelectedValue == "quaAsc")
                {
                    query = $"Select * from dbo.Stock s join dbo.Item i on i.ItemCode=s.ItemCode where s.Quantity<10 order by quantity";
                }
                else if(DropDownList1.SelectedValue == "latestStock")
                {
                    query = $"Select * from dbo.Stock s join dbo.Item i on i.ItemCode=s.ItemCode where s.Quantity<10 order by StockPurchaseDate DESC";
                }
                else if(DropDownList1.SelectedValue == "oldestStock")
                {
                    query = $"Select * from dbo.Stock s join dbo.Item i on i.ItemCode=s.ItemCode where s.Quantity<10 order by StockPurchaseDate";
                }
                if (CheckBox1.Checked)
                {
                    query = $"Select * from dbo.Stock s join dbo.Item i on i.ItemCode=s.ItemCode where s.Quantity>0";
                }
                string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(query, mySqlConnection);
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
                        string StockPurchaseDate = QueryReader.GetDateTime(3).ToString("d");
                 
                     


                        data += "<tr><td> " + itemCode + "</td><td> " + itemname + "</td><td> " + Quantity + "</td><td> " + StockPurchaseDate +"</td><tr> ";
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

        protected void sortBtnPress(object sender, EventArgs e)        //trigger function onclick
        {
            getOutofStock();
        }

        
    }
}