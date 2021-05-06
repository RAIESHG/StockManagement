<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="StockManagement.Change_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1  class="page-header">Change Password</h1>
    <p  class="page-header">This page allows admins to change user&#39;s password and sends a email notifying the users.</p>
    <div style="display: flex;">
        <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Select User:" Height="2em" Width="30em"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Username" DataValueField="Userid" Height="2em" Width="30em">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="New Password:" Height="2em" Width="30em"></asp:Label></td>
                <td>
                    <asp:TextBox ID="repasswordtb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is required!" ControlToValidate="repasswordtb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
                </td>
            </tr>
            <tr>
                <td colspan="2">
               <asp:Button style="float:right"  ID="Button1" runat="server" OnClick="changePwBtnPress" Text="Change Password" CssClass="btn btn-primary" />

                    </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
</asp:Content>
