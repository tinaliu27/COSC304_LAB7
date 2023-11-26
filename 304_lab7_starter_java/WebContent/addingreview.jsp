<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
<title>Review</title>
<style>

</style>
</head>
<body>
<%

    %>
    <form method="get" action="review.jsp">
        <select size = "1" name="productName">
            <option value = "The Rock (Dwayne Johnson)">The Rock (Dwayne Johnson)</option> 
            <option value = "The Classic" style="color: red;">The Classic</option> 
            <option value = "The Bowtie" style="color: pink;">The Bowtie</option> 
            <option value = "The Garfield" style="color: purple;">The Garfield</option> 
            <option value = "The Abraham Lincoln" style="color: red;">The Abraham Lincoln</option> 
            <option value = "The Harry Potter" style="color: red;">The Harry Potter</option> 
            <option value = "The Santa" style="color: red;">The Santa</option> 
            <option value = "The Mickey Mouse" style="color: red;">The Mickey Mouse</option> 
            <option value = "The Panda" style="color: red;">The Panda</option> 
        </select>
    <p>Customer ID: <br><input type="text" name="customerId" size="40"></p>
    <p>Rating (out of 5): <br><input type="text" name="rating" size="40"></p>
    <p>Review: <br><input type="text" name="review" size="40"></p>
    <input type="submit" name="submit" value="Submit" class="submit">
    <input type="reset" value="Reset" class="reset">
    
</form>
</body>
</html>

