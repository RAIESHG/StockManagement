<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="StockManagement.Change_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1  class="page-header">Change Password</h1>
    <div style="display: flex;">
        <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="passwordtb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Re-Enter</td>
                <td>
                    <asp:TextBox ID="repasswordtb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
               <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Change Password" />
                    </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>
</asp:Content>
