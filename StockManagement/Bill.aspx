<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="StockManagement.Bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">              <h1  class="page-header">                     Sales Portal                 </h1>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
    <div style="display: flex;">

    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        
        <tr>
            <td>

                <asp:Label ID="Label4" runat="server" Text="Item Name" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                      <asp:DropDownList Height="2em" Width="30em" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="ItemName" DataValueField="ItemCode">
    </asp:DropDownList>

            </td>

        </tr>
        <tr>
            <td>

                <asp:Label ID="Label1" runat="server" Text="Quanitity" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                     <asp:TextBox Height="2em" Width="30em" ID="TextBox1" runat="server"></asp:TextBox>

            </td>

        </tr>

        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right" ID="Button1" runat="server" OnClick="Button1_Click" Text="Check Price" CssClass="btn btn-primary"/>

                        </td>
        </tr>
    </table>
           </div>
    
    

     <div class="table-responsive">
     <table class="table" >
        <tr style="background-color:#507CD1;">
            <td style="color:white;"> ItemName </td>  
            <td style="color:white;">Category</td>
             <td style="color:white;"> Quantity </td>      
             <td style="color:white;"> UnitPrice </td>      
            <td style="color:white;"> Total </td>            
        
        </tr>
           <%=getbill()%>
         </table>
        </div>

        <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        
        <tr>
            <td>

                <asp:Label ID="Label2" runat="server" Text="Select User" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                       <asp:DropDownList Height="2em" Width="30em" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="MemberName" DataValueField="MemberNumber">
</asp:DropDownList>

            </td>

        </tr>

        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right" ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm Sale " CssClass="btn btn-primary" />

                        </td>
        </tr>
    </table>
           </div>
</asp:Content>