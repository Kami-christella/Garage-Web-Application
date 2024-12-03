<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientBookingInfo.aspx.cs" Inherits="Garage_System2.ClientBookingInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <style>
        body {
            background: url('Content/cars.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .booking-info {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .booking-info h1 {
            margin-bottom: 20px;
        }

        .booking-info .info-group {
            margin-bottom: 15px;
        }

        .booking-info .info-group label {
            font-weight: bold;
        }

        .booking-info .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            width: 100%;
            padding: 10px;
            font-size: 18px;
        }
    </style>
    <title>Booking Information</title>
</head>
<body>
    <form id="form1" runat="server" class="booking-info">
        <h1 class="text-center">Booking Information</h1>
        <asp:Label ID="messageBox" runat="server" Text=""></asp:Label>
        <div class="info-group">
            <label>Name:</label>
            <asp:Label ID="LabelName" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Telephone:</label>
            <asp:Label ID="LabelTelephone" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Email:</label>
            <asp:Label ID="LabelEmail" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Address:</label>
            <asp:Label ID="LabelAddress" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Car Make:</label>
            <asp:Label ID="LabelCarMake" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Car Model:</label>
            <asp:Label ID="LabelCarModel" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Model Year:</label>
            <asp:Label ID="LabelModelYear" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Service Type:</label>
            <asp:Label ID="LabelServiceType" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Additional Notes:</label>
            <asp:Label ID="LabelAdditionalNotes" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Booking Date:</label>
            <asp:Label ID="LabelBookingDate" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Payment Method:</label>
            <asp:Label ID="LabelPaymentMethod" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Estimated Cost:</label>
            <asp:Label ID="LabelEstimatedCost" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>Status:</label>
            <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
        </div>
        <div class="info-group">
            <label>License Plate:</label>
            <asp:Label ID="LabelLicensePlate" runat="server" Text=""></asp:Label>
        </div>
        <asp:Button ID="ButtonBack" runat="server" Text="Book Again" CssClass="btn btn-primary" PostBackUrl="~/BookingForm.aspx" />
    </form>
</body>
</html>
