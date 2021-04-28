<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnsoldItems.aspx.cs" Inherits="StockManagement.UnsoldItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
        <tr align="left" style="background-color:#004080;color:White;" >
            <td> ItemCode </td>                        
            <td> ItemName </td>            
            <td>Description</td> 
            <td>Price</td>
             <td>Category</td>
             <td>LastPurchaseDate</td>
        </tr>

        <%=unsoldItems()%>

    </table>
</asp:Content>
