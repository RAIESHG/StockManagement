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
    public partial class AddMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
           string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
          
                mySqlConnection.Open();
                SqlCommand cmd = new SqlCommand("Insert into dbo.Member values(@MemberNumber,@MemberName,@Address,@ContactNumber,@Email,@MemberType)", mySqlConnection);
                cmd.Parameters.AddWithValue("@MemberNumber", "1");
                cmd.Parameters.AddWithValue("@MemberName", "Raiesh Ghimire");
                cmd.Parameters.AddWithValue("@Address", "Sinamangal-9, Kathmandu");
                cmd.Parameters.AddWithValue("@ContactNumber", "98601200042");
                cmd.Parameters.AddWithValue("@Email", "raieshg@gmail.com");
            cmd.Parameters.AddWithValue("@MemberType", "Exclusive");
            cmd.ExecuteNonQuery();
                cmd.Dispose();




           
         
        }
    }
    }
