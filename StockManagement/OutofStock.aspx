<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutofStock.aspx.cs" Inherits="StockManagement.OutofStock" %>

       
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <h1  class="page-header">Out Of Stock</h1>
    <asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem Enabled="true" Text="Name Ascending" Value="namAsc"></asp:ListItem>
    <asp:ListItem Text="Name Descending" Value="namDesc"></asp:ListItem>
    <asp:ListItem Text="Quantity Descending" Value="quaDesc"></asp:ListItem>
    <asp:ListItem Text="Quantity Ascending" Value="quaAsc"></asp:ListItem>
    <asp:ListItem Text="Latest Stock Date" Value="latestStock"></asp:ListItem>
    <asp:ListItem Text="Oldest Stock Date" Value="oldestStock"></asp:ListItem>

    </asp:DropDownList>

       <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

    <div class="table-responsive">
     <table class="table" >
          <tr style="background-color:#507CD1;">
            <td style="color:white;"> ItemCode </td>
            <td style="color:white;"> Item Name </td>
            <td style="color:white;"> Quantity </td>
            <td style="color:white;">StockPurchaseDate</td> 

        </tr>

        <%=getOutofStock()%>

    </table>
         </div>

</asp:Content>