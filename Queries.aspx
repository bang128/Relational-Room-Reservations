<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Queries.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 141px;
        }
        body {
            background-color: rgb(237,244,248)}
    </style>
</head>
<body>
    <h1>Queries</h1>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Menu ID="Menu1" runat="server">
            <Items>
                <asp:MenuItem NavigateUrl="~/Rooms.aspx" Text="Rooms" Value="Rooms"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/People.aspx" Text="People" Value="People"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Reservations.aspx" Text="Reservations" Value="Reservations"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Others.aspx" Text="OtherTables" Value="OtherTables"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Queries.aspx" Text="Queries" Value="Queries"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <br />
            <h4>1. List all room reservations with sorting option</h4>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ReservationID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" ReadOnly="True" SortExpression="ReservationID" />
                <asp:BoundField DataField="RoomID" HeaderText="RoomID" SortExpression="RoomID" />
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                <asp:BoundField DataField="Purpose" HeaderText="Purpose" SortExpression="Purpose" />
                <asp:BoundField DataField="NumberOfPeople" HeaderText="NumberOfPeople" SortExpression="NumberOfPeople" />
                <asp:BoundField DataField="DateMade" HeaderText="DateMade" SortExpression="DateMade" />
                <asp:BoundField DataField="EID" HeaderText="EID" SortExpression="EID" />
                <asp:BoundField DataField="ProxyID" HeaderText="ProxyID" SortExpression="ProxyID" />
                <asp:BoundField DataField="AccountID" HeaderText="AccountID" SortExpression="AccountID" />
                <asp:BoundField DataField="TotalItemCharge" HeaderText="TotalItemCharge" SortExpression="TotalItemCharge" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalBilled" HeaderText="TotalBilled" SortExpression="TotalBilled" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [ReservationID], [RoomID], [StartDate], [EndDate], [Purpose], [NumberOfPeople], [DateMade], [EID], [ProxyID], [AccountID], [TotalItemCharge], [TotalBilled], [Flag] FROM [Reservation]"></asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <h4>
            2. Total Charges by department</h4>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="DepartmentID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" ReadOnly="True" SortExpression="DepartmentID" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
                    <asp:BoundField DataField="Total Charges" HeaderText="Total Charges" ReadOnly="True" SortExpression="Total Charges" DataFormatString="{0:C}" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="Select
    Department.DepartmentID,
    Department.DepartmentName,
    sum(Room.RoomCharge) As [Total Charges]
From
    Room Inner Join
    Department On Room.OwnerID = Department.DepartmentID
Where DepartmentID &lt;&gt; 'None'
Group By
    Department.DepartmentID,
    Department.DepartmentName"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <h4>
            3. List of &quot;bumped&quot; meeting</h4>
        <p>
            <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" DataKeyNames="ReservationID" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" ReadOnly="True" SortExpression="ReservationID" />
                    <asp:BoundField DataField="RoomID" HeaderText="RoomID" SortExpression="RoomID" />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                    <asp:BoundField DataField="Purpose" HeaderText="Purpose" SortExpression="Purpose" />
                    <asp:BoundField DataField="NumberOfPeople" HeaderText="NumberOfPeople" SortExpression="NumberOfPeople" />
                    <asp:BoundField DataField="DateMade" HeaderText="DateMade" SortExpression="DateMade" />
                    <asp:BoundField DataField="EID" HeaderText="EID" SortExpression="EID" />
                    <asp:BoundField DataField="ProxyID" HeaderText="ProxyID" SortExpression="ProxyID" />
                    <asp:BoundField DataField="AccountID" HeaderText="AccountID" SortExpression="AccountID" />
                    <asp:BoundField DataField="TotalItemCharge" HeaderText="TotalItemCharge" SortExpression="TotalItemCharge" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="TotalBilled" HeaderText="TotalBilled" SortExpression="TotalBilled" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT ReservationID, RoomID, StartDate, EndDate, Purpose, NumberOfPeople, DateMade, EID, ProxyID, AccountID, TotalItemCharge, TotalBilled, Flag FROM Reservation WHERE (Flag = 'Replaced')"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <h4>
            4. Largest meeting room by capacity</h4>
        <p>
            <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataKeyNames="RoomID" DataSourceID="SqlDataSource4" Height="50px" Width="251px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="RoomID" HeaderText="RoomID" ReadOnly="True" SortExpression="RoomID" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                    <asp:BoundField DataField="BuildingID" HeaderText="BuildingID" SortExpression="BuildingID" />
                    <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="OwnerID" HeaderText="OwnerID" SortExpression="OwnerID" />
                    <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                    <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity" />
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
                    <asp:BoundField DataField="Longtitude" HeaderText="Longtitude" SortExpression="Longtitude" />
                    <asp:BoundField DataField="TotalItemCharge" HeaderText="TotalItemCharge" SortExpression="TotalItemCharge" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="RoomCharge" HeaderText="RoomCharge" SortExpression="RoomCharge" DataFormatString="{0:C}" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="Select Top 1
    Room.RoomID,
    Room.RoomNumber,
    Room.BuildingID,
    Room.Floor,
    Room.Description,
    Room.OwnerID,
    Room.Size,
    Room.Height,
    Room.Capacity,
    Room.Latitude,
    Room.Longtitude,
    Room.TotalItemCharge,
    Room.RoomCharge
