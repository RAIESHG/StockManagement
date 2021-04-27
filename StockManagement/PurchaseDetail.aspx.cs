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
    public partial class PurchaseDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            prevPurchaseDetails();
        }

        public string prevPurchaseDetails()
        {
            string dropdown = DropDownList1.SelectedValue.ToString();



            int quantity = 0;
            string dateForButton = DateTime.Now.AddDays(-31).ToString("d");


            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand($"Select * from dbo.CustomerPurchase c Join dbo.Item i on c.ItemCode = i.ItemCode where MemberNumber='{dropdown}' and BillingDate>='{dateForButton}'", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;
            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        string itemcode = QueryReader.GetString(0);
                        string itemname = QueryReader.GetString(6);
                        string membernumber = QueryReader.GetString(1);
                        string quantities = QueryReader.GetString(3);
                        
                        string billingdate = QueryReader.GetDateTime(2).ToString("d");
                     
                        data += "<tr><td> "+ itemcode + "</td><td> "+ itemname + "</td><td> " + membernumber + "</td><td> " + quantities + "</td><td> " + billingdate + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }
                return data;
            }
        }
    }
}