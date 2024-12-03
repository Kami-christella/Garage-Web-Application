<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Garage_System2.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GARAGE</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <style>
        html {
            scroll-behavior: smooth; /* Smooth scrolling */
        }
    </style>
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
            <asp:Button ID="ButtonLogin" runat="server" Text="LOGIN" CssClass="btn btn-outline-success mr-3" PostBackUrl="~/Login.aspx" />
            <asp:Button ID="ButtonSignup" runat="server" Text="SIGNUP" CssClass="btn btn-outline-success mr-3" PostBackUrl="~/SignUp.aspx" />
        </nav>
        <!-- End Of nav -->

        <!-- Home Section -->
        <div id="homeSection">
            <!-- Start of Carousel -->
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="Content/cars.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Clients</h5>
                            <p>Clients are our priority</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Content/mech.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Content/ga1.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br />
        </div>

        <!-- About Us Section -->
        <div id="aboutSection" class="container my-5">
            <h1 class="text-center" style="color:green;">About Us</h1>
            <p class="text-center">
                Welcome to BEST GARAGE! We are dedicated to providing top-quality vehicle maintenance, repair services, diagnostics, and custom solutions.
                Our team of experienced professionals ensures that every client receives the best care and service possible. 
                At BEST GARAGE, customer satisfaction is our top priority.
            </p>
        </div> <br /><br /><br /><br /><br /><br />

        <!-- Services Section -->
        <div id="servicesSection" class="container my-5">
            <h1 class="text-center" style="color:green;">Our Services</h1> <br /><br />
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Vehicle Maintenance</h5>
                            <p class="card-text">Routine services such as oil changes, tire rotations, and brake inspections to keep your vehicle in top condition.</p>
                            <a href="Login.aspx" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Repair Services</h5>
                            <p class="card-text">Comprehensive repair solutions for engines, transmissions, suspensions, and other critical components.</p>
                            <a href="Login.aspx" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Diagnostics and Inspections</h5>
                            <p class="card-text">Advanced diagnostics to identify and resolve issues quickly, ensuring your vehicle runs smoothly.</p>
                            <a href="Login.aspx" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Custom Services</h5>
                            <p class="card-text">Personalized upgrades and customizations such as wheel alignment, air conditioning service, and performance tuning.</p>
                            <a href="Login.aspx" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>

    <!-- Include jQuery and Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
