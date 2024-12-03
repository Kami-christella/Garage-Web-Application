<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Garage_System2.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <style>
        body {
            background: url('Content/cars.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .signup-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

            .signup-form h1 {
                margin-bottom: 20px;
            }

            .signup-form .form-group {
                margin-bottom: 15px;
            }

            .signup-form .form-control {
                padding: 10px;
                font-size: 16px;
            }

            .signup-form .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                width: 100%;
                padding: 10px;
                font-size: 18px;
            }
    </style>
    <title>Sign Up</title>

</head>
<body>
    

    <form id="form1" runat="server" class="signup-form">
        <h1 class="text-center">SignUp</h1>
        <div class="form-group text-center">
            <asp:Label ID="messageBox" runat="server" Text=""></asp:Label>

        </div>
            
        <div class="form-group">
            <asp:Panel ID="Panel1" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Username" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="usernameBox" runat="server" CssClass="form-control" required="true"></asp:TextBox>
            </asp:Panel>
        </div>
        <div class="form-group">
            <asp:Panel ID="Panel2" runat="server">
                <asp:Label ID="Label2" runat="server" Text="Email" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="emailBox" runat="server" CssClass="form-control" required="true" TextMode="Email" Placeholder="Enter your Email"></asp:TextBox>
            </asp:Panel>
        </div>
        <div class="form-group">
            <asp:Panel ID="Panel3" runat="server">
                <asp:Label ID="Label3" runat="server" Text="Password" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="passwordBox" runat="server" TextMode="Password" CssClass="form-control" required="true"></asp:TextBox>
            </asp:Panel>
        </div>
           <div class="form-group">
       <asp:Panel ID="Panel5" runat="server">
           <asp:Label ID="Label5" runat="server" Text="Confirm Password" CssClass="control-label"></asp:Label>
           <asp:TextBox ID="confirmPasswordBox" runat="server" TextMode="Password" CssClass="form-control" required="true"></asp:TextBox>
       </asp:Panel>
   </div>
        <div class="form-group">
            <asp:Panel ID="Panel4" runat="server">
                <asp:Label ID="Label4" runat="server" Text="Role" CssClass="control-label"></asp:Label>
                <asp:DropDownList ID="roleBox" runat="server" CssClass="form-control" required="true">
                    <asp:ListItem Text="Select Role" Value="" />
                    <asp:ListItem Text="Applicant" Value="Applicant" />
                    <asp:ListItem Text="Client" Value="Client" />
                  

                </asp:DropDownList>

            </asp:Panel>
        </div>
        <asp:Button ID="submitButton" runat="server" Text="Sign Up" CssClass="btn btn-primary" OnClick="submitButton_Click" />
    </form>
</body>
</html>
