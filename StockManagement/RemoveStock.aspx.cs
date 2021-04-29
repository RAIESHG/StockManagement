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
    public partial class RemoveStock : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string getstockforremoval()
        {
            try { 
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            string dateForButton = DateTime.Now.AddDays(-100).ToString("d");
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand($@"Select * from dbo.Item Join dbo.Stock on dbo.Stock.ItemCode=dbo.Item.ItemCode  
where dbo.Item.ItemCode IN ((Select (dbo.Item.ItemCode) from dbo.Item
            Join dbo.Stock on dbo.Item.ItemCode = dbo.Stock.ItemCode)
            EXCEPT
            (Select dbo.Item.ItemCode from dbo.Item
            Join dbo.Stock on dbo.Item.ItemCode = dbo.Stock.ItemCode
            where dbo.Stock.StockPurchaseDate >= '{dateForButton}')) ", mySqlConnection);
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
                        string lastpurchasedon = QueryReader.GetDateTime(8).ToString("d");


                            if (Quantity > 0)
                            {
                                data += "<tr><td> " + itemCode + "</td><td> " + itemname + "</td><td> " + Quantity + "</td><td> " + lastpurchasedon + "</td><tr> ";
                            }
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            List<int> itemlist = new List<int>();


            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
                string dateForButton = DateTime.Now.AddDays(-100).ToString("d");
                SqlConnection mySqlConnection = new SqlConnection(connectionstring);
                SqlCommand cmd = new SqlCommand($@"Select * from dbo.Item Join dbo.Stock on dbo.Stock.ItemCode=dbo.Item.ItemCode  
                where dbo.Item.ItemCode IN ((Select (dbo.Item.ItemCode) from dbo.Item
                Join dbo.Stock on dbo.Item.ItemCode = dbo.Stock.ItemCode)
                EXCEPT
                (Select dbo.Item.ItemCode from dbo.Item
                Join dbo.Stock on dbo.Item.ItemCode = dbo.Stock.ItemCode
                where dbo.Stock.StockPurchaseDate >= '{dateForButton}')) ", mySqlConnection);
                mySqlConnection.Open();

                cmd.Connection = mySqlConnection;

       

                using (SqlDataReader QueryReader = cmd.ExecuteReader())
                {
                    if (QueryReader.HasRows)
                    {

                        while (QueryReader.Read())
                        {
                            int itemCode = QueryReader.GetInt32(0);
                        
                            itemlist.Add(itemCode);



                        }

                    }
                 
                }
            
         
             


            
            for (int i = 0; i < itemlist.Count; i++)
            {
                SqlCommand commandd = new SqlCommand($"Update dbo.Stock set Quantity=0 where ItemCode={itemlist[i]} ", mySqlConnection);
                commandd.ExecuteNonQuery();
                commandd.Dispose();
            }
            mySqlConnection.Close();

        }


    }
}