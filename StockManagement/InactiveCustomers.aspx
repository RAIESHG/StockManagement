<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InactiveCustomers.aspx.cs" Inherits="StockManagement.InactiveCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

          <h1  class="page-header">In-Active Customers</h1>

     <div class="table-responsive">
     <table class="table" >
  <tr style="background-color:#507CD1;">
            <td style="color:white;"> MemberNumber</td>
            <td style="color:white;"> MemberName </td>
            <td style="color:white;">Address</td> 
            <td style="color:white;">ContactNumber</td>
             <td style="color:white;">Email</td>
             <td style="color:white;">MemberType</td>
        </tr>

        <%=inactiveMembers()%>


    </table>
         </div>
</asp:Content>