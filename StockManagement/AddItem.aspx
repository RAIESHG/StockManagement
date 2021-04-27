<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="StockManagement.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Item Code<asp:TextBox ID="itemcodetb" runat="server"></asp:TextBox>
<br />
Item Name<asp:TextBox ID="itemnametb" runat="server"></asp:TextBox>
<br />
Description<asp:TextBox ID="descriptiontb" runat="server"></asp:TextBox>
<br />
Price<asp:TextBox ID="pricetb" runat="server"></asp:TextBox>
<br />
Category<asp:TextBox ID="categorytb" runat="server"></asp:TextBox>
<br />
    <asp:Label ID="quantitytb" runat="server" Text="Quantity"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Item" Width="83px" />
    <br />
    <br />
</asp:Content>
