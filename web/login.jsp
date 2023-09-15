<%-- 
    Document   : login.jsp
    Created on : 04 23, 23, 5:20:31 PM
    Author     : Benjo
--%>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("accountPage.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tech Hive</title>
        <link href="/TechHive/styles/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    </head>
    <body>

        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="styles/appLogos/comLogo.png" width="125">
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="RetrieveProductsList">Products</a></li>
                        <li><a href="login.jsp">Account</a></li>
                    </ul>
                </nav>
                <a href="CartUpdater"><i class='bx bx-shopping-bag'></i></a>
                <img src="styles/appLogos/menuBut.png"  width="30" class="menu-icon" onclick="menutoggle()">
            </div>
        </div>

        <!------------ login page ----------->
        <div class="account-page">
            <div class="container">
                <div class="row">
                    <div class="col-2">
                        <img src="styles/featuredPics/landingBG.png" width="1000">
                    </div>

                    <div class="col-2">
                        <div class="form-container">
                            <div class="form-btn">
                                <span onclick="login()">Login</span>
                                <span onclick="signup()">Sign Up</span>
                                <hr id="Indicator">
                            </div>

                            <form id="LoginForm" action="LoginServlet" method="post">
                                <h5>Username</h5>
                                <input type="text" placeholder="Username" name="username">
                                <h5>Password</h5>
                                <input type="password" placeholder="Password" name="password">
                                <button type="submit" class="btn">Login</button>
                                <h6 onclick="signup()">Don't have an account yet?</h6>
                            </form>

                            <form id="SignupForm" action="LoginServlet" method="post">
                                <h5>Username</h5>
                                <input type="text" placeholder="Username" name="signupname">
                                <h5>Email</h5>
                                <input type="text" placeholder="Email" name="signupemail">
                                <h5>Password</h5>
                                <input type="password" placeholder="Password" name="signuppassword">
                                <h5>Confirm Password</h5>
                                <input type="password" placeholder="Confirm Password" name="signuppassword2">
                                <button type="submit" class="btn">Register</button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!------------ footer ------------>
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download our App</h3>
                        <p>Download our App for your iOS and Android devices.</p>
                        <div class="app-logo">
                            <img src="styles/storeLogos/apple.png">
                            <img src="styles/storeLogos/google.png">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="styles/appLogos/comLogo2.png">
                        <p>We are thrilled to offer you an extensive selection of 
                            pre-built units, laptops, consoles, and other electronic 
                            devices that are sure to meet your needs.</p>
                    </div>
                    <div class="footer-col-3">
                        <h3>Useful Links</h3>
                        <ul>
                            <li>Coupons</li>
                            <li>Blogs</li>
                            <li>Return Policy</li>
                            <li>Connect with us</li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>Follow Us</h3>
                        <ul>
                            <li>Facebook</li>
                            <li>Twitter</li>
                            <li>Instagram</li>
                            <li>YouTube</li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright 2023 - Tech Hive - Group 11 - 2CSC</p>
            </div>
        </div>


        <!------------ script for toggle menu ------------>
        <script>
            var MenuItems = document.getElementById("MenuItems");
            MenuItems.style.maxHeight = "0px";
            function menutoggle() {
                if (MenuItems.style.maxHeight === "0px")
                {
                    MenuItems.style.maxHeight = "200px";
                } else
                {
                    MenuItems.style.maxHeight = "0px";
                }
            }
        </script>

        <!------------ script for signup ------------>
        <script>
            var LoginForm = document.getElementById("LoginForm");
            var SignupForm = document.getElementById("SignupForm");
            var Indicator = document.getElementById("Indicator");

            function signup() {
                SignupForm.style.transform = "translateX(0px)";
                LoginForm.style.transform = "translateX(0px)";
                Indicator.style.transform = "translateX(100px)";
            }
            function login() {
                SignupForm.style.transform = "translateX(300px)";
                LoginForm.style.transform = "translateX(300px)";
                Indicator.style.transform = "translateX(0px)";
            }

        </script>

    </body>
</html>
