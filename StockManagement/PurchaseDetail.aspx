<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PurchaseDetail.aspx.cs" Inherits="StockManagement.PurchaseDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
      <h1  class="page-header">Purchase Details</h1>
    <p  class="page-header">Users can select members and view their purchase details in the last 31 days or any date range they prefer.</p>

     <div style="display: flex;">
    <table style="margin-left: auto;  margin-right: auto;width:500px;" class="table" >

        <tr>
            <td style="height: 39px; width: 436px;">

                <asp:Label ID="Label2" runat="server" Text="Select Member" Height="2em" Width="30em"></asp:Label>
            </td>
            <td style="height: 39px">
<asp:DropDownList Height="2em" Width="30em" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="MemberName" DataValueField="MemberNumber">
    </asp:DropDownList>

            </td>

        </tr>
                <tr>
            <td style="height: 39px; width: 436px;">

                Start:</td>
            <td style="height: 39px">
                End:</td>

        </tr>
        <tr>
            <td style="height: 39px; width: 436px;">

                <asp:TextBox ID="TextBox1" runat="server" Height="32px" Width="244px" Enabled="False"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/calendar.png" ImageAlign="AbsBottom" OnClick="ImageButton1_Click"/>
                <asp:Calendar ID="Calendar1" runat="server" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" CellPadding="1">
                    <DayHeaderStyle BackColor="#99CCCC" Height="1px" ForeColor="#336666" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
            <td style="height: 39px">

                <asp:TextBox ID="TextBox2" runat="server" Height="32px" Width="235px" Enabled="False"></asp:TextBox>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/calendar.png" ImageAlign="AbsBottom" OnClick="ImageButton2_Click"/>
                <asp:Calendar ID="Calendar2" runat="server" Width="220px" OnSelectionChanged="Calendar2_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" CellPadding="1">
                    <DayHeaderStyle BackColor="#99CCCC" Height="1px" ForeColor="#336666" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>

        </tr>
        <tr>
            <td colspan="2" style="height: 39px" class="text-right">

                             <asp:Button style="float:right" ID="Button1" runat="server" OnClick="viewPurchaseBtnPress" Text="View" CssClass="btn btn-primary"/>

                        </td>

        </tr>

        <tr>
                        <td colspan="2" class="text-right">
                             <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="Ignore calendar and view details of last 31 days." />

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