<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reservations.aspx.cs" Inherits="Reservation2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 60%;
        }
        .auto-style2 {
            width: 470px;
            text-align: center;
            background-color: #EFF3FB;
        }
        .auto-style3 {
            width: 144px;
            text-align: center;
            background-color: #EFF3FB;
        }
        .auto-style4 {
            color: #FFFFFF;
            text-decoration: underline;
            text-align: center;
            background-color: #507CD1;
        }
        .auto-style5 {
            width: 470px;
            color: #FFFFFF;
            text-decoration: underline;
            text-align: center;
            background-color: #507CD1;
        }
        .auto-style6 {
            text-align: center;
            background-color: #EFF3FB;
        }
        .auto-style7 {
            width: 144px;
            background-color: #507CD1;
        }
        body {
            background-color: rgb(237,244,248)}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Reservations</h1>
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
        </p>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ReservationID" DataSourceID="SqlDataSource1" Height="50px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="510px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" ReadOnly="True" SortExpression="ReservationID" />
                <asp:TemplateField HeaderText="RoomID, Capacity" SortExpression="RoomID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource8" DataTextField="RoomCapacity" DataValueField="RoomID" SelectedValue='<%# Bind("RoomID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource8" DataTextField="RoomCapacity" DataValueField="RoomID" SelectedValue='<%# Bind("RoomID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource8" DataTextField="RoomCapacity" DataValueField="RoomID" SelectedValue='<%# Bind("RoomID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StartDate" HeaderText="Start Date, Time" SortExpression="StartDate" />
                <asp:BoundField DataField="EndDate" HeaderText="End Date, Time" SortExpression="EndDate" />
                <asp:BoundField DataField="Purpose" HeaderText="Purpose" SortExpression="Purpose" />
                <asp:TemplateField HeaderText="Anticipated number of people" SortExpression="NumberOfPeople">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NumberOfPeople") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NumberOfPeople") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("NumberOfPeople") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DateMade" HeaderText="Date Made" SortExpression="DateMade" />
                <asp:TemplateField HeaderText="Person" SortExpression="EID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="People" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="People" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="People" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Proxy" SortExpression="ProxyID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="Proxy" DataTextField="Column1" DataValueField="ProxyID" SelectedValue='<%# Bind("ProxyID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="Proxy" DataTextField="Column1" DataValueField="ProxyID" SelectedValue='<%# Bind("ProxyID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="Proxy" DataTextField="Column1" DataValueField="ProxyID" SelectedValue='<%# Bind("ProxyID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AccountID of Person" SortExpression="AccountID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource7" DataTextField="Info" DataValueField="AccountID" SelectedValue='<%# Bind("AccountID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource7" DataTextField="Info" DataValueField="AccountID" SelectedValue='<%# Bind("AccountID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource7" DataTextField="Info" DataValueField="AccountID" SelectedValue='<%# Bind("AccountID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Flag" HeaderText="Flag" SortExpression="Flag" />
                <asp:BoundField DataField="TotalItemCharge" HeaderText="Total Item Charge" SortExpression="TotalItemCharge" DataFormatString="{0:C}" />
                <asp:TemplateField HeaderText="Room Charge" SortExpression="RoomCharge">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource8" DataTextField="ChargeInfo" DataValueField="RoomCharge" SelectedValue='<%# Bind("RoomCharge") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource8" DataTextField="ChargeInfo" DataValueField="RoomCharge" SelectedValue='<%# Bind("RoomCharge") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("RoomCharge", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total Billed" SortExpression="TotalBilled">
                    <EditItemTemplate>
                        Calculated by system
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Calculated by system
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TotalBilled", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [ReservationItem] WHERE [ReservationID] = @ReservationID;
DELETE FROM [Reservation] WHERE [ReservationID] = @ReservationID
" InsertCommand="INSERT INTO [Reservation] ([ReservationID], [RoomID], [StartDate], [EndDate], [Purpose], [NumberOfPeople], [DateMade], [EID], [ProxyID], [AccountID], [Flag], [TotalItemCharge], [TotalBilled]) VALUES (@ReservationID, @RoomID, @StartDate, @EndDate, @Purpose, @NumberOfPeople, @DateMade, @EID, @ProxyID, @AccountID, @Flag, @TotalItemCharge, 0);
UPDATE [Reservation] SET [TotalBilled] = convert(float,[TotalItemCharge]) + (select convert(float,[RoomCharge]) from Room where Room.RoomID = @RoomID) WHERE [ReservationID] = @ReservationID" SelectCommand="SELECT Reservation.ReservationID, Reservation.RoomID, Reservation.StartDate, Reservation.EndDate, Reservation.Purpose, Reservation.NumberOfPeople, Reservation.DateMade, Reservation.EID, Reservation.ProxyID, Reservation.AccountID, Reservation.Flag, Reservation.TotalItemCharge, Room.RoomCharge, Reservation.TotalBilled FROM Reservation INNER JOIN Room ON Reservation.RoomID = Room.RoomID" UpdateCommand="UPDATE [Reservation] SET [RoomID] = @RoomID, [StartDate] = @StartDate, [EndDate] = @EndDate, [Purpose] = @Purpose, [NumberOfPeople] = @NumberOfPeople, [DateMade] = @DateMade, [EID] = @EID, [ProxyID] = @ProxyID, [AccountID] = @AccountID, [Flag] = @Flag, [TotalItemCharge] = (select convert(float, sum(Charge)) from ReservationItem where ReservationItem.ReservationID = @ReservationID) WHERE [ReservationID] = @ReservationID;
UPDATE [Reservation] SET [TotalItemCharge] = 0 WHERE [ReservationID] = @ReservationID AND TotalItemCharge IS NULL;
UPDATE [Reservation] SET [TotalBilled] = convert(float,[TotalItemCharge]) + (select convert(float,[RoomCharge]) from Room where Room.RoomID = @RoomID) WHERE [ReservationID] = @ReservationID;">
            <DeleteParameters>
                <asp:Parameter Name="ReservationID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ReservationID" Type="String" />
                <asp:Parameter Name="RoomID" Type="String" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter Name="NumberOfPeople" Type="Int32" />
                <asp:Parameter Name="DateMade" Type="DateTime" />
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="ProxyID" Type="String" />
                <asp:Parameter Name="AccountID" Type="String" />
                <asp:Parameter Name="Flag" Type="String" />
                <asp:Parameter Name="TotalItemCharge" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RoomID" Type="String" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter Name="NumberOfPeople" Type="Int32" />
                <asp:Parameter Name="DateMade" Type="DateTime" />
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="ProxyID" Type="String" />
                <asp:Parameter Name="AccountID" Type="String" />
                <asp:Parameter Name="Flag" Type="String" />
                <asp:Parameter Name="ReservationID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="People" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [EID], [EID] + ', ' + [FirstName] + ' ' + [LastName] As Info FROM [People] Where EID &lt;&gt; 'None'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Proxy" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="Select
    Proxy.ProxyID,
    Case Proxy.ProxyID 
    When 'None' Then 'None' 
    Else Proxy.ProxyID + ', ' + People.FirstName + ' ' + People.LastName + ' (of ' + Proxy.ManagerID + ')'
    End
    
