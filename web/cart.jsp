<%-- 
    Document   : cart
    Created on : 04 28, 23, 7:16:40 AM
    Author     : Benjo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }

    if (session.getAttribute("cartContents") == null) {
        response.sendRedirect("CartUpdater");
    }
%>
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

        <!------------ cart page ----------->
        <div class="small-container cart page">

            <a href="javascript:history.back()" class="btn"> Back</a>
            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>

                <%
                    int total = 0;
                    Connection conn = (Connection) session.getAttribute("connection");
                    ResultSet rs = (ResultSet) session.getAttribute("cartContents");
                    String productId;

                    while (rs.next()) {

                        productId = rs.getString("prod_id");
                        String query = "SELECT * FROM product where prod_id = ?";

                        PreparedStatement ps = conn.prepareStatement(query);
                        ps.setString(1, productId);

                        ResultSet prod = ps.executeQuery();

                        prod.next();
                        String name = prod.getString("prod_name");
                        int price = prod.getInt("price");
                        int quantity = rs.getInt("quantity");
                        int subtotal = quantity * price;
                        total += subtotal;

                %>

                <tr>
                    <td>
                        <div class="cart-info">
                            <img src="<%=prod.getString("img")%>" height="120" width="120">
                            <div>
                                <p><%=name%></p>
                                <small>Price: <%=price%></small>
                                <br>
                                <form action="RemoveServlet">
                                    <input type="hidden" name="name" value="<%=productId%>">
                                    <input type="submit" value="Remove" style="width: 60px">
                                </form>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="cart-info">
                            <form action="UpdateServlet">
                                <input type="hidden" name="product" value="<%=productId%>">
                                <input type="number" name="number" required placeholder="<%=quantity%>">
                                <input type="submit" value="Update" style="width: 60px">
                            </form>
                        </div>
                    </td>
                    <td><%=subtotal%></td>
                </tr>
                <%

                    }

                %>

            </table>

            <div class="total-price">
                <table>

                    <tr>
                        <td>Total: </td>
                        <td><%=total%></td>
                    </tr>
                </table>
            </div>
            <div class="checkout-container">
                <form action="CheckoutServlet">
                    <input type="submit" class="btn checkout-btn" value="Checkout &#8594;">
                </form>
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