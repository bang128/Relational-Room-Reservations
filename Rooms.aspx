<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rooms.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 60%;
        }
        .auto-style2 {
            width: 60%;
        }
        .auto-style3 {
            width: 145px;
            background-color: #507CD1;
        }
        .auto-style7 {
            text-align: center;
            color: #FFFFFF;
            width: 375px;
            background-color: #507CD1;
        }
        .auto-style8 {
            text-align: center;
            width: 375px;
            background-color: #EFF3FB;
        }
        .auto-style9 {
            text-align: center;
            color: #FFFFFF;
            width: 470px;
            background-color: #507CD1;
        }
        .auto-style10 {
            text-align: center;
            width: 470px;
            background-color: #EFF3FB;
        }
        .auto-style11 {
            text-align: center;
            width: 144px;
            background-color: #EFF3FB;
        }
        .auto-style12 {
            text-align: center;
            color: #FFFFFF;
            width: 200px;
            background-color: #507CD1;
        }
        .auto-style13 {
            text-align: center;
            width: 200px;
            background-color: #EFF3FB;
        }
        body {
         background-color: rgb(237,244,248)}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Room Inventory</h1>
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
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="RoomID" DataSourceID="SqlDataSource1" Height="50px" Width="480px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="RoomID" HeaderText="RoomID" ReadOnly="True" SortExpression="RoomID" />
                <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                <asp:TemplateField HeaderText="Building, Address" SortExpression="BuildingID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="NameAddress" DataValueField="BuildingID" SelectedValue='<%# Bind("BuildingID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="NameAddress" DataValueField="BuildingID" SelectedValue='<%# Bind("BuildingID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="NameAddress" DataValueField="BuildingID" SelectedValue='<%# Bind("BuildingID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Owner, Phone" SortExpression="OwnerID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="OwnerPhone" DataValueField="DepartmentID" SelectedValue='<%# Bind("OwnerID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="OwnerPhone" DataValueField="DepartmentID" SelectedValue='<%# Bind("OwnerID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="OwnerPhone" DataValueField="DepartmentID" SelectedValue='<%# Bind("OwnerID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Size" HeaderText="Size (square ft)" SortExpression="Size" />
                <asp:BoundField DataField="Height" HeaderText="Height (ft)" SortExpression="Height" />
                <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity" />
                <asp:TemplateField HeaderText="SuperRoomID" SortExpression="SuperRoomID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource7" DataTextField="RoomID" DataValueField="RoomID" SelectedValue='<%# Bind("SuperRoomID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource7" DataTextField="RoomID" DataValueField="RoomID" SelectedValue='<%# Bind("SuperRoomID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource7" DataTextField="RoomID" DataValueField="RoomID" SelectedValue='<%# Bind("SuperRoomID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
                <asp:BoundField DataField="Longtitude" HeaderText="Longtitude" SortExpression="Longtitude" />
                <asp:BoundField DataField="TotalItemCharge" HeaderText="TotalItemCharge" SortExpression="TotalItemCharge" DataFormatString="{0:C}" />
                <asp:BoundField DataField="RoomCharge" HeaderText="RoomCharge" SortExpression="RoomCharge" DataFormatString="{0:C}" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [RoomItem] WHERE [RoomID] = @RoomID;
