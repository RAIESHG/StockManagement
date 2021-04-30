<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="StockManagement.AddMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <h1  class="page-header">                     Customer Database Portal                 </h1>
    <p  class="page-header">                     This page allows users to add the members edit some of their details.</p>

       <div style="display: flex;">
<table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Member Name" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="membernametb" runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator  ValidationGroup='valGroup1' ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field is required!" ControlToValidate="membernametb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
                
                
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Address" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="addresstb" runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="addresstb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               

            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Contact Number" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="contactnumbertb" runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="contactnumbertb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Email" Height="2em" Width="30em"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="emailtb" runat="server" Height="2em" Width="30em"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ValidationGroup='valGroup1' runat="server" ErrorMessage="Field is required!" ControlToValidate="emailtb" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
               
            </td>
        </tr>
        <tr>
            
            <td>
                <asp:Label ID="Label7" runat="server" Text="Member Type" Height="2em" Width="30em"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Height="2em" Width="30em">
                    
                    <asp:ListItem Enabled="true" Text="Exclusive" Value="Exclusive"></asp:ListItem>
                    <asp:ListItem Text="Platinum" Value="Platinum"></asp:ListItem>
                    <asp:ListItem Text="Gold" Value="Gold"></asp:ListItem>
                    <asp:ListItem Text="Silver" Value="Silver"></asp:ListItem>

                </asp:DropDownList>
               
            </td>
        </tr>
        <tr>
                        <td colspan="2">
                            <asp:Button style="float:right;" ID="Button1" runat="server"  ValidationGroup='valGroup1'  OnClick="Button1_Click" Text="Add Member" CssClass="btn btn-primary"/>
                        </td>
        </tr>
             <div style="align-items: center;justify-content: center;">
    </table>
           </div>
      


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" class="table" AutoGenerateColumns="False" DataKeyNames="MemberNumber" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
            <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" SortExpression="ContactNumber" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="MemberType" HeaderText="MemberType" SortExpression="MemberType" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [MemberNumber] = @MemberNumber" InsertCommand="INSERT INTO [Member] ([MemberName], [Address], [ContactNumber], [Email], [MemberType]) VALUES (@MemberName, @Address, @ContactNumber, @Email, @MemberType)" SelectCommand="SELECT * FROM [Member]" UpdateCommand="UPDATE [Member] SET [MemberName] = @MemberName, [Address] = @Address, [ContactNumber] = @ContactNumber, [Email] = @Email, [MemberType] = @MemberType WHERE [MemberNumber] = @MemberNumber">
        <DeleteParameters>
            <asp:Parameter Name="MemberNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MemberName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="ContactNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="MemberType" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MemberName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="ContactNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="MemberType" Type="String" />
            <asp:Parameter Name="MemberNumber" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