From Proxy Inner Join People On People.EID = Proxy.EID
">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT Account.AccountID, AccountID + ', ' + People.FirstName + ' ' + People.LastName AS Info FROM Account INNER JOIN People ON Account.EID = People.EID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [RoomID], [RoomCharge], [RoomID] + ', ' + CONVERT(varchar, [RoomCharge]) As ChargeInfo, [RoomID] + ', ' + CONVERT(varchar, [Capacity]) As RoomCapacity FROM [Room] Where RoomID &lt;&gt; 'None'"></asp:SqlDataSource>
        <br />
        <h3>Account Information</h3>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="710px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Person" SortExpression="EID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="People" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="People" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField DataField="PriorityLevel" HeaderText="Priority Level" SortExpression="PriorityLevel" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="AccountNumber" HeaderText="Account number for charges" SortExpression="AccountNumber" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [Account] WHERE [AccountID] = @AccountID" InsertCommand="INSERT INTO [Account] ([AccountID], [EID], [AccountNumber]) VALUES (@AccountID, @EID, @AccountNumber)" SelectCommand="SELECT Account.EID, People.PriorityLevel, Account.AccountNumber FROM Account INNER JOIN Reservation ON Account.AccountID = Reservation.AccountID INNER JOIN People ON Account.EID = People.EID WHERE (Reservation.ReservationID = @ReservationID)" UpdateCommand="UPDATE [Account] SET [EID] = @EID, [AccountNumber] = @AccountNumber WHERE [AccountID] = @AccountID">
            <DeleteParameters>
                <asp:Parameter Name="AccountID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountID" Type="String" />
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="AccountNumber" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="ReservationID" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="AccountNumber" Type="String" />
                <asp:Parameter Name="AccountID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <h3>
            <br />
            Equipments/Features<br />
        </h3>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ReservationID,ItemID" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" ReadOnly="True" SortExpression="ReservationID" Visible="False" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Charge" SortExpression="Charge">
                    <EditItemTemplate>
                        Calculated by system
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Charge", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [ReservationItem] WHERE [ReservationID] = @ReservationID AND [ItemID] = @ItemID" InsertCommand="INSERT INTO [ReservationItem] ([ReservationID], [ItemID], [Quantity], [Charge]) VALUES (@ReservationID, @ItemID, @Quantity, convert(int,@Quantity) * (Select Price From Item Where ItemID = @ItemID))" SelectCommand="SELECT [ReservationID], ReservationItem.[ItemID], Description, [Quantity], [Charge] FROM [ReservationItem] Inner Join Item On ReservationItem.ItemID = Item.ItemID WHERE ([ReservationID] = @ReservationID)" UpdateCommand="UPDATE [ReservationItem] SET [Quantity] = @Quantity WHERE [ReservationID] = @ReservationID AND [ItemID] = @ItemID;
UPDATE [ReservationItem] SET [Charge] = convert(int,Quantity) * (Select Price From Item Where ItemID = @ItemID) WHERE [ReservationID] = @ReservationID AND [ItemID] = @ItemID
UPDATE [Reservation] SET [TotalItemCharge] = (select sum(Charge) from ReservationItem where ReservationID = @Reservation)">
            <DeleteParameters>
                <asp:Parameter Name="ReservationID" Type="String" />
                <asp:Parameter Name="ItemID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ReservationID" Type="String" />
                <asp:Parameter Name="ItemID" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="ReservationID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="ReservationID" Type="String" />
                <asp:Parameter Name="ItemID" Type="String" />
                <asp:Parameter Name="Reservation" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Item" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT ItemID, ItemID + ', ' + Description + ', ' + convert(varchar,Price) AS ItemInfo, Price FROM Item"></asp:SqlDataSource>
        <br />
        <table class="auto-style1" border="1">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style5"><strong>ItemID, Description, Single Price</strong></td>
                <td class="auto-style4"><strong>Quantity</strong></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="InsertItem" runat="server" OnClick="InsertItem_Click" Text="Insert" />
                </td>
                <td class="auto-style2">
                    &nbsp;<asp:DropDownList ID="ItemID" runat="server" DataSourceID="Item" DataTextField="ItemInfo" DataValueField="ItemID">
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="Quantity" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="ErrorMessage"></asp:Label>
    </form>
</body>
</html>
