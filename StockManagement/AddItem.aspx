<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="StockManagement.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <h1  class="page-header">                     Item Portal</h1>
    <p  class="page-header">                     This page allows users to add, edit or delete items.</p>
     <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Item Name" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="itemnametb"  ValidationGroup='valGroup1'  runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="itemnametb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server"  Text="Description" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="descriptiontb" runat="server"  ValidationGroup='valGroup1' Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="descriptiontb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               

            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Price" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="pricetb" runat="server"  ValidationGroup='valGroup1' Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="pricetb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Category" Height="2em" Width="30em"></asp:Label>

            </td>
            <td>
                 <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryNumber" Height="2em" Width="30em">
                 </asp:DropDownList>
            </td>
        </tr>
        <tr>
            
            <td>
               <asp:Label ID="id" runat="server" Text="Quantity" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="quantitytb"  ValidationGroup='valGroup1' runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="quantitytb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
            </td>
        </tr>
        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right"  ID="Button1" runat="server"  ValidationGroup='valGroup1' OnClick="addItemBtnPress" Text="Add Item" CssClass="btn btn-primary" />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" class="table" AutoGenerateColumns="False" DataKeyNames="ItemCode" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" InsertVisible="False" ReadOnly="True" SortExpression="ItemCode" />
                                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                    <asp:BoundField DataField="CategoryNumber" HeaderText="CategoryNumber" SortExpression="CategoryNumber" />
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [Item] WHERE [ItemCode] = @ItemCode" InsertCommand="INSERT INTO [Item] ([ItemName], [Description], [Price], [CategoryNumber]) VALUES (@ItemName, @Description, @Price, @CategoryNumber)" SelectCommand="SELECT * FROM [Item]" UpdateCommand="UPDATE [Item] SET [ItemName] = @ItemName, [Description] = @Description, [Price] = @Price, [CategoryNumber] = @CategoryNumber WHERE [ItemCode] = @ItemCode">
                                <DeleteParameters>
                                    <asp:Parameter Name="ItemCode" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ItemName" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="Price" Type="Int32" />
                                    <asp:Parameter Name="CategoryNumber" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ItemName" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="Price" Type="Int32" />
                                    <asp:Parameter Name="CategoryNumber" Type="Int32" />
                                    <asp:Parameter Name="ItemCode" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
        </tr>
    </table>
           </div>
</asp:Content>
