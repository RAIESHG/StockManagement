using DGVPrinterHelper;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace StockManagement
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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