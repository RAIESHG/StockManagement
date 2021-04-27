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
    public partial class Purchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);

            mySqlConnection.Open();
            SqlCommand cmd = new SqlCommand("Insert into dbo.CustomerPurchase values(@ItemCode,@MemberNumber,@BillingDate,@Quantity)", mySqlConnection);
            cmd.Parameters.AddWithValue("@ItemCode", "1");
            cmd.Parameters.AddWithValue("@MemberNumber", "1");
            cmd.Parameters.AddWithValue("@BillingDate", "2020-05-05");
            cmd.Parameters.AddWithValue("@Quantity", "1");
            cmd.ExecuteNonQuery();
            cmd.Dispose();

        }
    }
}