DELETE FROM [Room] WHERE [RoomID] = @RoomID" InsertCommand="INSERT INTO [Room] ([RoomID], [RoomNumber], [BuildingID], [Floor], [Description], [OwnerID], [Size], [Height], [Capacity], [SuperRoomID], [Latitude], [Longtitude], [TotalItemCharge], [RoomCharge]) VALUES (@RoomID, @RoomNumber, @BuildingID, @Floor, @Description, @OwnerID, @Size, @Height, @Capacity, @SuperRoomID, @Latitude, @Longtitude, @TotalItemCharge, @RoomCharge)" SelectCommand="SELECT [RoomID], [RoomNumber], [BuildingID], [Floor], [Description], [OwnerID], [Size], [Height], [Capacity], [SuperRoomID], [Latitude], [Longtitude], [TotalItemCharge], [RoomCharge] FROM [Room] Where RoomID &lt;&gt; 'None'" UpdateCommand="UPDATE [Room] SET [RoomNumber] = @RoomNumber, [BuildingID] = @BuildingID, [Floor] = @Floor, [Description] = @Description, [OwnerID] = @OwnerID, [Size] = @Size, [Height] = @Height, [Capacity] = @Capacity, [SuperRoomID] = @SuperRoomID, [Latitude] = @Latitude, [Longtitude] = @Longtitude, [TotalItemCharge] = (select convert(float, sum(Charge)) From RoomItem Where RoomItem.RoomID = @RoomID), [RoomCharge] = @RoomCharge WHERE [RoomID] = @RoomID">
            <DeleteParameters>
                <asp:Parameter Name="RoomID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RoomID" Type="String" />
                <asp:Parameter Name="RoomNumber" Type="Int32" />
                <asp:Parameter Name="BuildingID" Type="String" />
                <asp:Parameter Name="Floor" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="OwnerID" Type="String" />
                <asp:Parameter Name="Size" Type="Double" />
                <asp:Parameter Name="Height" Type="Double" />
                <asp:Parameter Name="Capacity" Type="Int32" />
                <asp:Parameter Name="SuperRoomID" Type="String" />
                <asp:Parameter Name="Latitude" Type="Double" />
                <asp:Parameter Name="Longtitude" Type="Double" />
                <asp:Parameter Name="TotalItemCharge" Type="Decimal" />
                <asp:Parameter Name="RoomCharge" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RoomNumber" Type="Int32" />
                <asp:Parameter Name="BuildingID" Type="String" />
                <asp:Parameter Name="Floor" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="OwnerID" Type="String" />
                <asp:Parameter Name="Size" Type="Double" />
                <asp:Parameter Name="Height" Type="Double" />
                <asp:Parameter Name="Capacity" Type="Int32" />
                <asp:Parameter Name="SuperRoomID" Type="String" />
                <asp:Parameter Name="Latitude" Type="Double" />
                <asp:Parameter Name="Longtitude" Type="Double" />
                <asp:Parameter Name="RoomID" Type="String" />
                <asp:Parameter Name="RoomCharge" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT BuildingID, BuildingName + ', ' + Address AS NameAddress FROM Building"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT DepartmentID, DepartmentName + ', ' + Phone AS OwnerPhone FROM Department Where DepartmentID &lt;&gt; 'None'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [RoomID] FROM [Room]"></asp:SqlDataSource>
        <br />
        <h3>Equipments/Features</h3>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="auto-style1" DataKeyNames="RoomID,ItemID,Fixed" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="RoomID" HeaderText="RoomID" ReadOnly="True" SortExpression="RoomID" Visible="False" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" >
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
                <asp:CheckBoxField DataField="Fixed" HeaderText="Fixed" ReadOnly="True" SortExpression="Fixed" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CheckBoxField>
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [RoomItem] WHERE [RoomID] = @RoomID AND [ItemID] = @ItemID AND [Fixed] = @Fixed" InsertCommand="INSERT INTO [RoomItem] ([RoomID], [ItemID], [Quantity], [Fixed], [Charge]) VALUES (@RoomID, @ItemID, @Quantity, @Fixed, convert(int,@Quantity) * (Select Price From Item Where ItemID = @ItemID))" SelectCommand="SELECT [RoomID], RoomItem.[ItemID], Description, [Quantity], [Fixed], [Charge] FROM [RoomItem] Inner Join Item On RoomItem.ItemID = Item.ItemID WHERE ([RoomID] = @RoomID)" UpdateCommand="UPDATE [RoomItem] SET [Quantity] = @Quantity WHERE [RoomID] = @RoomID AND [ItemID] = @ItemID AND [Fixed] = @Fixed;
UPDATE [RoomItem] SET [Charge] =  convert(int,Quantity) * (Select Price From Item Where ItemID = @ItemID) WHERE [RoomID] = @RoomID AND [ItemID] = @ItemID AND [Fixed] = @Fixed">
            <DeleteParameters>
                <asp:Parameter Name="RoomID" Type="String" />
                <asp:Parameter Name="ItemID" Type="String" />
                <asp:Parameter Name="Fixed" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RoomID" Type="String" />
                <asp:Parameter Name="ItemID" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Fixed" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="RoomID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="RoomID" Type="String" />
                <asp:Parameter Name="ItemID" Type="String" />
                <asp:Parameter Name="Fixed" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT ItemID, ItemID + ', ' + Description AS ItemDescription, Price FROM Item"></asp:SqlDataSource>
        <br />
        <table class="auto-style2" border="1">
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style9"><strong>Item, Description, Single Price</strong></td>
                <td class="auto-style7"><strong>Quantity</strong></td>
                <td class="auto-style12"><strong>Fixed</strong></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Button ID="InsertItem" runat="server" OnClick="InsertItem_Click" Text="Insert" />
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="ItemID" runat="server" DataSourceID="SqlDataSource6" DataTextField="ItemInfo" DataValueField="ItemID">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="Quantity" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style13">
                    <asp:CheckBox ID="Fixed" runat="server" />
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [ItemID], ItemID + ', ' + [Description] + ', ' + convert(varchar, [Price]) As ItemInfo, Price FROM [Item]"></asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="ErrorMessage"></asp:Label>
    </form>
</body>
</html>
