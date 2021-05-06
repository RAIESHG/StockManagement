﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RemoveStock.aspx.cs" Inherits="StockManagement.RemoveStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
          <h1  class="page-header">OutDated Stocks</h1>
          <p  class="page-header">The stocks that are not purchased in the last 100 days will be displayed in this page.</p>

     <div class="table-responsive">
     <table class="table" >
          <tr style="background-color:#507CD1;">
            <td style="color:white;"> ItemCode </td>
            <td style="color:white;"> Item Name </td>
            <td style="color:white;"> Quantity </td>
            <td style="color:white;">Last Stock Purchased On</td> 

        </tr>

        <%=getstockforremoval()%>

    </table>
          <tr>
                        <td colspan="2">
                            <asp:Button style="float:right" ID="Button2" runat="server" OnClick="removeStockBtnPress" Text="Remove Stock" CssClass="btn btn-primary" />

                        </td>
        </tr>
         </div>
</asp:Content>
