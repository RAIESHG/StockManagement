<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="StockManagement.AddMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Member" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="MemberName" DataValueField="MemberNumber">
    </asp:DropDownList>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
</asp:Content>
