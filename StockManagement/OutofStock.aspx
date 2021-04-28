<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutofStock.aspx.cs" Inherits="StockManagement.OutofStock" %>

       
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <h1  class="page-header">Out Of Stock</h1>
    <div class="table-responsive">
     <table class="table" >
          <tr style="background-color:#507CD1;">
            <td style="color:white;"> ItemCode </td>
            <td style="color:white;"> Item Name </td>
            <td style="color:white;"> Quantity </td>
            <td style="color:white;">StockPurchaseDate</td> 

        </tr>

        <%=getOutofStock()%>

    </table>
         </div>

</asp:Content>