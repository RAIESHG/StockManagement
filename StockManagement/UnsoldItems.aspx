<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnsoldItems.aspx.cs" Inherits="StockManagement.UnsoldItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
              <h1  class="page-header">UnSold Stocks</h1>

     <div class="table-responsive">
     <table class="table" >
          <tr style="background-color:#507CD1;">
            <td style="color:white;"> ItemCode </td>
            <td style="color:white;"> Item Name </td>
            <td style="color:white;"> Quantity </td>
            <td style="color:white;">Last Purchased On</td> 

        </tr>

        <%=unsolditems()%>

    </table>
         </div>
</asp:Content>
