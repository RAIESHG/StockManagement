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
    public partial class InactiveCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string inactiveMembers() 
        {

            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            string dateForButton = DateTime.Now.AddDays(-31).ToString("d");
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand($@"SELECT dbo.Member.memberNumber,dbo.Member.memberName,dbo.Member.Address,
dbo.Member.ContactNumber, dbo.Member.Email,dbo.Member.membertype, MAX(dbo.CustomerPurchase.BillingDate) AS 'Max Date'
from dbo.Member Join dbo.CustomerPurchase on dbo.Member.MemberNumber = dbo.CustomerPurchase.MemberNumber
where dbo.CustomerPurchase.BillingDate! > '{dateForButton}'
GROUP BY dbo.Member.MemberNumber, dbo.Member.memberName, dbo.Member.Address, dbo.Member.ContactNumber, dbo.Member.Email, dbo.Member.membertype", mySqlConnection);
            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;

            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        int membernumber = QueryReader.GetInt32(0);
                        string memberName = QueryReader.GetString(1);
                        string address = QueryReader.GetString(2);
                        string contactnumber = QueryReader.GetString(3);
                        string email = QueryReader.GetString(4);
                        string membertype = QueryReader.GetString(5);





                        data += "<tr><td> " + membernumber + "</td><td> " + memberName + "</td><td> " + address + "</td><td> " + contactnumber + "</td><td> " + email + "</td><td> " + membertype + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }
                return data;
            }
        }
    }
}