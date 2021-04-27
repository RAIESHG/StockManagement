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
    public partial class AddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);

            mySqlConnection.Open();
            SqlCommand cmd = new SqlCommand("Insert into dbo.Item values(@ItemCode,@ItemName,@Description,@Price,@Category)", mySqlConnection);
            cmd.Parameters.AddWithValue("@ItemCode", "1");
            cmd.Parameters.AddWithValue("@ItemName", "Raiesh Ghimire");
            cmd.Parameters.AddWithValue("@Description", "Sinamangal-9, Kathmandu");
            cmd.Parameters.AddWithValue("@Price", 200);
            cmd.Parameters.AddWithValue("@Category", "raieshg@gmail.com");
            
            cmd.ExecuteNonQuery();
            cmd.Dispose();

        }
    }
}