<!DOCTYPE html>
<html>
<head>
<title>Create Account</title>
</head>
<body>
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
a {
  text-decoration: none;
}
body {
    background:  url("img/wallpaper.png");
    background-repeat: no-repeat;
    position: relative; 
    background-size: cover;
    background-position: center;
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
  margin: 6rem auto 8.1rem auto;
  width: 65%;
}
#card-content {
  padding: 12px 44px;
}
#card-title {
  font-family: "Raleway Thin", sans-serif;
  letter-spacing: 4px;
  padding-bottom: 23px;
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
.main-content {
    display: flex;
    justify-content: space-around; /* Adjust the space between the columns */
    margin: 20px auto; /* Adjust the margin as needed */
}
</style>
<%@ include file="headertransparent.jsp" %>
<%@ include file="jdbc.jsp" %>
<div class="main-content">
<div id="card">
    <div id="card-content">
      <div id="card-title">
        <h2>SIGN UP</h2>
        <div class="underline-title"></div>
      </div>
      <form method="post" class="form" name="MyForm" action="validateSignup.jsp">
	  <table style="display:inline">
        <%-- Username --%>
        <label for="username" style="padding-top:13px" class="title">
            Username
          </label>
        <input id="username" class="form-content" type="text" name="username" maxlength="10" required />
        <div class="form-border"></div>
        
        <%-- Password --%>
        <label for="user-password" style="padding-top:22px" class="title">Password
          </label>
        <input id="user-password" class="form-content" type="password" name="password" maxlength="10" required />
        <div class="form-border"></div>
        
        <%-- Confirm Password --%>
        <label for="user-confirmation" style="padding-top:22px" class="title">Confirm Password</label>
        <input id="user-confirmation" class="form-content" type="text" name="confirmation" maxlength="10" required />
        <div class="form-border"></div>
        
        <%-- First Name --%>
        <label for="user-fname" style="padding-top:22px" class="title">First Name</label>
        <input id="user-fname" class="form-content" type="text" name="fname" maxlength="10" required />
        <div class="form-border"></div>
		
        <%-- Last Name --%>
        <label for="user-lname" style="padding-top:22px" class="title">Last Name</label>
        <input id="user-lname" class="form-content" type="text" name="lname" maxlength="10" required />
        <div class="form-border"></div>

        <%-- Email --%>
        <label for="user-email" style="padding-top:22px" class="title">Email</label>
        <input id="user-email" class="form-content" type="text" name="email" required />
        <div class="form-border"></div>

        <%-- Phone Number --%>
        <label for="user-phonenumber" style="padding-top:22px" class="title">Phone Number</label>
        <input id="user-phonenumber" class="form-content" type="text" name="email" required />
        <div class="form-border"></div>

        <%-- Address --%>
        <label for="user-address" style="padding-top:22px" class="title">Address</label>
        <input id="user-address" class="form-content" type="text" name="email" required />
        <div class="form-border"></div>
        
        <%-- City --%>
        <label for="user-address" style="padding-top:22px" class="title">Address</label>
        <input id="user-address" class="form-content" type="text" name="email" required />
        <div class="form-border"></div>

        <%-- State --%>
        <label for="user-address" style="padding-top:22px" class="title">State</label>
        <input id="user-address" class="form-content" type="text" name="email" required />
        <div class="form-border"></div>
        
         <%-- Postal Code --%>
        <label for="user-address" style="padding-top:22px" class="title">Postal Code</label>
        <input id="user-address" class="form-content" type="text" name="email" required />
        <div class="form-border"></div>
        
        <%-- Country --%>
        <label for="user-address" style="padding-top:22px" class="title">Postal Code</label>
        <input id="user-address" class="form-content" type="text" name="email" required />
        <div class="form-border"></div>

        <input class="submit" type="submit" name="Submit2" value="SIGN UP" id="submit-btn" >
		</form>
    
  </div>
</div>
</div>
<%
    String signupMessage = (String) session.getAttribute("signupMessage");
    session.removeAttribute("signupMessage"); // remove the attribute after retrieving it
%>

<% if (signupMessage != null) { %>
    <p><%= signupMessage %></p>
<% } %>

</div>

</body>
</html>


