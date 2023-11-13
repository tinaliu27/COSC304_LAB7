<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<style>
.header{
    text-align: center; 
    align-items: center; 
}
h1{
    text-align: center;
    align-items: center; 
    color: rgb(255,105,180); 
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
.submit:hover{
    background-color: #357a38;
}
.reset{
            background-color: #f44336; /* Red */
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px; 
}
.reset:hover{ 
    background-color: #d2190b; /* Red */

}
</style>
    <header class = "header">
        <h1><i>SQL Spice & Market: Where Flavor Meets Data</i></h1>
    </header>
    <hr>
<h2>Enter your customer id and password to complete the transaction:</h2>
</head>
<body>

<form method="get" action="order.jsp">
<p>Customer ID: <input type="text" name="customerId" size="40"></p>
<p>Password:   <input type="password" name="customerPassword" size="40"></p>
<input type="submit" name="submit" value="Submit" class="submit">
<input type="reset" value="Reset" class="reset">
</form>

</body>
</html>

