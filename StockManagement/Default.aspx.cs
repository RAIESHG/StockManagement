using DGVPrinterHelper;
using System;
using System.Collections.Generic;
<<<<<<< HEAD
using System.Drawing;
=======
using System.Configuration;
>>>>>>> 977469e0c4d40e212c4170310f6447b3bb2efc13
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
<<<<<<< HEAD
using System.Windows.Forms;
=======
using System.Data.SqlClient;

>>>>>>> 977469e0c4d40e212c4170310f6447b3bb2efc13

namespace StockManagement
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["counter"].ToString() != "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                Session["counter"] = 1;
            }
        }
        protected string LowStock()
        {
            string query = "";
            query = $"Select* from dbo.Stock s join dbo.Item i on i.ItemCode = s.ItemCode where s.Quantity < 10";

            string connectionstring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

            SqlConnection mySqlConnection = new SqlConnection(connectionstring);
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
                        int itemCode = QueryReader.GetInt32(1);
                        string itemname = QueryReader.GetString(5);
                        int Quantity = QueryReader.GetInt32(2);
                        




                        data += "<tr><td> " + itemCode + "</td><td> " + itemname + "</td><td> " + Quantity + "</td><tr> ";
                    }
                    mySqlConnection.Close();

                }
                return data;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
        private void btnSavePDF_Click(object sender, EventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog();

            DialogResult messageResult = MessageBox.Show("Save this file into PDF?", "PDF File", MessageBoxButtons.OKCancel);

            if (messageResult == DialogResult.Cancel)
            {
                MessageBox.Show("Operation Canceled By User", "PDF File");
            }
            else
            {
                sfd.Title = "Save As PDF";
                sfd.Filter = "(*.pdf)|*.pdf";
                sfd.InitialDirectory = @"C:\";


                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    
                        iTextSharp.text.Document doc = new iTextSharp.text.Document();
                        PdfWriter.GetInstance(doc, new FileStream(sfd.FileName, FileMode.Create));
                        doc.Open();
                        doc.Add(new iTextSharp.text.Paragraph(""));
                        doc.Close();
                        rtb.Text = "";
                        MessageBox.Show("PDF Saved Succesfully", "PDF File");

                    }
                  

                }

            }

        }
    }
}