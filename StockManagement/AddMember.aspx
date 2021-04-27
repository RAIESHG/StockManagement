<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="StockManagement.AddMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Member Number"></asp:Label>
<asp:TextBox ID="membernumbertb" runat="server"></asp:TextBox>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="MemberName" DataValueField="MemberNumber">
    </asp:DropDownList>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
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
