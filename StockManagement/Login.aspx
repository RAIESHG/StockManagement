<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StockManagement.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <h1  class="page-header">                     Login Page</h1>
    <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>
                Username</td>
            <td>
                <asp:TextBox ID="usernametb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>

                Password</td>
            <td>
                <asp:TextBox ID="passwordtb"  runat="server" Height="2em" Width="30em"></asp:TextBox>

            </td>

        </tr>

        <tr>
                        <td colspan="2">
                            &nbsp;</td>
        </tr>
    </table>
           </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
</asp:Content>
