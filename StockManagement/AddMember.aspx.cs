using System;

using System.Configuration;
using System.Data.SqlClient;


namespace StockManagement
{
    public partial class AddMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string data = DropDownList1.SelectedValue.ToString();
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
          
                mySqlConnection.Open();
                SqlCommand cmd = new SqlCommand($"Insert into dbo.Member values('{membernumbertb.Text}','{membernametb.Text}','{addresstb.Text}','{contactnumbertb.Text}','{emailtb.Text}','{membertypetb.Text}')", mySqlConnection);
         
            cmd.ExecuteNonQuery();
                cmd.Dispose();




           
         
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);

            mySqlConnection.Open();
            string data = DropDownList1.SelectedValue.ToString();
            SqlCommand cmd = new SqlCommand("Delete from dbo.Member Where MemberNumber='"+data+"'", mySqlConnection);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }

        protected void SqlDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
        {

        }
    }
    }
