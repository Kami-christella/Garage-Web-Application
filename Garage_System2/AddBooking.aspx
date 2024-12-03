<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBooking.aspx.cs" Inherits="Garage_System2.AddBooking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Booking</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1 class="text-center mb-4">Add New Booking</h1>
            <asp:Label ID="LabelMessage" runat="server" Text="" CssClass=""></asp:Label>
            <div class="form-group">
                <label for="TextBoxName">Name</label>
                <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control"></asp:TextBox>
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
            <div class="form-group">
                <label for="TextBoxCarMake">Car Make</label>
                <asp:TextBox ID="TextBoxCarMake" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxCarModel">Car Model</label>
                <asp:TextBox ID="TextBoxCarModel" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxModelYear">Model Year</label>
                <asp:TextBox ID="TextBoxModelYear" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxServiceType">Service Type</label>
                <asp:TextBox ID="TextBoxServiceType" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxAdditionalNotes">Additional Notes</label>
                <asp:TextBox ID="TextBoxAdditionalNotes" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxBookingDate">Booking Date</label>
                <asp:TextBox ID="TextBoxBookingDate" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="DropDownListPaymentMethod">Payment Method</label>
                <asp:DropDownList ID="DropDownListPaymentMethod" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                    <asp:ListItem Value="Momo">Momo</asp:ListItem>
                    <asp:ListItem Value="Visa Card">Visa Card</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="TextBoxEstimatedCost">Estimated Cost</label>
                <asp:TextBox ID="TextBoxEstimatedCost" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxStatus">Status</label>
                <asp:TextBox ID="TextBoxStatus" runat="server" CssClass="form-control" ReadOnly="True" Text="Pending"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxLicensePlate">License Plate</label>
                <asp:TextBox ID="TextBoxLicensePlate" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="ButtonSubmit_Click" />
            <asp:Button ID="ButtonBackToDashboard" runat="server" Text="Back to Dashboard" CssClass="btn btn-secondary ml-2" OnClick="ButtonBackToDashboard_Click" />
        </div>
    </form>
</body>
</html>
