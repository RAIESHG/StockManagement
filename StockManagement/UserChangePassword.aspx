<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserChangePassword.aspx.cs" Inherits="StockManagement.UserChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1  class="page-header">Change Password</h1>
    <p  class="page-header">Change your password!</p>
    <div style="display: flex;">
        <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="New Password:" Height="2em" Width="30em"></asp:Label></td>
                <td>
                    <asp:TextBox ID="passwordtb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is required!" ControlToValidate="passwordtb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button style="float:right"  ID="Button2" runat="server" OnClick="userChangePwBtnPress" Text="Change Password" CssClass="btn btn-primary" />
                </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
</asp:Content>
