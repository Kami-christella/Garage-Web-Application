<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddClient.aspx.cs" Inherits="Garage_System2.AddClient" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Client</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1 class="text-center mb-4">Add New Client</h1>
            <asp:Label ID="LabelMessage" runat="server" Text="" CssClass=""></asp:Label>
            <div class="form-group">
                <label for="TextBoxClientName">Client Name</label>
                <asp:TextBox ID="TextBoxClientName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxTelephone">Telephone</label>
                <asp:TextBox ID="TextBoxTelephone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxEmail">Email</label>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxAddress">Address</label>
                <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="ButtonSubmit_Click" />
            <asp:Button ID="ButtonBackToLogin" runat="server" Text="Back to Login" CssClass="btn btn-secondary ml-2" OnClick="ButtonBackToLogin_Click" />
        </div>
    </form>
</body>
</html>
