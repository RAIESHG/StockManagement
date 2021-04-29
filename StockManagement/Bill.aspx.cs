﻿using System;
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
    public partial class Bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getbill();
        }
        int quantity = 0;
        public string getbill()
        {
            try { 
            string dropdown = DropDownList1.SelectedValue.ToString();



            int quantity = 0;
            if (TextBox1.Text != "")
            {
                quantity = int.Parse(TextBox1.Text);
            }

            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand("Select * from dbo.Item i join category c on i.CategoryNumber=c.CategoryNumber where i.ItemCode='" + dropdown + "'", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;
            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        string itemname = QueryReader.GetString(1);
                        int unitprice = QueryReader.GetInt32(3);
                        int price = QueryReader.GetInt32(3) * quantity;
                        string category = QueryReader.GetString(6);
                        string status = "";
                        data += "<tr><td> " + itemname + "</td><td> " + category + "</td><td> " + quantity + "</td><td> " + unitprice + "</td><td> " + price + "</td><tr> ";
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
            try { 
            string member = DropDownList2.SelectedValue.ToString();

            string itemname = DropDownList1.SelectedValue.ToString();
            int stockval = checkstock(itemname);
           
                quantity = 0;
                int Quantity = 0;
                if (TextBox1.Text != "")
                {
                    quantity = int.Parse(TextBox1.Text);
                }
                if (stockval >= quantity)
                {
                string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
                SqlConnection mySqlConnection = new SqlConnection(connectionstring);
                mySqlConnection.Open();
                SqlCommand cmd = new SqlCommand($"Insert into dbo.CustomerPurchase values('{itemname}','{member}','{DateTime.Now}','{quantity}')", mySqlConnection);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                SqlCommand selectcommand = new SqlCommand($"Select * from dbo.Stock where ItemCode = '{itemname}' ", mySqlConnection);
                selectcommand.Connection = mySqlConnection;
                string data = "";
                using (SqlDataReader QueryReader = selectcommand.ExecuteReader())
                {
                    if (QueryReader.HasRows)
                    {

                        while (QueryReader.Read())
                        {

                            Quantity = QueryReader.GetInt32(2) - quantity;
                            string StockPurchaseDate = QueryReader.GetDateTime(3).ToString("d");



                        }


                    }

                    /*         cmd.Parameters.AddWithValue("@ItemCode", $"{itemname}");
                             cmd.Parameters.AddWithValue("@MemberNumber", $"{member}");
                             cmd.Parameters.AddWithValue("@BillingDate", "2021-05-04");
                             cmd.Parameters.AddWithValue("@Quantity", $"{quantity}");*/


                }

                selectcommand.ExecuteNonQuery();

                selectcommand.Dispose();
                SqlCommand commandd = new SqlCommand($"Update dbo.Stock set Quantity={Quantity} where ItemCode='{itemname}' ", mySqlConnection);
                commandd.ExecuteNonQuery();
                commandd.Dispose();
                mySqlConnection.Close();
            }
            else {

                MessageBox.Show("Sorry Desired Quantity not Available in Stock");

            }
        }
            catch (Exception err)
            {
                string rawMessage = err.Message;
        string convertedMessage = rawMessage.Replace("'", "");
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
              
            }
}
        public int checkstock(String item)
        {
            try{
            string dropdown = DropDownList1.SelectedValue.ToString();
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            int Quantity = 0;
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand($"Select * from dbo.Stock where ItemCode='{item}'", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;

            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                    
                        Quantity = QueryReader.GetInt32(2);
               
             
                      


                    }
                    mySqlConnection.Close();

                }
                return Quantity;
            }
        }
            catch (Exception err)
            {
                string rawMessage = err.Message;
        string convertedMessage = rawMessage.Replace("'", "");
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
                return 0;

            }
} 
    }
}