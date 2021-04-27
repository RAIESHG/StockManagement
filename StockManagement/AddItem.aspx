<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="StockManagement.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
Item Name&nbsp;&nbsp; <asp:TextBox ID="itemnametb"  runat="server" CssClass="glyphicon-envelope"></asp:TextBox>
    <br />
<br />
Description <asp:TextBox ID="descriptiontb" runat="server"></asp:TextBox>
    <br />
<br />
Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="pricetb" runat="server"></asp:TextBox>
    <br />
<br />
Category&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="categorytb" runat="server"></asp:TextBox>
    <br />
<br />
    <asp:Label ID="id" runat="server" Text="Quantity"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="quantitytb" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Item" Width="83px" />
    <br />
    <br />
</asp:Content>
