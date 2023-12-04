<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<style>
body{
    background: url("img/textured.png");
    background-size: cover; 
    background-repeat: no-repeat; 
    text-align: center; 
    align-items: center;
    margin-top: 100px; 
}
p{
    font-size: 25px;
}
.submit{
 background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
}

.form{
    display: flex; 
    flex-wrap: wrap;
    margin: 0 auto;

}
.form-container{
    display: flex; 
    margin: 0 auto;
}
.form-container .item{
    flex: 1;
    display: inline-block; 
    align-items: center;
    text-align: left; 
    justify-content: space-evenly;
    padding: 20px; 
    padding-top: 0px;
    margin: 20px; 
    vertical-align:top;
    background-color: white;
    box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.5);
}
.form-container .item h2{
    font-size: 1.3em; 
    color: #6d6e70;
}
.form-container .item p{
    
}
</style>
   <%@ include file="headertransparent.jsp" %>

    <hr>
</head>
<body>
<div class = "form">
<div class = "form-container">
    <form method="get" action="order.jsp">
    <div class= "item">
        <div class = "signin">
            <h2> 1. Enter your customer id and <br>password to complete the transaction:</h2>
            <p>Customer ID: <br><input type="text" name="customerId" size="30" required></p>
            <p>Password:  <br><input type="password" name="customerPassword" size="30" required></p>
        </div>
    </div>
    <div class= "item">
        <div class = "shipping">
            <h2>2. Enter your shipping address:</h2>
            <p>Street: <br><input type="text" name="street" size="40"></p>
            <p>City:   <br><input type="text" name="city" size="40"></p>
            <p>State:  <br><input type="text" name="state" size="40"></p>
            <p>Zip:    <br><input type="text" name="zip" size="40"></p>
        </div>
    </div>
    <div class= "item">
        <div class = "credit-card">
            <h2>3. Enter your credit card information:</h2>
            <p>Card Number: <br><input type="text" name="cardNumber" size="40" required></p>
            <p>Expiration Date: <br><input type="text" name="expirationDate" size="40" required></p>
            <p>Security Code: <br><input type="text" name="securityCode" size="40" required></p>
            <input type="submit" name="submit" value="Complete Order" class="submit">
            <input type="reset" value="Reset" class="reset">
        </div>
    </div>
    </form>
</div>
</div>
</body>
</html>

