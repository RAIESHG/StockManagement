<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StockManagement._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div id="MyPopup" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                        <h4 class="modal-title">Low-Stock Items!!</h4>
                    </div>
                    <div class="modal-body">
                            <div class="table-responsive">
                 <table class="table" >
                      <tr style="background-color:#507CD1;">
                        <td style="color:white;"> ItemCode </td>
                        <td style="color:white;"> Item Name </td>
                        <td style="color:white;"> Quantity </td>
                    </tr>

                    <%=LowStock()%>

                </table>
         </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">
                            Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function ShowPopup() {
/*                $("#MyPopup .modal-title").html(title);
                $("#MyPopup .modal-body").html(body);*/
                $("#MyPopup").modal("show");
            }
        </script>

        <div class="jumbotron" style="padding-bottom:10px;margin-bottom:10px;padding-top:10px;margin-top:10px">
            <h1>Dashboard</h1>
        <p class="lead">Graphs below display the stock and sales.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Total Items Purchased</h2>
            <h2>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" Width="1065px" BorderlineWidth="0" Palette="Bright">
                    <series>
                        <asp:Series ChartArea="ChartArea1" ChartType="Line" Name="Series1" XValueMember="ItemName" YValueMembers="TotalSales">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT Item.ItemName, SUM(CustomerPurchase.Quantity) AS TotalSales FROM CustomerPurchase INNER JOIN Item ON CustomerPurchase.ItemCode = Item.ItemCode GROUP BY Item.ItemName"></asp:SqlDataSource>
            </h2>
            <h2>Items Quantity</h2>
            <p>
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" Width="1075px" BackImageWrapMode="Scaled" Palette="Excel">
                    <series>
                        <asp:Series Name="Series1" XValueMember="ItemName" YValueMembers="Quantity" YValuesPerPoint="2">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT Item.ItemName, Stock.Quantity FROM Item INNER JOIN Stock ON Item.ItemCode = Stock.ItemCode"></asp:SqlDataSource>
            </p>


        </div>
        <div class="col-md-4">
            <h2>&nbsp;</h2>
        </div>
        <div class="col-md-4">
        </div>
    </div>

</asp:Content>
