<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="StockManagement.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1  class="page-header">Add Category</h1>
    <div style="display: flex;">
        <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Category Name" Height="2em" Width="30em"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="catnametb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field is required!" ControlToValidate="catnametb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Category Description" Height="2em" Width="30em"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="categorydesctb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is required!" ControlToValidate="categorydesctb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
                </td>
            </tr>
            <tr>
                        <td colspan="2">
                            <asp:Button style="float:right"  ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Item" CssClass="btn btn-primary" />
                        </td>
        </tr>
          
         
        </table>
    </div>
</asp:Content>
