<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowCustomers.aspx.cs" Inherits="Trading_company.ShowCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Заказчики</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Клиенты:<br />
        <asp:GridView ID="Customers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceCustomer" AutoGenerateSelectButton="True" OnSelectedIndexChanged="Customers_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                <asp:BoundField DataField="Birthday" HeaderText="Birthday" SortExpression="Birthday" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:TradingCompanyConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Customer] ([Firstname], [Lastname], [Birthday]) VALUES (@Firstname, @Lastname, @Birthday)" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [Firstname] = @Firstname, [Lastname] = @Lastname, [Birthday] = @Birthday WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter DbType="Date" Name="Birthday" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter DbType="Date" Name="Birthday" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="AddCustomer" runat="server" OnClick="AddCustomer_Click" Text="Добавить клиента" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="UpdateCustomer" runat="server" OnClick="UpdateCustomer_Click" Text="Редактировать клиента" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DeleteCustomer" runat="server" OnClick="DeleteCustomer_Click" Text="Удаление клиента" />
        <br />
        <asp:Panel ID="AddNewCustomerPanel" runat="server" Visible="False">
            Имя клиента:
            <asp:TextBox ID="NewFirstname" runat="server"></asp:TextBox>
            <br />
            Фамилия клиента:
            <asp:TextBox ID="NewLastname" runat="server"></asp:TextBox>
            <br />
            Дата рождения:
            <asp:TextBox ID="NewBirthday" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="NewCustomerAdd" runat="server" OnClick="NewCustomerAdd_Click1" Text="Добавить" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="AddCustomerCancel" runat="server" OnClick="AddCustomerCancel_Click" Text="Отмена" />
            <br />
            <asp:Label ID="ErrorLabelCustomer" runat="server"></asp:Label>
        </asp:Panel>
        <br />
        <br />
        Заказы клиентов:
        <asp:SqlDataSource ID="TradingCompany" runat="server" ConnectionString="<%$ ConnectionStrings:TradingCompanyConnectionString %>" SelectCommand="SELECT * FROM [Customer]" DeleteCommand="DELETE FROM [Customer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Customer] ([Firstname], [Lastname], [Birthday]) VALUES (@Firstname, @Lastname, @Birthday)" UpdateCommand="UPDATE [Customer] SET [Firstname] = @Firstname, [Lastname] = @Lastname, [Birthday] = @Birthday WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter DbType="Date" Name="Birthday" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter DbType="Date" Name="Birthday" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="Orders" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="OrdersById">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Title" HeaderText="Название" SortExpression="Title" />
                <asp:BoundField DataField="IdCustomer" HeaderText="Номер заказчика" SortExpression="IdCustomer" ReadOnly="True" />
                <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                <asp:BoundField DataField="Count" HeaderText="Количество" SortExpression="Count" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="OrdersById" runat="server" ConnectionString="<%$ ConnectionStrings:TradingCompanyConnectionString %>" SelectCommand="SELECT * FROM [Order] WHERE ([IdCustomer] = @IdCustomer)" InsertCommand="INSERT INTO [Order] (Title, IdCustomer, Price, Count) VALUES (@Title, @IdCustomer, @Price, @Count)" DeleteCommand="DELETE FROM [Order] WHERE id=@id" UpdateCommand="UPDATE [Order] SET Title = @Title, Price = @Price, Count = @Count WHERE (Id = @Id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="Orders" Name="id" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String"/>
                <asp:ControlParameter ControlID="Customers" Name="IdCustomer" PropertyName="SelectedValue" />
                <asp:Parameter Name="Price" Type="Int32"/>
                <asp:Parameter Name="Count" Type="Int32"/>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="Customers" Name="IdCustomer" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="Orders" Name="Title" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="Orders" Name="Price" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="Orders" Name="Count" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="Orders" Name="Id" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="AddOrder" runat="server" Text="Добавить заказ" Visible="False" OnClick="AddOrder_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="UpdateOrder" runat="server" OnClick="UpdateOrder_Click" Text="Редактировать заказ" Visible="False" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DeleteOrder" runat="server" OnClick="DeleteOrder_Click" Text="Удаление заказа" Visible="False" />
        <br />
        <br />
        <asp:Panel ID="AddNewOrderPanel" runat="server" Visible="False">
            Название товара:
            <asp:TextBox ID="NewTitle" runat="server"></asp:TextBox>
            <br />
            Цена:
            <asp:TextBox ID="NewPrice" runat="server"></asp:TextBox>
            <br />
            Количество:
            <asp:TextBox ID="NewCount" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="NewOrderAdd" runat="server" Text="Добавить" OnClick="NewOrderAdd_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="NewOrderCancel" runat="server" Text="Отмена" OnClick="NewOrderCancel_Click" />
            <br />
            <asp:Label ID="ErrorLabelOrder" runat="server"></asp:Label>
        </asp:Panel>
    </form>
</body>
</html>
