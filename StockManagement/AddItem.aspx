<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="StockManagement.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
 <h1  class="page-header">                     Item Portal                 </h1>
     <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Item Name" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="itemnametb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Description" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="descriptiontb" runat="server" Height="2em" Width="30em"></asp:TextBox>

            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Price" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="pricetb" runat="server" Height="2em" Width="30em"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Category" Height="2em" Width="30em"></asp:Label>

            </td>
            <td>
                 <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryNumber">
                 </asp:DropDownList>
            </td>
        </tr>
        <tr>
            
            <td>
               <asp:Label ID="id" runat="server" Text="Quantity" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="quantitytb" runat="server" Height="2em" Width="30em"></asp:TextBox>
            </td>
        </tr>
        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right"  ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Item" CssClass="btn btn-primary" />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                        </td>
        </tr>
    </table>
           </div>
</asp:Content>
