<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RemoveStock.aspx.cs" Inherits="StockManagement.RemoveStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
          <h1  class="page-header">OutDated Stocks</h1>

     <div class="table-responsive">
     <table class="table" >
          <tr style="background-color:#507CD1;">
            <td style="color:white;"> ItemCode </td>
            <td style="color:white;"> Item Name </td>
            <td style="color:white;"> Quantity </td>
            <td style="color:white;">Last Purchased On</td> 

        </tr>

        <%=getstockforremoval()%>

    </table>
          <tr>
                        <td colspan="2">
                            <asp:Button style="float:right" ID="Button2" runat="server" OnClick="Button2_Click" Text="Remove Stock" CssClass="btn btn-primary" />

                        </td>
        </tr>
         </div>
</asp:Content>
