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
    public partial class DisplayItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


        }
        public string getWhileLoopData()
        {

            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand("Select * from dbo.member", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;
            cmd.CommandText = "Select* from member; ";
            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {
                   
                    while (QueryReader.Read())
                    {
                        string membername = QueryReader.GetString(0);
                        string membernumber = QueryReader.GetString(1);
                        string address = QueryReader.GetString(2);
                        data += "<tr><td> " + membername + "</td><td> " + address + "</td><tr> ";
                    }
                    mySqlConnection.Close();
                  
                }  return data;
            }
        }
    } 


        }
    
