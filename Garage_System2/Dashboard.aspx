<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Garage_System2.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <title>Dashboard</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            margin-bottom: 20px; /* Adds space between navbar and sidebar */
        }
        .sidebar {
            width: 280px;
            position: fixed;
            top: 76px; /* Height of navbar + margin */
            left: 0;
            bottom: 76px; /* Height of footer */
            background-color: #343a40;
            color: white;
            padding-top: 20px;
            padding-bottom: 20px; /* Ensures padding between sidebar and footer */
            overflow-y: auto; /* Adds scroll if content overflows */
        }
        .content {
            margin-left: 300px;
            padding: 20px;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 56px; /* Fixed height for consistent spacing */
        }
        .card {
            margin-bottom: 20px;
        }
        .card-body {
            color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Start Of nav -->
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <a class="navbar-brand" href="#">BEST GARAGE</a>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about-us">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#services">Services</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- End Of nav -->

        <!-- Sidebar -->
        <div class="sidebar">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                <!-- Placeholder for sidebar title or logo -->
            </a>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="#home-section" class="nav-link active" aria-current="page">
                        <i class="fas fa-home me-2"></i>
                        Home
                    </a>
                </li>
                <li>
                    <a href="#clients-section" class="nav-link text-white" onclick="showSection('clients-section')">
                        <i class="fas fa-users me-2"></i>
                        Clients
                    </a>
                </li>
                <li>
                    <a href="#employees-section" class="nav-link text-white">
                        <i class="fas fa-user-tie me-2"></i>
                        Employees
                    </a>
                </li>
                <li>
                    <a href="#users-section" class="nav-link text-white">
                        <i class="fas fa-users-cog me-2"></i>
                        Users
                    </a>
                </li>
                <li>
                    <a href="#customers-section" class="nav-link text-white">
                        <i class="fas fa-user me-2"></i>
                        Customers
                    </a>
                </ul>
            <hr>

            <div class="dropdown">
                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                    <strong>mdo</strong>
                </a>
                <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-item" href="#">New project...</a></li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
            </div>
        </div>
        <!-- End of Sidebar -->

        <!-- Content Area -->
        <div class="content">
            <div id="home-section">
                <h1>Welcome to the Dashboard</h1>
                <!-- Bootstrap Cards -->
                <div class="row">
                    <div class="col-md-3">
                        <div class="card text-white bg-primary mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Number of Users</h5>
                                <p class="card-text" id="numberOfUsers">Loading...</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-success mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Number of Employees</h5>
                                <p class="card-text" id="numberOfEmployees">Loading...</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-warning mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Number of Vehicles</h5>
                                <p class="card-text" id="numberOfVehicles">Loading...</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-danger mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Number of Clients</h5>
                                <p class="card-text" id="numberOfClients">Loading...</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Bootstrap Cards -->
            </div>
            <div id="clients-section" style="display:none;">
                <h1>Clients Information</h1>
                <!-- Table for displaying clients -->
                <asp:GridView ID="ClientsGridView" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ClientName" HeaderText="Client Name" />
                        <asp:BoundField DataField="Telephone" HeaderText="Telephone" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <!-- End of Content Area -->

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <span>© 2023 BEST GARAGE. All rights reserved.</span>
            </div>
        </footer>
        <!-- End of Footer -->
    </form>

    <!-- Include jQuery and Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        function showSection(sectionId) {
            document.getElementById('home-section').style.display = 'none';
            document.getElementById('clients-section').style.display = 'none';
            document.getElementById(sectionId).style.display = 'block';
        }

        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function () {
                const target = this.getAttribute('href').substring(1);
                showSection(target);
            });
        });
    </script>
</body>
</html>
