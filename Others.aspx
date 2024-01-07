<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Others.aspx.cs" Inherits="Others" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-color: rgb(237,244,248)}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Other Tables</h1>
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
        <p>&nbsp;</p>
        <h2>Accounts for Charge</h2>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="AccountID" DataSourceID="SqlDataSource1" Height="50px" Width="350px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="AccountID" HeaderText="AccountID" ReadOnly="True" SortExpression="AccountID" />
                <asp:TemplateField HeaderText="EID, FullName" SortExpression="EID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="AccountNumber" HeaderText="AccountNumber" SortExpression="AccountNumber" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [Account] WHERE [AccountID] = @AccountID" InsertCommand="INSERT INTO [Account] ([AccountID], [EID], [AccountNumber]) VALUES (@AccountID, @EID, @AccountNumber)" SelectCommand="SELECT [AccountID], [EID], [AccountNumber] FROM [Account]" UpdateCommand="UPDATE [Account] SET [EID] = @EID, [AccountNumber] = @AccountNumber WHERE [AccountID] = @AccountID">
            <DeleteParameters>
                <asp:Parameter Name="AccountID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountID" Type="String" />
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="AccountNumber" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="AccountNumber" Type="String" />
                <asp:Parameter Name="AccountID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <h2>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [EID], EID + ', ' + [FirstName] + ' ' + [LastName] As Info FROM [People] Where EID &lt;&gt; 'None'"></asp:SqlDataSource>
        </h2>
        <h2>&nbsp;</h2>
        <h2>Buildings</h2>
        <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="BuildingID" DataSourceID="SqlDataSource3" Height="50px" Width="275px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="BuildingID" HeaderText="BuildingID" ReadOnly="True" SortExpression="BuildingID" />
                <asp:BoundField DataField="BuildingName" HeaderText="BuildingName" SortExpression="BuildingName" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [Building] WHERE [BuildingID] = @BuildingID" InsertCommand="INSERT INTO [Building] ([BuildingID], [BuildingName], [Address]) VALUES (@BuildingID, @BuildingName, @Address)" SelectCommand="SELECT [BuildingID], [BuildingName], [Address] FROM [Building]" UpdateCommand="UPDATE [Building] SET [BuildingName] = @BuildingName, [Address] = @Address WHERE [BuildingID] = @BuildingID">
            <DeleteParameters>
                <asp:Parameter Name="BuildingID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BuildingID" Type="String" />
                <asp:Parameter Name="BuildingName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BuildingName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="BuildingID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <h2>&nbsp;</h2>
        <h2>Departments</h2>
        <asp:DetailsView ID="DetailsView3" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="DepartmentID" DataSourceID="SqlDataSource4" Height="50px" Width="401px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" ReadOnly="True" SortExpression="DepartmentID" />
                <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
                <asp:TemplateField HeaderText="SuperDepartment" SortExpression="SuperDepartmentID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="DepartmentName" DataValueField="DepartmentID" SelectedValue='<%# Bind("SuperDepartmentID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="DepartmentName" DataValueField="DepartmentID" SelectedValue='<%# Bind("SuperDepartmentID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="DepartmentName" DataValueField="DepartmentID" SelectedValue='<%# Bind("SuperDepartmentID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:TemplateField HeaderText="ManagerID, FullName" SortExpression="ManagerID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("ManagerID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("ManagerID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Info" DataValueField="EID" SelectedValue='<%# Bind("ManagerID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [Department] WHERE [DepartmentID] = @DepartmentID" InsertCommand="INSERT INTO [Department] ([DepartmentID], [DepartmentName], [SuperDepartmentID], [Phone], [ManagerID]) VALUES (@DepartmentID, @DepartmentName, @SuperDepartmentID, @Phone, @ManagerID)" SelectCommand="SELECT [DepartmentID], [DepartmentName], [SuperDepartmentID], [Phone], [ManagerID] FROM [Department] Where DepartmentID &lt;&gt; 'None'" UpdateCommand="UPDATE [Department] SET [DepartmentName] = @DepartmentName, [SuperDepartmentID] = @SuperDepartmentID, [Phone] = @Phone, [ManagerID] = @ManagerID WHERE [DepartmentID] = @DepartmentID">
            <DeleteParameters>
                <asp:Parameter Name="DepartmentID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DepartmentID" Type="String" />
                <asp:Parameter Name="DepartmentName" Type="String" />
                <asp:Parameter Name="SuperDepartmentID" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="ManagerID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DepartmentName" Type="String" />
                <asp:Parameter Name="SuperDepartmentID" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="ManagerID" Type="String" />
                <asp:Parameter Name="DepartmentID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [DepartmentID], [DepartmentName] FROM [Department]"></asp:SqlDataSource>
        <h2>&nbsp;</h2>
        <h2>Items</h2>
        <asp:DetailsView ID="DetailsView4" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ItemID" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Price" DataFormatString="{0:C}" HeaderText="Price" SortExpression="Price" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [Item] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [Item] ([ItemID], [Description], [Price]) VALUES (@ItemID, @Description, @Price)" SelectCommand="SELECT [ItemID], [Description], [Price] FROM [Item]" UpdateCommand="UPDATE [Item] SET [Description] = @Description, [Price] = @Price WHERE [ItemID] = @ItemID">
            <DeleteParameters>
                <asp:Parameter Name="ItemID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemID" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="ItemID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
