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
    public partial class Change_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            mySqlConnection.Open();
            SqlCommand cmd = new SqlCommand($"Update dbo.Users set Password='{passwordtb.Text}' where Username='raieshg'", mySqlConnection);
            cmd.Connection = mySqlConnection;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            mySqlConnection.Close();


        
               
            }
        }
    
}