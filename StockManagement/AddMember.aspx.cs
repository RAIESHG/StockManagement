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

        protected void addMemberBtnPress(object sender, EventArgs e)
        {
            try {

                
                string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
                SqlConnection mySqlConnection = new SqlConnection(connectionstring);
                mySqlConnection.Open();
                
                SqlCommand cmd = new SqlCommand($"Insert into dbo.Member values('{membernametb.Text}','{addresstb.Text}','{contactnumbertb.Text}','{emailtb.Text}','{DropDownList1.SelectedValue}')", mySqlConnection);
                cmd.ExecuteNonQuery();
                
                cmd.Dispose();
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('Values Updated');</script>");

            }
            catch (Exception err)
            {
                string rawMessage = err.Message;
        string convertedMessage = rawMessage.Replace("'", "");
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
            }


}

       

        protected void SqlDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
        {

        }
    }
    }
