<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="StockManagement.AddMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Member" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
    </asp:Content>
