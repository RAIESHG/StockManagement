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
            SqlCommand cmd = new SqlCommand($"Insert into dbo.Item values('{itemcodetb.Text}','{itemnametb.Text}','{descriptiontb.Text}','{pricetb.Text}','{categorytb.Text}')", mySqlConnection);
            SqlCommand command = new SqlCommand($"Insert into dbo.Stock values('21','{itemcodetb.Text}','{quantitytb.Text}','{DateTime.Now.ToString("d")}')", mySqlConnection);


            cmd.ExecuteNonQuery();
            cmd.Dispose();

            command.ExecuteNonQuery();
            command.Dispose();

        }
    }
}