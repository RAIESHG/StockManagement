<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddStock.aspx.cs" Inherits="StockManagement.AddStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


      <h1  class="page-header">                     Stock Portal                 </h1>
    <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>

                <asp:Label ID="Label4" runat="server" Text="Item Name" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                     <asp:DropDownList ID="DropDownList1" Height="2em" Width="30em" runat="server" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemCode">
</asp:DropDownList>

            </td>

        </tr>
        <tr>
            <td>

                <asp:Label ID="Label1" runat="server" Text="Quantity" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="quantitytb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field is required!" ControlToValidate="quantitytb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
            </td>

        </tr>

        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right"  ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Stock" CssClass="btn btn-primary" />
                        </td>
        </tr>
    </table>
           </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>

</asp:Content>