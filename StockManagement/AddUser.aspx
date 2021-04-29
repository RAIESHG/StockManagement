<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="StockManagement.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
  <h1  class="page-header">                     Add User Portal                 </h1>

       <div style="display: flex;">
<table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Username(E-mail)" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="userNametb" runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is required!" ControlToValidate="userNametb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
                
                
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Password" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="passwordtb" runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is required!" ControlToValidate="passwordtb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               

            </td>

        </tr>
        
        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right;" ID="Button1" runat="server" OnClick="Button1_Click" Text="Add User" CssClass="btn btn-primary"/>
                        </td>
        </tr>
             <div style="align-items: center;justify-content: center;">
    </table>
           </div>
      


    </asp:Content>
