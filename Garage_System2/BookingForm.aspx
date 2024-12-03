﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingForm.aspx.cs" Inherits="Garage_System2.BookingForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <script>
        function updateEstimatedCost() {
            var checkBoxList = document.getElementById('<%= CheckBoxListServiceType.ClientID %>');
            var estimatedCost = 0;
            for (var i = 0; i < checkBoxList.getElementsByTagName('input').length; i++) {
                if (checkBoxList.getElementsByTagName('input')[i].checked) {
                    estimatedCost += 50000;
                }
            }
            document.getElementById('<%= TextBoxEstimatedCost.ClientID %>').value = estimatedCost;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
           <!-- Start Of nav -->
   <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark justify-content-center">
       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
           <a class="navbar-brand" href="#">BEST GARAGE</a>
           <ul class="navbar-nav mx-auto">
               <li class="nav-item active">
                   <a class="nav-link" href="#homeSection">Home <span class="sr-only">(current)</span></a>
               </li>
               <li class="nav-item">
                   <a class="nav-link" href="#aboutSection">About Us</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link" href="#servicesSection">Services</a>
               </li>
           </ul>
       </div>
       <asp:Button ID="ButtonLogin" runat="server" Text="LOGOUT" CssClass="btn btn-outline-success mr-3" PostBackUrl="~/HomePage.aspx" />

   </nav>
   <!-- End Of nav -->

        <div class="container mt-5">
            <h1 class="text-center mb-4">Booking Form</h1>
            <asp:Label ID="LabelMessage" runat="server" Text="" CssClass=""></asp:Label>
            <div class="form-group">
                <label for="TextBoxName">Name</label>
                <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxPhone">Telephone</label>
                <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="form-control"></asp:TextBox>
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
                <label for="CheckBoxListServiceType">Service Type</label>
                <asp:CheckBoxList ID="CheckBoxListServiceType" runat="server" CssClass="form-control" OnSelectedIndexChanged="CheckBoxListServiceType_SelectedIndexChanged" AutoPostBack="True">
                    
                    <asp:ListItem Value="OilChange">Oil Change</asp:ListItem>
                    <asp:ListItem Value="TireReplacement">Tire Replacement</asp:ListItem>
                    <asp:ListItem Value="BrakeService">Brake Service</asp:ListItem>
                    <asp:ListItem Value="BatteryReplacement">Battery Replacement</asp:ListItem>
                    <asp:ListItem Value="EngineTuneUp">Engine Tune-Up</asp:ListItem>
                </asp:CheckBoxList>
            </div> <br /><br /> <br /> <br /> <br />
            <div class="form-group">
                <label for="TextBoxAdditionalNotes">Additional Notes</label>
                <asp:TextBox ID="TextBoxAdditionalNotes" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBoxBookingDate">Booking Date</label>
                <asp:TextBox ID="TextBoxBookingDate" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="DropDownListPaymentMethod">Payment Method</label>
                <asp:DropDownList ID="DropDownListPaymentMethod" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                    <asp:ListItem Value="Momo">Momo</asp:ListItem>
                    <asp:ListItem Value="VisaCard">Visa Card</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="TextBoxEstimatedCost">Estimated Cost</label>
                <asp:TextBox ID="TextBoxEstimatedCost" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
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
        </div>
    </form>
</body>
</html>
