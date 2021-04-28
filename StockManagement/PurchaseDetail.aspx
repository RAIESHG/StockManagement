<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PurchaseDetail.aspx.cs" Inherits="StockManagement.PurchaseDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
      <h1  class="page-header">Purchase Details</h1>

     <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >

        <tr>
            <td>

                <asp:Label ID="Label2" runat="server" Text="Select Member" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
<asp:DropDownList Height="2em" Width="30em" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="MemberName" DataValueField="MemberNumber">
    </asp:DropDownList>

            </td>

        </tr>

        <tr>
                        <td colspan="2">
                             <asp:Button style="float:right" ID="Button1" runat="server" OnClick="Button1_Click" Text="View" CssClass="btn btn-primary"/>

                        </td>
        </tr>
    </table>
           </div>




     <div class="table-responsive">
     <table class="table" >
       <tr style="background-color:#507CD1;">
               <td style="color:white;"> ItemCode </td>
            <td style="color:white;"> ItemName </td>
            <td style="color:white;"> Member Number </td>
            <td style="color:white;">Quantity</td> 
            <td style="color:white;">Date</td>
        </tr>

        <%=prevPurchaseDetails()%>
    </table>
        </div>
</asp:Content>