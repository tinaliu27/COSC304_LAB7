<!DOCTYPE html>
<html>
<head>
<title>Login Screen</title>
</head>
<body>
<style>
a {
  text-decoration: none;
}
body {
  background:  url("img/wallpaper.png");
  background-repeat: no-repeat;
  background-size: cover; 
}

#header .header {
    background-color: transparent;
    min-height: 8vh; 
    width: 100%;
 
}
label {
  font-family: "Raleway", sans-serif;
  font-size: 11pt;
}
#forgot-pass {
  color: #2dbd6e;
  font-family: "Raleway", sans-serif;
  font-size: 10pt;
  margin-top: 3px;
  text-align: right;
}
#card {
  background: #fbfbfb;
  border-radius: 8px;
  box-shadow: 1px 2px 8px rgba(0, 0, 0, 0.65);
  height: fit-content;
  margin: 1.4rem auto 8.1rem auto;
  width: 400px;
}
#card-content {
  padding: 12px 44px;
}
#card-title {
  font-family: "Raleway Thin", sans-serif;
  letter-spacing: 4px;
  padding-top: 13px;
  text-align: center;
}
#signup {
  color: #2dbd6e;
  font-family: "Raleway", sans-serif;
  font-size: 10pt;
  margin-top: 16px;
  text-align: center;
}
#submit-btn {
  background: -webkit-linear-gradient(right, #a6f77b, #2dbd6e);
  border: none;
  border-radius: 21px;
  box-shadow: 0px 1px 8px #24c64f;
  cursor: pointer;
  color: white;
  font-family: "Raleway SemiBold", sans-serif;
  height: 42.3px;
  margin: 0 auto;
  margin-top: 50px;
  transition: 0.25s;
  width: 153px;
}
#submit-btn:hover {
  box-shadow: 0px 1px 18px #24c64f;
}
.form {
  align-items: left;
  display: flex;
  flex-direction: column;
}
.form-border {
  background: -webkit-linear-gradient(right, #a6f77b, #2ec06f);
  height: 1px;
  width: 100%;
}
.form-content {
  background: #fbfbfb;
  border: none;
  outline: none;
  padding-top: 14px;
}
.underline-title {
  background: -webkit-linear-gradient(right, #a6f77b, #2ec06f);
  height: 2px;
  margin: -1.1rem auto 0 auto;
  width: 89px;
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
    display: flex;
    margin: 0 auto;  

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
.customeractions img{
	background-color: transparent; 
}
#card-title p {
  width: 100%; 
  height: 100%; 
  text-align: center;
  display: flex; 
  align-items: center; 
  font-size: 15px; 
  color: red; 
}

</style>
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

<div id="card">
    <div id="card-content">
      <div id="card-title">
        <h2>LOGIN</h2>
        <div class="underline-title"></div>
        <%
          // Print prior error login message if present
          if (session.getAttribute("loginMessage") != null)
            out.println("<p>"+session.getAttribute("loginMessage").toString()+"</p>");
        %>
      </div>
      <form method="post" class="form" name="MyForm" action="validateLogin.jsp">
	  <table style="display:inline">
        <label for="user-email" style="padding-top:13px" class="title">
            <b>Username</b>
          </label>
        <input id="user-email" class="form-content" type="text" name="username" maxlength="10" required />
        <div class="form-border"></div>
        <label for="user-password" style="padding-top:22px" class="title"><b>Password</b>
          </label>
        <input id="user-password" class="form-content" type="password" name="password" required />
        <div class="form-border"></div>
		<input class="submit" type="submit" name="Submit2" value="LOGIN" id="submit-btn" >
		<%
		// Add a signup redirect
		out.println("<p align='center'><a href=\"signup.jsp\">Sign Up</a></p>");
		%>      
		</form>
    </div>
  </div>
</div>


</body>
</html>


