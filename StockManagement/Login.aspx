<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StockManagement.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <h1  class="page-header">                     Login Page</h1>
    <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Username(Email)" Height="2em" Width="30em"></asp:Label></td>
            <td>
                <asp:TextBox ID="usernametb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is required!" ControlToValidate="usernametb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Password" Height="2em" Width="30em"></asp:Label></td>
            <td>
                <asp:TextBox ID="passwordtb"  runat="server" Height="2em" Width="30em" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is required!" ControlToValidate="passwordtb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>

            </td>

        </tr>

        <tr>
                        <td colspan="2">
                             <asp:Button ID="Button1" runat="server" OnClick="loginBtnPress" Text="Login" style="float:right;" CssClass="btn btn-primary" /></td>
        </tr>
    </table>
           </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>

   
    <script>

        document.getElementsByClassName('sidenav')[0].style.display = 'none';
    </script>
</asp:Content>
