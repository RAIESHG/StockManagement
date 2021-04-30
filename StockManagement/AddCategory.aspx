<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="StockManagement.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1  class="page-header">Add Category</h1>
    <p  class="page-header">This page allows users to add, edit or delete category.</p>
    <div style="display: flex;">
        <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Category Name" Height="2em" Width="30em"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="catnametb"  runat="server" Height="2em" Width="30em"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="catnametb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Category Description" Height="2em" Width="30em"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="categorydesctb"    runat="server" Height="2em" Width="30em"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="categorydesctb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
                </td>
            </tr>
            <tr>
                        <td colspan="2">
                            <asp:Button style="float:right"  ID="Button1" runat="server" OnClick="Button1_Click"  ValidationGroup='valGroup1' Text="Add Item" CssClass="btn btn-primary" />
                            <br />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" class="table" AutoGenerateColumns="False" DataKeyNames="CategoryNumber" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="CategoryNumber" HeaderText="CategoryNumber" InsertVisible="False" ReadOnly="True" SortExpression="CategoryNumber" />
                                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                                    <asp:BoundField DataField="CategoryDescription" HeaderText="CategoryDescription" SortExpression="CategoryDescription" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [CategoryNumber] = @CategoryNumber" InsertCommand="INSERT INTO [Category] ([CategoryName], [CategoryDescription]) VALUES (@CategoryName, @CategoryDescription)" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName, [CategoryDescription] = @CategoryDescription WHERE [CategoryNumber] = @CategoryNumber">
                                <DeleteParameters>
                                    <asp:Parameter Name="CategoryNumber" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CategoryName" Type="String" />
                                    <asp:Parameter Name="CategoryDescription" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CategoryName" Type="String" />
                                    <asp:Parameter Name="CategoryDescription" Type="String" />
                                    <asp:Parameter Name="CategoryNumber" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
        </tr>
          
         
        </table>
    </div>
</asp:Content>
