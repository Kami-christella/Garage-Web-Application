<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Garage_System2.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css"/>
    <style>
        .form-group {
            margin-bottom: 15px;
        }
    </style>
    <title>Employee Information</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Employee Information</h2>
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
                <asp:TextBox ID="TextBoxDateOfBirth" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelDegree" runat="server" Text="Degree" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="TextBoxDegree" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group text-center">
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="btn btn-primary"/>
            </div>
        </div>
    </form>
</body>
</html>
