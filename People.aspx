<%@ Page Language="C#" AutoEventWireup="true" CodeFile="People.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 80%;
        }
        .auto-style2 {
            background-color: #507CD1;
        }
        .auto-style3 {
            text-align: center;
            background-color: #EFF3FB;
        }
        .auto-style4 {
            color: #FFFFFF;
            text-align: center;
            background-color: #507CD1;
        }
        body {
            background-color: rgb(237,244,248)}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>People</h1>
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
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="EID" DataSourceID="SqlDataSource1" Height="50px" Width="191px" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="EID" HeaderText="EID" ReadOnly="True" SortExpression="EID" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:TemplateField HeaderText="PriorityLevel" SortExpression="PriorityLevel">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("PriorityLevel") %>'>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("PriorityLevel") %>'>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("PriorityLevel") %>'>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department" SortExpression="DepartmentID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="DepartmentName" DataValueField="DepartmentID" SelectedValue='<%# Bind("DepartmentID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="DepartmentName" DataValueField="DepartmentID" SelectedValue='<%# Bind("DepartmentID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="DepartmentName" DataValueField="DepartmentID" SelectedValue='<%# Bind("DepartmentID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Office" HeaderText="Office" SortExpression="Office" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [EID], [LastName], [FirstName], [Email], [Phone], [Password], [PriorityLevel], [DepartmentID], [Office] FROM [People] Where EID &lt;&gt; 'None'" DeleteCommand="DELETE FROM [People] WHERE [EID] = @EID" InsertCommand="INSERT INTO [People] ([EID], [LastName], [FirstName], [Email], [Phone], [Password], [PriorityLevel], [DepartmentID], [Office]) VALUES (@EID, @LastName, @FirstName, @Email, @Phone, @Password, @PriorityLevel, @DepartmentID, @Office)" UpdateCommand="UPDATE [People] SET [LastName] = @LastName, [FirstName] = @FirstName, [Email] = @Email, [Phone] = @Phone, [Password] = @Password, [PriorityLevel] = @PriorityLevel, [DepartmentID] = @DepartmentID, [Office] = @Office WHERE [EID] = @EID">
            <DeleteParameters>
                <asp:Parameter Name="EID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="PriorityLevel" Type="Int32" />
                <asp:Parameter Name="DepartmentID" Type="String" />
                <asp:Parameter Name="Office" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="PriorityLevel" Type="Int32" />
                <asp:Parameter Name="DepartmentID" Type="String" />
                <asp:Parameter Name="Office" Type="String" />
                <asp:Parameter Name="EID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [DepartmentID], [DepartmentName] FROM [Department]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT [DepartmentID], [DepartmentName] FROM [Department] Where DepartmentID &lt;&gt; 'None'"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProxyID" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None" Width="740px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ProxyID" HeaderText="ProxyID" ReadOnly="True" SortExpression="ProxyID" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Proxy Person" SortExpression="EID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource4" DataTextField="FullName" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource4" DataTextField="FullName" DataValueField="EID" SelectedValue='<%# Bind("EID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:BoundField DataField="ManagerID" HeaderText="ManagerID" SortExpression="ManagerID" Visible="False" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="ProxyLevel" SortExpression="ProxyLevel">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" SelectedValue='<%# Bind("ProxyLevel") %>'>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" SelectedValue='<%# Bind("ProxyLevel") %>'>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" DeleteCommand="DELETE FROM [Proxy] WHERE [ProxyID] = @ProxyID" InsertCommand="INSERT INTO [Proxy] ([ProxyID], [EID], [ManagerID], [Password], [ProxyLevel]) VALUES (@ProxyID, @EID, @ManagerID, @Password, @ProxyLevel)" SelectCommand="SELECT [ProxyID], [EID], [ManagerID], [Password], [ProxyLevel] FROM [Proxy] WHERE ([ManagerID] = @EID) And EID &lt;&gt; 'None'" UpdateCommand="UPDATE [Proxy] SET  [EID] = @EID, [Password] = @Password, [ProxyLevel] = @ProxyLevel Where ProxyID = @ProxyID">
            <DeleteParameters>
                <asp:Parameter Name="ProxyID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProxyID" Type="String" />
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="ManagerID" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="ProxyLevel" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="EID" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="EID" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="ProxyLevel" Type="Int32" />
                <asp:Parameter Name="ProxyID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT EID, EID + ', ' + FirstName + ' ' + LastName As FullName From People Where PriorityLevel &lt; ANY 
(Select PriorityLevel From People As T Where T.EID = @EID) and not exists (Select * From Proxy Where People.EID = Proxy.EID And ManagerID &lt;&gt; @EID) and EID &lt;&gt; 'None'">
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="EID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4"><strong>ProxyID</strong><td class="auto-style4"><strong>Proxy Person</strong></td>
                <td class="auto-style4"><strong>Password</strong></td>
                <td class="auto-style4"><strong>Proxy Level</strong></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="InsertProxy" runat="server" OnClick="Button1_Click" Text="Insert" />
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="ProxyID" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ProxyPerson" runat="server" DataSourceID="SqlDataSource6" DataTextField="FullName" DataValueField="EID">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ProxyLevel" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="ErrorMessage"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:student24ConnectionString %>" SelectCommand="SELECT EID, EID + ', ' + FirstName + ' ' + LastName As FullName From People Where PriorityLevel &lt; ANY 
(Select PriorityLevel From People As T Where T.EID = @EID) and not exists (Select * From Proxy Where People.EID = Proxy.EID) and EID &lt;&gt; 'None'">
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="EID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