From
    Room
Order By
    Room.Capacity desc"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <h4>
            5. Highest priority person</h4>
        <p>
            <asp:DetailsView ID="DetailsView5" runat="server" AutoGenerateRows="False" DataKeyNames="EID" DataSourceID="SqlDataSource5" Height="50px" Width="125px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="EID" HeaderText="EID" ReadOnly="True" SortExpression="EID" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="PriorityLevel" HeaderText="PriorityLevel" SortExpression="PriorityLevel" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="Select Top 1
    People.EID,
    People.LastName,
    People.FirstName,
    People.PriorityLevel
From
    People
Order By
    People.PriorityLevel Desc"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <h4>
            6. List the total charges for all rooms belonging to a specific owner, allow users to input the owner</h4>
        <p>
            <asp:DetailsView ID="DetailsView6" runat="server" AutoGenerateRows="False" DataKeyNames="DepartmentID" DataSourceID="SqlDataSource6" Height="50px" Width="251px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" ReadOnly="True" SortExpression="DepartmentID" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
                    <asp:BoundField DataField="Info" HeaderText="Info" ReadOnly="True" SortExpression="Info" Visible="False" />
                    <asp:BoundField DataField="Total Room Charges" HeaderText="Total Room Charges" ReadOnly="True" SortExpression="Total Room Charges" DataFormatString="{0:C}" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="Select
    Department.DepartmentID,
    Department.DepartmentName,
    Department.DepartmentID + ', ' + Department.DepartmentName As Info,
    sum(Room.RoomCharge) As [Total Room Charges]
From
    Room Inner Join
    Department On Room.OwnerID = Department.DepartmentID
Where DepartmentID &lt;&gt; 'None'
Group by Department.DepartmentID, Department.DepartmentName"></asp:SqlDataSource>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>Department</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View by" />
                    </td>
                    <td>
                        <asp:DropDownList ID="Dept" runat="server" DataSourceID="SqlDataSource6" DataTextField="Info" DataValueField="DepartmentID">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Error"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <h4>
            7. List all people who have a proxy</h4>
        <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="EID" DataSourceID="SqlDataSource7" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="EID" HeaderText="EID" ReadOnly="True" SortExpression="EID" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
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
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="Select
    People.EID,
    People.LastName,
    People.FirstName
From
    People
Where
    Exists(Select * From Proxy Where Proxy.ManagerID = People.EID)"></asp:SqlDataSource>
        <br />
        <h4>
            8. &quot;Waste space&quot; - rooms have never been reserved</h4>
        <p>
            <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID" DataSourceID="SqlDataSource8" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RoomID" HeaderText="RoomID" ReadOnly="True" SortExpression="RoomID" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                    <asp:BoundField DataField="BuildingID" HeaderText="BuildingID" SortExpression="BuildingID" />
                    <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="OwnerID" HeaderText="OwnerID" SortExpression="OwnerID" />
                    <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                    <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity" />
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
                    <asp:BoundField DataField="Longtitude" HeaderText="Longtitude" SortExpression="Longtitude" />
                    <asp:BoundField DataField="TotalItemCharge" HeaderText="TotalItemCharge" SortExpression="TotalItemCharge" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="RoomCharge" HeaderText="RoomCharge" SortExpression="RoomCharge" DataFormatString="{0:C}" />
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
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="Select
    Room.RoomID,
    Room.RoomNumber,
    Room.BuildingID,
    Room.Floor,
    Room.Description,
    Room.OwnerID,
    Room.Size,
    Room.Height,
    Room.Capacity,
    Room.Latitude,
    Room.Longtitude,
    Room.TotalItemCharge,
    Room.RoomCharge
From
    Room
Where not exists (select * From Reservation where Reservation.RoomID = Room.RoomID) and RoomID &lt;&gt; 'None'"></asp:SqlDataSource>
        </p>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
