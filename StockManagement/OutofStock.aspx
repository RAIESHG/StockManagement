<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutofStock.aspx.cs" Inherits="StockManagement.OutofStock" %>

       
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <h1  class="page-header">Check Stock Status</h1>

    <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >

        <tr>
            <td>

                <asp:Label ID="Label4" runat="server" Text="Sort by:" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                  <asp:DropDownList ID="DropDownList1" runat="server" Height="2em" Width="30em">
                    <asp:ListItem Enabled="true" Text="Name Ascending" Value="namAsc"></asp:ListItem>
                    <asp:ListItem Text="Name Descending" Value="namDesc"></asp:ListItem>
                    <asp:ListItem Text="Quantity Descending" Value="quaDesc"></asp:ListItem>
                    <asp:ListItem Text="Quantity Ascending" Value="quaAsc"></asp:ListItem>
                    <asp:ListItem Text="Latest Stock Date" Value="latestStock"></asp:ListItem>
                    <asp:ListItem Text="Oldest Stock Date" Value="oldestStock"></asp:ListItem>

                 </asp:DropDownList>

            </td>

        </tr>

        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right"  ID="Button2" runat="server" OnClick="Button1_Click" Text="Sort" CssClass="btn btn-primary" />
                        </td>
        </tr>
    </table>
           </div>

    <div class="table-responsive">
     <table class="table" >
          <tr style="background-color:#507CD1;">
            <td style="color:white;"> ItemCode </td>
            <td style="color:white;"> Item Name </td>
            <td style="color:white;"> Quantity </td>
            <td style="color:white;">Last Stock Purchase Date</td> 

        </tr>

        <%=getOutofStock()%>

    </table>
         </div>

</asp:Content>