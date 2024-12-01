<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingForm.aspx.cs" Inherits="Garage_System2.BookingForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css"/>
    <style>
        body {
            background-color: #000;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }
        .form-title {
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            width: 100%;
            max-width: 300px;
            display: inline-block;
        }
    </style>
    <title>Booking Form</title>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div class="form-title">BOOKING FORM</div>

        <!-- Client Information -->
        <div class="form-group">
            <asp:Label ID="LabelName" runat="server" Text="Name" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelPhone" runat="server" Text="Phone" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxPhone" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelEmail" runat="server" Text="Email" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Vehicle Information -->
        <div class="form-group">
            <asp:Label ID="LabelMake" runat="server" Text="Car Make" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxMake" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelModel" runat="server" Text="Car Model" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxModel" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelYear" runat="server" Text="Model Year" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxYear" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelLicensePlate" runat="server" Text="License Plate" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxLicensePlate" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Service Details -->
        <div class="form-group">
            <asp:Label ID="LabelServiceType" runat="server" Text="Service Type" CssClass="control-label"></asp:Label>
            <asp:CheckBoxList ID="CheckBoxListServiceType" runat="server" CssClass="form-control">
                <asp:ListItem Text="Oil Change" Value="Oil Change"/>
                <asp:ListItem Text="Tire Rotation" Value="Tire Rotation"/>
                <asp:ListItem Text="Engine Repair" Value="Engine Repair"/>
                <asp:ListItem Text="Brake Inspection" Value="Brake Inspection"/>
                <asp:ListItem Text="Battery Replacement" Value="Battery Replacement"/>
                <asp:ListItem Text="Wheel Alignment" Value="Wheel Alignment"/>
                <asp:ListItem Text="Transmission Service" Value="Transmission Service"/>
                <asp:ListItem Text="Air Conditioning Service" Value="Air Conditioning Service"/>
                <asp:ListItem Text="Exhaust Repair" Value="Exhaust Repair"/>
                <asp:ListItem Text="Suspension Repair" Value="Suspension Repair"/>
            </asp:CheckBoxList>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelAdditionalNotes" runat="server" Text="Additional Notes" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxAdditionalNotes" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Booking Details -->
        <div class="form-group">
            <asp:Label ID="LabelBookingDateTime" runat="server" Text="Booking Date & Time" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxBookingDateTime" runat="server" TextMode="DateTimeLocal" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelPreferredServiceDateTime" runat="server" Text="Preferred Service Date & Time" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxPreferredServiceDateTime" runat="server" TextMode="DateTimeLocal" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Payment Information -->
        <div class="form-group">
            <asp:Label ID="LabelPaymentMethod" runat="server" Text="Payment Method" CssClass="control-label"></asp:Label>
            <asp:DropDownList ID="DropDownListPaymentMethod" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Payment Method" Value=""/>
                <asp:ListItem Text="Cash" Value="Cash"/>
                <asp:ListItem Text="Credit Card" Value="Credit Card"/>
                <asp:ListItem Text="Mobile Payment" Value="Mobile Payment"/>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelEstimatedCost" runat="server" Text="Estimated Cost" CssClass="control-label"></asp:Label>
            <asp:TextBox ID="TextBoxEstimatedCost" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Confirmation -->
        <div class="form-group">
            <asp:Label ID="LabelTermsConditions" runat="server" Text="I agree to the terms and conditions" CssClass="control-label"></asp:Label>
            <asp:CheckBox ID="CheckBoxTermsConditions" runat="server"/>
        </div>

        <div class="form-group text-center">
            <asp:Label ID="LabelMessage" runat="server" Text="" CssClass="text-danger"></asp:Label> <!-- Added label for messages -->
        </div>

        <div class="form-group text-center">
            <asp:Button ID="ButtonSubmit" runat="server" Text="BOOK NOW" CssClass="btn btn-primary" OnClick="ButtonSubmit_Click" />
        </div>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var today = new Date().toISOString().split('T')[0];
            var minTime = "09:00";
            var maxTime = "18:00";
            document.getElementById('<%= TextBoxBookingDateTime.ClientID %>').setAttribute('min', today + "T" + minTime);
            document.getElementById('<%= TextBoxPreferredServiceDateTime.ClientID %>').setAttribute('min', today + "T" + minTime);
            document.getElementById('<%= TextBoxBookingDateTime.ClientID %>').setAttribute('max', today + "T" + maxTime);
            document.getElementById('<%= TextBoxPreferredServiceDateTime.ClientID %>').setAttribute('max', today + "T" + maxTime);
        });
    </script>
</body>
</html>
