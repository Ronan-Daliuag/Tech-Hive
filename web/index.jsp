<%-- 
    Document   : index
    Created on : 04 22, 23, 2:19:40 PM
    Author     : Benjo
--%>

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
        <div class="header">        
            <div class="container">
                <div class="navbar">
                    <div class="logo">
                        <img src="styles/appLogos/comLogo.png" width="125">
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a href="">Home</a></li>
                            <li><a href="RetrieveProductsList">Products</a></li>
                            <li><a href="login.jsp">Account</a></li>
                        </ul>
                    </nav>
                    <a href="CartUpdater"><i class='bx bx-shopping-bag'></i></a>
                    <img src="styles/appLogos/menuBut.png"  width="30" class="menu-icon" onclick="menutoggle()">
                </div>
                
                <div class="row">
                    <div class="col-2">
                        <h1>Your go-to destination <br>for all things tech!</h1>
                            <p>We are thrilled to offer you an extensive selection of 
                            pre-built units, laptops, consoles, and other electronic 
                            devices that are sure to meet your needs.</p>
                        <a href="RetrieveProductsList" class="btn">Shop Now &#8594;</a>
                    </div>
                    <div class="col-2">
                        <img src="styles/featuredPics/landingBG.png">
                    </div>
                </div>
            </div>
        </div>
        
        <!------------ display ------------>
        <div class="promos">
            <div class="small-container">
                <div>
                    <div class="col-5">
                        <img src="styles/featuredPics/sumDeal.png">
                    </div>
                    <a href="RetrieveProductsList" class="btn">Check it out! &#8594;</a>
                </div>
            </div>
        </div>
        
        <!------------ featured ------------>
        <div class="small-container">
            <h2 class="title">Featured Promos</h2>
            <div class="row">
                <div class="col-4">
                    <img src="styles/featuredPromos/fpromo1.png">
                    <h4>OptiPlex 7000 Small Form Factor</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p><strike>$1,684.99</strike> $1,099.00</p>
                </div>
                <div class="col-4">
                    <img src="styles/featuredPromos/fpromo2.png">
                    <h4>The Legend of Zelda: Tears of the Kingdom</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <p><strike>£59.99</strike> £44.99</p>
                </div>
                <div class="col-4">
                    <img src="styles/featuredPromos/fpromo1.png">
                    <h4>OptiPlex 7000 Small Form Factor</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>$1,684.99</p>
                </div>
                <div class="col-4">
                    <img src="styles/featuredPromos/fpromo1.png">
                    <h4>OptiPlex 7000 Small Form Factor</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$1,684.99</p>
                </div>
            </div>
        </div>
        
        <!------------ offer ------------>
        <div class="offer">
            <div class="small-container">
                <div class="row">
                    <div class="col-2">
                        <img src="styles/featuredPics/catto.png" class="offer-img">
                    </div>
                    <div class="col-2">
                        <p>Exclusively Available on Tech Hive</p>
                        <h1>Grumpy Cat</h1>
                        <small>
                            Grumpy Cat is here to make your month a little brighter 
                            with his monthly deals and exclusive offers! Despite 
                            his grumpy demeanor, he's actually quite eager to offer 
                            you the best deals around. Each month, he'll scour the 
                            web for the best discounts and promotions, and bring 
                            them straight to you. <br><br>
                            From special offers on products and services to exclusive 
                            deals on events and experiences, Grumpy Cat has got you 
                            covered. Whether you're looking to save money on your 
                            next shopping spree or want to try something new without 
                            breaking the bank, Grumpy Cat is the feline friend you need.<br><br>

                            So keep an eye out for Grumpy Cat's monthly offers, and 
                            be sure to take advantage of them while you can. After 
                            all, with deals this good, even Grumpy Cat might crack a smile.<br></small>
                        <a href="RetrieveProductsList" class="btn">Have a Look! &#8594;</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!------------ testimonials ------------>
        <div class="testimonial">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing 
                            elit, sed do eiusmod tempor incididunt ut labore et 
                            dolore magna aliqua. Ut enim ad minim veniam, quis 
                            nostrud exercitation ullamco laboris nisi ut aliquip
                            ex ea commodo consequat.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <img src="styles/testimonials/test1.png">
                        <h3>Charles White</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing 
                            elit, sed do eiusmod tempor incididunt ut labore et 
                            dolore magna aliqua. Ut enim ad minim veniam, quis 
                            nostrud exercitation ullamco laboris nisi ut aliquip
                            ex ea commodo consequat.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <img src="styles/testimonials/test2.png">
                        <h3>Tarik Celik</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing 
                            elit, sed do eiusmod tempor incididunt ut labore et 
                            dolore magna aliqua. Ut enim ad minim veniam, quis 
                            nostrud exercitation ullamco laboris nisi ut aliquip
                            ex ea commodo consequat.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <img src="styles/testimonials/test3.png">
                        <h3>Jeremy Wang</h3>
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
        
    </body>
</html>
