<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvoiceandStockInfo.aspx.cs" Inherits="StockManagement.Bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemCode">
    </asp:DropDownList>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Check Status" />
     <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
        <tr align="left" style="background-color:#004080;color:White;" >
            <td> ItemName </td>  
            <td>Category</td>
             <td> Quantity </td>      
             <td> UnitPrice </td>      
            <td> Total </td>            
        
        </tr>
           <tr>
               <td>&nbsp;</td>
         </tr>
           <%=getbill()%>
 </table>
    <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
        <tr align="left" style="background-color:#004080;color:White;" >
            <td> ItemCode </td>                        
            <td> Quantity </td>            
            <td>Date</td> 
            <td>Status</td>
        </tr>

        <%=getStockData()%>

    </table>
    <br />
    <br />
    <br />
     <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="MemberName" DataValueField="MemberNumber">
</asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm Sale " />
     
</asp:Content>
