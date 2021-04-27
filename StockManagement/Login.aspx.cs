using System;
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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        public string runningOutofStock()
        {

            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand("Select * from dbo.Stock where Quantity<10", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;

            string data = "";
            string stock = "";
            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        string itemCode = QueryReader.GetString(1);
                        int Quantity = QueryReader.GetInt32(2);
                        string StockPurchaseDate = QueryReader.GetString(3);

                        stock = stock + "\n" + itemCode;


               
                    }
                    MessageBox.Show(stock);

                    mySqlConnection.Close();

                }
                return data;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            runningOutofStock();
        }
    }
}