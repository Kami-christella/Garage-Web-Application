<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicantForm.aspx.cs" Inherits="Garage_System2.ApplicantForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css"/>
    <style>
        body {
           background: url('Content/mech.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
            max-width: 600px;
            width: 100%;
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
            padding: 5px;
            font-size: 14px;
        }
        .btn-primary {
            padding: 10px 20px;
            font-size: 16px;
        }
    </style>
    <title>Application Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="form-title">Application Form</h2>
            <div class="form-group">
                <asp:Label ID="LabelFullName" runat="server" Text="Full Name" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="TextBoxFullName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelEmail" runat="server" Text="Email" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelYearsOfExperience" runat="server" Text="Years of Experience" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="TextBoxYearsOfExperience" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelLevelOfEducation" runat="server" Text="Level of Education" CssClass="control-label"></asp:Label>
                <asp:DropDownList ID="DropDownListLevelOfEducation" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Level" Value="" />
                    <asp:ListItem Text="A0" Value="A0" />
                    <asp:ListItem Text="A1" Value="A1" />
                    <asp:ListItem Text="A2" Value="A2" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelDateOfBirth" runat="server" Text="Date of Birth" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="TextBoxDateOfBirth" runat="server" CssClass="form-control"  TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelDegree" runat="server" Text="Degree" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="TextBoxDegree" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Short Description" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="DescriptionBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group text-center">
                <asp:Label ID="LabelMessage" runat="server" CssClass="text-danger"></asp:Label>
            </div>
            <div class="form-group text-center">
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="ButtonSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
