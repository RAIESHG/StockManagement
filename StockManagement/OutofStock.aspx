<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutofStock.aspx.cs" Inherits="StockManagement.OutofStock" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
        <tr align="left" style="background-color:#004080;color:White;" >
            <td> ItemCode </td>
            <td> Item Name </td>
            <td> Quantity </td>            
            <td>StockPurchaseDate</td> 
        
        </tr>

        <%=getOutofStock()%>

    </table>
</asp:Content>
