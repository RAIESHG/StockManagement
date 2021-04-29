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
    public partial class PurchaseDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
            }
            if (!IsPostBack)
            {
                Calendar2.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            prevPurchaseDetails();
            /*ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);*/

        }

        public string prevPurchaseDetails()
        {
            try { 
            string dropdown = DropDownList1.SelectedValue.ToString();

            string fromDate = Calendar1.SelectedDate.ToString("d");
            string toDate = Calendar2.SelectedDate.ToString("d");
            int quantity = 0;
            string dateForButton = DateTime.Now.AddDays(-31).ToString("d");
            

            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
            string query = "";
            if (CheckBox1.Checked)
            {
                query = $"Select * from dbo.CustomerPurchase c Join dbo.Item i on c.ItemCode = i.ItemCode  where MemberNumber='{dropdown}' and BillingDate>='{dateForButton}'";
            }
            else
            {
                query = $"Select * from dbo.CustomerPurchase c Join dbo.Item i on c.ItemCode = i.ItemCode  where MemberNumber='{dropdown}' and BillingDate>='{fromDate}' and BillingDate<='{toDate}'";
            }
            SqlCommand cmd = new SqlCommand(query, mySqlConnection);

            mySqlConnection.Open();
            cmd.Connection = mySqlConnection;
            string data = "";

            using (SqlDataReader QueryReader = cmd.ExecuteReader())
            {
                if (QueryReader.HasRows)
                {

                    while (QueryReader.Read())
                    {
                        int itemcode = QueryReader.GetInt32(1);
                        string itemname = QueryReader.GetString(6);
                        int membernumber = QueryReader.GetInt32(2);
                        int quantities = QueryReader.GetInt32(4);
                        
                        string billingdate = QueryReader.GetDateTime(3).ToString("d");
                     
                        data += "<tr><td> "+ itemcode + "</td><td> "+ itemname + "</td><td> " + membernumber + "</td><td> " + quantities + "</td><td> " + billingdate + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }

                return data;
            }
        }
            catch (Exception err)
            {
                string rawMessage = err.Message;
        string convertedMessage = rawMessage.Replace("'", "");
        ClientScript.RegisterClientScriptBlock(Page.GetType(), "alert", "<script>alert('" + convertedMessage + "');</script>");
                return "invalid";


            }
}

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
            Calendar1.Attributes.Add("style", "position:absolute");
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible)
            {
                Calendar2.Visible = false;
            }
            else
            {
                Calendar2.Visible = true;
            }
            Calendar2.Attributes.Add("style", "position:absolute");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToString("d");
            Calendar1.Visible = false;
        }
        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            TextBox2.Text = Calendar2.SelectedDate.ToString("d");
            Calendar2.Visible = false;
        }

        /*protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }*/
    }
}