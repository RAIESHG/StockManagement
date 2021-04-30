<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemStock.aspx.cs" Inherits="StockManagement.ItemStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


     <h1  class="page-header">Check Stock Status</h1>
     <p  class="page-header">This page allows users to check stock status of all the products individually. </p>

    <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >

        <tr>
            <td>

                <asp:Label ID="Label4" runat="server" Text="Select Item" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                      <asp:DropDownList Height="2em" Width="30em" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemCode">
    </asp:DropDownList>

            </td>

        </tr>

        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right"  ID="Button1" runat="server" OnClick="Button1_Click" Text="Check" CssClass="btn btn-primary" />
                        </td>
        </tr>
    </table>
           </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>

    <div class="table-responsive">
     <table class="table" >
<tr style="background-color:#507CD1;">
            <td style="color:white;"> ItemCode </td>
            <td style="color:white;"> Quantity </td>
            <td style="color:white;">Date</td> 
            <td style="color:white;">Status</td>
        </tr>

        <%=getStockData()%>

    </table>
        </div>
</asp:Content>