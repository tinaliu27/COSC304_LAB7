<!DOCTYPE html>
<html>
        
<head>
        <title>RockPalz</title>
<style>
h1{
        color: rgb(255,105,180); 
}
a {
        display: block; 
        align-items: center; 
        text-decoration: none; 
}

button {
        padding: 0 10px 0 10px; 
        margin-bottom: 20px; 
        background-color: white; 
}
button:hover{
        background-color: rgb(255,105,180); 
        padding: 0 20px 0 20px; 
}
.userinfo {
        display: block;  
        align-items: center; 
}
.userinfo h4, h5 {
        text-align: center; 
}
h3{
        align-items:center; 
        text-align: center; 
}
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

}

#header .header {
    background-color: transparent;
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
    color: white;
    letter-spacing: .4rem; 
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
.background img{
   position: fixed; 
    background-size: cover;
    background-repeat: no-repeat; 
    background-position: center;
    top: 0; 
    left: 0; 
    width: 100%; 
    height: 100%; 
    z-index: -1; 
    object-fit: cover; 
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
.navlist .item a h5{
        padding: 0 auto;
        margin: 0 auto; 
}
.mainrock{
        text-align: center; 
        padding: 0 auto; 
        margin: 0 auto; 
}
.mainrock img{
        height: 250px;
        width: auto;
        padding: 0 auto; 
        margin: 0 auto; 

}

.dosomething {
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
.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
}
.rock-text:hover .overlay {
  opacity: 1;
}
.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
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
#footer {
        display: block; 
        width: 100%;
        height: 21vh;  
        text-align: center; 
        bottom: 0; 
        left: 0; 
        background-color: black; 
        margin: 0 auto;
        padding: 0 auto; 
}
#footer .footer {
        padding; 10px; 
}
.footer .companyinfo {
        display: flex; 

}
body {
    margin: 0;
}

</style>
</head>
<body>
<div class = "page">
        <div class="background">
                <img src="img/wallpaper.png">
        </div>
        <section id = "header">    
                <div class="header container">
                    <div class="entire-bar">
                        <div class="upperleft">
                            <div class="logo">
                                <a href="index.jsp?">
                                    <img src = "img/logo.PNG">
                                </a>
                            </div>
                            <div class = "bigname" align="center">
                                <a href = "index.jsp?"><h1 align="center">RockPalz</h1></a>
                            </div>
                        </div>
                        <div class="navlist">
                                <ul>
                                    <li>
                                        <div class="item">
                                                <a href="listprod.jsp?productName=" align="center">
                                                        <img src="img/cart.png">
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
                                                <div class ="dropdown">
                                                        <button class = "customeractions" align="center" onclick="options()">
                                                                <img src="img/profile.png">
                                                        </button>
                                                         <div class = "options">
                                                          <%
	                                                        String userName = (String) session.getAttribute("authenticatedUser");
	                                                        if (userName != null) {
		                                                        out.println("<h3 align=\"center\">Signed in as: "+userName+"</h3>");
                                                                        out.println("<a href='customer.jsp?productName=' align='center' class='customer'><h2>Check your info</h2></a>");
                                                                        out.println("<a href='logout.jsp?productName=' align='center' class='shopping'><h2>Log Out</h2></a>");
                                                                      } else {
                                                                         out.println("<a href='login.jsp?productName=' align='center' class='shopping'><h2>Log In</h2></a>");
                                                                        out.println("<a href='signup.jsp?' align='center' class='shopping'><h2>Sign Up</h2></a>");
                                                                      }
                                                                      
                                                                      %>    
                                                                </div>                                  
                                                </a>
                                                </div>
                                        </div>
                                    </li>


                                </ul> 
                        </div>
                    </div>
                </div>
            </section>
      <div class="mainrock">
        <img src="img/rockmain.png" >
                <h3 align="center"><i>Your New Best Friend</i></h3>
        </div>  

<div class = "dosomething">
        <div class = "rock">
                <a href="login.jsp?productName=" align="center" class="rock-text">
                        <img src="img/rockmain.png" class="image">
                        <div class="overlay">
                                <div class="text">Login</div>
                        </div>
                </a>
        </div>
         <div class = "rock">
                <a href="listprod.jsp?productName=" align="center" class="rock-text">
                        <img src="img/rockmain.png" class="image">
                           <div class="overlay">
                                <div class="text">Buy Products</div>
                        </div>
                </a>
        </div>
         <div class = "rock">
                <a href="listorder.jsp?productName=" align="center" class="rock-text">
                        <img src="img/rockmain.png" class="image">
                          <div class="overlay">
                                <div class="text">Past Orders</div>
                        </div>
             
                </a>
        </div>
         <div class = "rock">
                <a href="customer.jsp?productName=" align="center" class="rock-text">
                        <img src="img/rockmain.png" class="image">
                           <div class="overlay">
                                <div class="text">Customer Info</div>
                        </div>
                
                </a>
        </div>
         <div class = "rock">
                <a href="admin.jsp?productName=" align="center" class="rock-text">
                        <img src="img/rockmain.png" class="image">
                        <div class="overlay">
                                <div class="text">Admin Features</div>
                        </div>               
                </a>
        </div>
         <div class = "rock">
                <a href="logout.jsp?productName=" align="center" class="rock-text">
                        <img src="img/rockmain.png" class="image">
                           <div class="overlay">
                                <div class="text">Logout</div>
                        </div>
                
                </a>
        </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</head>


