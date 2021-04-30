
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace StockManagement
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["counter"].ToString() != "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                Session["counter"] = 1;
            }
        }
        protected string LowStock()     //check if low stock, if yes, show modal alert
        {
            string query = "";
            query = $"Select* from dbo.Stock s join dbo.Item i on i.ItemCode = s.ItemCode where s.Quantity < 10";

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
                        




                        data += "<tr><td> " + itemCode + "</td><td> " + itemname + "</td><td> " + Quantity + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }
                return data;

            }
        }



        }
   
}