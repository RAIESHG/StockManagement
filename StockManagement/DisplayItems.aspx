<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayItems.aspx.cs" Inherits="StockManagement.DisplayItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
        <tr align="left" style="background-color:#004080;color:White;" >
            <td> ID </td>                        
            <td> Name </td>            
            <td>Pass</td>                        
        </tr>

        <%=getWhileLoopData()%>

    </table>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
</asp:Content>
