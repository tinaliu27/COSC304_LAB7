<style>
#header {
    display: flex; 
    position: sticky;
    background-color: transparent; 
    left: 0; 
    top: 0; 
    z-index: 9999;
    width: 100%;
    height: auto;  
    text-align: center; 
    display: flex;
    margin: 0 auto;  
    transition: 0.6s;
    transition: background-color 0.4s ease-in-out; 
}

#header .header {
    background-color: white;
    min-height: 8vh; 
    width: 100%;
 
}

#header .entire-bar{
    display: flex; 
    align-items: center; 
    justify-content: space-between; 
    width: 100%; 
    height: 100%; 
    padding: 0 12px;
}
#header .entire-bar .upperleft{
    padding: 2px; 
    padding-left: 20px;
    display: flex;
    justify-content: center; 
    text-align: center; 
    align-items: center; 
}
#header .entire-bar .logo img{
    height: 90px;
    width: 90px; 
    top: 0; 
    left: 0; 
    margin: 0 auto; 
}
#header .bigname h1{
    display: flex; 
    text-transform: uppercase;
    font-size: 2rem; 
    color: black;
    letter-spacing: .4rem; 
}
.bigname a{
    text-decoration: none;
}

#header .navlist {
    padding: 0 27px; 
    text-align: center; 
    justify-content: center; 
}
#header .navlist ul{
    list-style-type: none; 
    background-color: transparent; 
    opacity: 1;
    width: fit-content; 
    height: auto; 
    right: 100%;
    top: 0; 
    display: flex;
    justify-content: center; 
    align-items: center; 
    z-index: 1; 
    transition: .5s ease left;
    margin: 0;
    padding: 0;
}
#header .navlist ul li{
        margin: 0 10px 0 10px ; 
}
.navlist .item {
        text-align: center; 
        text-decoration: none;
        align-items: center; 
}
.navlist .item .user img {
        display: inline-block; 

}
.navlist .item a img{
    height: 50px;
    width: 50px; 
    top: 0; 
    right: 0; 
    margin: 0 auto;
}

.dropdown {
        position: relative;
        display: inline-block;
}
.dropdown .options {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  padding: 0 20px; 
}
.dropdown .options a{ 
        text-decoration: none;
}
.dropdown:hover .options {
  display: block;
}

.dosomething {
        padding-top: 10px; 
        text-align: center; 
        align-items: center;  
}
.dosomething .rock {
        display: inline-block; 
        margin: 25px; 
}
.dosomething .rock img {
        width: 125px; 
        height: 125px; 
        display: block;
}
.item button{
        background-color: transparent; 
        border: none; 
        padding: 0 auto;
        margin: 0 auto; 
}

.dosomething .rock:hover img{
        filter: brightness(50%);
}
.dosomething .rock .text{ 
        align-items: center; 
}
.dosomething .rock-text{
        position: relative; 
}
.dosomething .rock-text .image{
        display: block;
        height: auto;
}
.dropdown img{
        height: 50px; 
        width: 50px; 
}
#header.scrolled{ 
    background-color: #FFFFFF; 
}
</style>
<html>
<section id="header">
    <div class="header container">
        <div class="entire-bar">
            <div class="upperleft">
                <div class="logo">
                    <a href="index.jsp?">
                        <img src="img/logo.PNG">
                    </a>
                </div>
                <div class="bigname" align="center">
                    <a href="index.jsp?">
                        <h1 align="center">RockPalz</h1>
                    </a>
                </div>
            </div>
            <div class="navlist">
                <ul>
                    <li>
                        <div class="item">
                            <a href="addingreview.jsp?" align="center">
                                <img src="img/review.png">
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <a href="listprod.jsp?productName=" align="center">
                                <img src="img/shopping-cart.png">
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <a href="listorder.jsp?productName=" align="center">
                                <img src="img/orders.png">
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div class="dropdown">
                                <button class="customeractions" align="center" onclick="options()">
                                    <img src="img/user.png">
                                </button>
                                <div class="options">
                                    <% 
                                        String userName = (String) session.getAttribute("authenticatedUser");
                                        if (userName != null) {
                                            out.println("<h3 align=\"center\">Signed in as: " + userName + "</h3>");
                                            out.println("<a href='customer.jsp?productName=' align='center' class='customer'><h2>Check your info</h2></a>");
                                            out.println("<a href='logout.jsp?productName=' align='center' class='shopping'><h2>Log Out</h2></a>");
                                        } else {
                                            out.println("<a href='login.jsp?productName=' align='center' class='shopping'><h2>Log In</h2></a>");
                                            out.println("<a href='signup.jsp?' align='center' class='shopping'><h2>Sign Up</h2></a>");
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
</html> 


