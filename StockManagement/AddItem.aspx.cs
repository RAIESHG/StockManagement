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
            try { 

            int categoryid = int.Parse(DropDownList1.SelectedValue.ToString());
            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);

            mySqlConnection.Open();
            SqlCommand cmd = new SqlCommand($"Insert into dbo.Item values('{itemnametb.Text}','{descriptiontb.Text}','{pricetb.Text}','{categoryid}')", mySqlConnection);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            int itemNumber = 0;


            SqlCommand selectcommand = new SqlCommand($"Select * from dbo.Item where ItemName='{itemnametb.Text}'", mySqlConnection);

            using (SqlDataReader QueryReader = selectcommand.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {

              
                         itemNumber = QueryReader.GetInt32(0);   



                    }


                }

                /*         cmd.Parameters.AddWithValue("@ItemCode", $"{itemname}");
                         cmd.Parameters.AddWithValue("@MemberNumber", $"{member}");
                         cmd.Parameters.AddWithValue("@BillingDate", "2021-05-04");
                         cmd.Parameters.AddWithValue("@Quantity", $"{quantity}");*/


            }
         

            selectcommand.ExecuteNonQuery();

            selectcommand.Dispose();
            SqlCommand insertcommand = new SqlCommand($"Insert into dbo.Stock values({itemNumber},{int.Parse(quantitytb.Text)},'{DateTime.Now.ToString("d")}')", mySqlConnection);
            insertcommand.ExecuteNonQuery();

            insertcommand.Dispose();
        }
            catch (Exception err)
            {
                string rawMessage = err.Message;
        string convertedMessage = rawMessage.Replace("'", "");
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
            }



}
    }
}