<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertOperations.aspx.cs" Inherits="StockManagement.AddItem" %>
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
    <asp:Label ID="Label3" runat="server" Text="Member Name"></asp:Label>
<asp:TextBox ID="membernametb" runat="server"></asp:TextBox>
<br />
<asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>
<asp:TextBox ID="addresstb" runat="server"></asp:TextBox>
<br />
<asp:Label ID="Label5" runat="server" Text="Contact Number"></asp:Label>
<asp:TextBox ID="contactnumbertb" runat="server"></asp:TextBox>
<br />
<asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
<asp:TextBox ID="emailtb" runat="server"></asp:TextBox>
<br />
<asp:Label ID="Label7" runat="server" Text="Member Type"></asp:Label>
<asp:TextBox ID="membertypetb" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add Member" />

     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="ItemName" DataValueField="ItemCode">
</asp:DropDownList>
<asp:Label ID="Label2" runat="server" Text="Quantity"></asp:Label>
<asp:TextBox ID="quantitytb0" runat="server"></asp:TextBox>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>
<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add Stock" />
</asp:Content>
