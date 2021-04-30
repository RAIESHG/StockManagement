
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.IO;
using System.Text;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;


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
                    ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('Stock has been updated');</script>");
                    getBills();

                }
                else {

                    ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('Sorry Desired Quantity not Available in Stock');</script>");


                }

            }
            catch (Exception err)
            {
                string rawMessage = err.Message;
        string convertedMessage = rawMessage.Replace("'", "");
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
              
            }
}

        public void BillGenerator(string membernumber, string itemname, string category, int quantity, int unitprice, int price)
        {
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    StringBuilder sb = new StringBuilder();

                    //Generate Invoice (Bill) Header.
                    sb.Append("<div class='table - responsive'>");
                    sb.Append("<p style='color: black; '> Company Name: RBSS </p>");
                    sb.Append($"<p style='color: black; '> Member Number: {membernumber} </p>");
                    sb.Append($"<p style='color: black; '> Date:{DateTime.Now} </p>");
                    sb.Append("-----------------------------------------------------------------------------------------------------------------------------------------------");
                    sb.Append("<table class='table' border='1' >");
                    sb.Append("<tr style='background - color:#507CD1;'>");
                    sb.Append("<td style='color: black; '> Item Name </td> ");
                    sb.Append("<td style='color: black;'>Category</td>");
                    sb.Append("<td style='color: black;'> Quantity </td> ");
                    sb.Append("<td style = 'color:black;'> Unit Price </td>");
                    sb.Append(" <td style='color: black;'> Total </td>");
                    sb.Append("</tr>");
                    sb.Append("<tr style='background - color:#507CD1;'>");
                    sb.Append($"<td style='color: black; '> {itemname} </td> ");
                    sb.Append($"<td style='color: black; '> {category} </td> ");
                    sb.Append($"<td style='color: black; '> {quantity} </td> ");
                    sb.Append($"<td style='color: black; '> {unitprice} </td> ");
                    sb.Append($"<td style='color: black; '> {price} </td> ");
                    sb.Append("</tr>");

                    sb.Append("</table>");
                    sb.Append("</div>");

                    //Export HTML String as PDF.
                    StringReader sr = new StringReader(sb.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=bill" + ".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }


        public string getBills()
        {
            try
            {
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
                            string membernumber = DropDownList2.Text;
                            string status = "";
                            data += "<tr><td> " + itemname + "</td><td> " + category + "</td><td> " + quantity + "</td><td> " + unitprice + "</td><td> " + price + "</td><tr> ";
                            BillGenerator(membernumber, itemname, category, quantity, unitprice, price);
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