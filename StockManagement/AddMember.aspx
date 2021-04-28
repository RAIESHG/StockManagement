<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="StockManagement.AddMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
  <h1  class="page-header">                     Customer Database Portal                 </h1>

       <div style="display: flex;">
<table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Member Name" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="membernametb" runat="server" Height="2em" Width="30em"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Address" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="addresstb" runat="server" Height="2em" Width="30em"></asp:TextBox>

            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Contact Number" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="contactnumbertb" runat="server" Height="2em" Width="30em"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Email" Height="2em" Width="30em"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="emailtb" runat="server" Height="2em" Width="30em"></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td>
                <asp:Label ID="Label7" runat="server" Text="Member Type" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="membertypetb" runat="server" Height="2em" Width="30em"></asp:TextBox>
            </td>
        </tr>
        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right;" ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Member" CssClass="btn btn-primary"/>
                        </td>
        </tr>
             <div style="align-items: center;justify-content: center;">
    </table>
           </div>
      


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
    </asp:Content>
