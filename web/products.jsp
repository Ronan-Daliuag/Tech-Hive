<%-- 
    Document   : products
    Created on : 04 23, 23, 5:10:42 PM
    Author     : Benjo
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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


            <div class="small-container">

                <div class="row row-2">
                    <h2>All Products</h2>
                    <form  action="RetrieveProductsList" method="post">
                        <select id="sort" name="sort" onchange='if (this.value != 0) {
                                    this.form.submit();
                                }'>
                            <option value="Lowest Price">Lowest Price</option>
                            <option value="Highest Price">Highest Price</option>
                            <option value="console">Console</option>
                            <option value="peripherals">Peripherals</option>
                            <option value="laptop">Laptops</option>
                            <option value="prebuilt">Prebuilt</option>
                        </select>
                    </form>
                </div>
                <div class="row">

                    <%
                        ResultSet rs = (ResultSet) request.getAttribute("results");
                        while (rs.next()) {

                    %>

                    <div class="col-4">
                        <img src="<%=rs.getString("img")%> ">
                        <h4><%=rs.getString("prod_name")%></h4>
                        <%if (session.getAttribute("user") != null) {%>

                        <form action="AddtoCart">
                            <input type="number" name="quantity" required>
                            <input type="hidden" name="prodid" value="<%=rs.getString("prod_id")%>">
                            <input type="submit" value="Add to Cart">
                        </form>
                        <%}%>
                        <!---<p><strike>$2,449.99</strike> $2,150.00</p>-->
                        <p>₱<%=rs.getString("price")%></p>

                    </div>
                    <% }%>




                </div>   
                <div class="page-btn">
                    <span>1</span>
                    <span>2</span>
                    <span>3</span>
                    <span>4</span>
                    <span>&#8594;</span>
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
                if (MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "200px"
                } else
                {
                    MenuItems.style.maxHeight = "0px"
                }
            }
            if ('${param.sort}' === "") {
                document.getElementById('sort').value = "Lowest Price";
            } else {
                document.getElementById('sort').value = '${param.sort}';
            }
        </script>

    </body>
</html>