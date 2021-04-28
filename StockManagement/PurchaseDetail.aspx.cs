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
            /*ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);*/

        }

        public string prevPurchaseDetails()
        {
            string dropdown = DropDownList1.SelectedValue.ToString();



            int quantity = 0;
            string dateForButton = DateTime.Now.AddDays(-31).ToString("d");


            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand($"Select * from dbo.CustomerPurchase c Join dbo.Item i on c.ItemCode = i.ItemCode  where MemberNumber='{dropdown}' and BillingDate>='{dateForButton}'", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;
            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        int itemcode = QueryReader.GetInt32(1);
                        string itemname = QueryReader.GetString(6);
                        int membernumber = QueryReader.GetInt32(2);
                        int quantities = QueryReader.GetInt32(4);
                        
                        string billingdate = QueryReader.GetDateTime(3).ToString("d");
                     
                        data += "<tr><td> "+ itemcode + "</td><td> "+ itemname + "</td><td> " + membernumber + "</td><td> " + quantities + "</td><td> " + billingdate + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }

                return data;
            }
        }
    }
}