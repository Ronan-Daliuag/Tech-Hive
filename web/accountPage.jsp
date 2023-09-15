<%-- 
    Document   : accountPage
    Created on : 05 16, 23, 3:55:55 PM
    Author     : Benjo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account</title>
        <link href="/TechHive/styles/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <style>
            .logout-container {
                margin-top: 20px;
                text-align: center;
                width: 100%;
            }
            .logout-btn{
                background: #777;
            }
            .logout-btn:hover{
                background:#1b1b32;
            }
            .profile-container {
                height: 100%;
                margin-top: 10px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .profile-label {
                text-align: left;
                padding-top: 50px;
                width: 80%;
                margin: 0px auto 10px auto;
                border-bottom: 4px solid #1b1b32;
            }

            .shop-profile {
                width: 80%;
                margin: 0px auto 10px auto;
                text-align: left;
                font-size: 14px;
                border-bottom: 1px solid #dfdfe2;
            }

            .shop-profile > label {
                display: inline-block;
                font-weight: bold;
                width: 23%;
            }

            .shop-profile > p {
                display: inline-block;
            }
        </style>
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
        
        <!------------ account page ----------->
        <section class="profile-container">
                <div class="profile-label">
                    <h2 class="animate">CUSTOMER PROFILE</h2>
                </div>
                <div class="shop-profile">
                    <label>Email</label>
                    <p><%=session.getAttribute("email")%></p>
                </div>
                <div class="shop-profile">
                    <label>Username</label>
                    <p><%=session.getAttribute("user")%></p>
                </div>
                <div class="shop-profile">
                    <label>Passcode</label>
                    <p><%=session.getAttribute("pass")%></p>
                </div>
        </section>
        <div class="logout-container" align="center">
            
            <a href="LogoutServlet" class="btn logout-btn">Logout</a>
            
        </div>
        <br>
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
            function menutoggle(){
                if(MenuItems.style.maxHeight === "0px")
                {
                    MenuItems.style.maxHeight = "200px";
                }
                else
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
            
            function signup(){
                SignupForm.style.transform = "translateX(0px)";
                LoginForm.style.transform = "translateX(0px)";
                Indicator.style.transform = "translateX(100px)";
            }
            function login(){
                SignupForm.style.transform = "translateX(300px)";
                LoginForm.style.transform = "translateX(300px)";
                Indicator.style.transform = "translateX(0px)";
            }
            
        </script>
        
    </body>
</html>
