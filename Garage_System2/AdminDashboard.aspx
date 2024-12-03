<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Garage_System2.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1 class="text-center mb-4">Admin Dashboard</h1>
            
            <!-- Clients Section -->
            <div class="card mb-4">
                <div class="card-header">
                    <h3>Manage Clients</h3>
                </div>
                <div class="card-body">
                    <asp:GridView ID="ClientsGridView" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="ClientsID" OnRowEditing="ClientsGridView_RowEditing" OnRowDeleting="ClientsGridView_RowDeleting" OnRowUpdating="ClientsGridView_RowUpdating" OnRowCancelingEdit="ClientsGridView_RowCancelingEdit">
                        <Columns>
                            <asp:BoundField DataField="ClientsID" HeaderText="Client ID" ReadOnly="True" />
                            <asp:BoundField DataField="ClientName" HeaderText="Client Name" />
                            <asp:BoundField DataField="Telephone" HeaderText="Telephone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="AddClientButton" runat="server" Text="Add New Client" CssClass="btn btn-primary mt-2" OnClick="AddClientButton_Click" />
                </div>
            </div>
            
            <!-- Booking Form Section -->
            <div class="card">
                <div class="card-header">
                    <h3>Manage Bookings</h3>
                </div>
                <div class="card-body">
                    <asp:GridView ID="BookingsGridView" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="LicensePlate" OnRowEditing="BookingsGridView_RowEditing" OnRowDeleting="BookingsGridView_RowDeleting" OnRowUpdating="BookingsGridView_RowUpdating" OnRowCancelingEdit="BookingsGridView_RowCancelingEdit">
                        <Columns>
                            <asp:BoundField DataField="LicensePlate" HeaderText="License Plate" ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Telephone" HeaderText="Telephone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                            <asp:BoundField DataField="CarMake" HeaderText="Car Make" />
                            <asp:BoundField DataField="CarModel" HeaderText="Car Model" />
                            <asp:BoundField DataField="ModelYear" HeaderText="Model Year" />
                            <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                            <asp:BoundField DataField="AdditionalNotes" HeaderText="Additional Notes" />
                            <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" />
                            <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" />
                            <asp:BoundField DataField="EstimatedCost" HeaderText="Estimated Cost" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="AddBookingButton" runat="server" Text="Add New Booking" CssClass="btn btn-primary mt-2" OnClick="AddBookingButton_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
