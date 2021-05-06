<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddStock.aspx.cs" Inherits="StockManagement.AddStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


      <h1  class="page-header">                     Stock Portal                 </h1>
      <p  class="page-header">                     This page allows users to add, edit or delete stock.</p>
    <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>

                <asp:Label ID="Label4" runat="server" Text="Item Name" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                     <asp:DropDownList ID="DropDownList1" Height="2em" Width="30em" runat="server" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemCode">
</asp:DropDownList>

            </td>

        </tr>
        <tr>
            <td>

                <asp:Label ID="Label1" runat="server" Text="Quantity" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="quantitytb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="quantitytb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
            </td>

        </tr>

        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right"  ID="Button1"  ValidationGroup='valGroup1' runat="server" OnClick="addStockBtnPress" Text="Add Stock" CssClass="btn btn-primary" />
                        </td>
        </tr>
    </table>
           </div>
      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" class="table" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StockId" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField DataField="StockId" HeaderText="StockId" InsertVisible="False" ReadOnly="True" SortExpression="StockId" />
              <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
              <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
              <asp:BoundField DataField="StockPurchaseDate" HeaderText="StockPurchaseDate" SortExpression="StockPurchaseDate" />
              <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
          </Columns>
          <EditRowStyle BackColor="#2461BF" />
          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#EFF3FB" />
          <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
          <SortedAscendingCellStyle BackColor="#F5F7FB" />
          <SortedAscendingHeaderStyle BackColor="#6D95E1" />
          <SortedDescendingCellStyle BackColor="#E9EBEF" />
          <SortedDescendingHeaderStyle BackColor="#4870BE" />
      </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [Stock] WHERE [StockId] = @StockId" InsertCommand="INSERT INTO [Stock] ([ItemCode], [Quantity], [StockPurchaseDate]) VALUES (@ItemCode, @Quantity, @StockPurchaseDate)" SelectCommand="SELECT * FROM [Stock]" UpdateCommand="UPDATE [Stock] SET [ItemCode] = @ItemCode, [Quantity] = @Quantity, [StockPurchaseDate] = @StockPurchaseDate WHERE [StockId] = @StockId">
          <DeleteParameters>
              <asp:Parameter Name="StockId" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="ItemCode" Type="Int32" />
              <asp:Parameter Name="Quantity" Type="Int32" />
              <asp:Parameter DbType="Date" Name="StockPurchaseDate" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="ItemCode" Type="Int32" />
              <asp:Parameter Name="Quantity" Type="Int32" />
              <asp:Parameter DbType="Date" Name="StockPurchaseDate" />
              <asp:Parameter Name="StockId" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>

</asp:Content>