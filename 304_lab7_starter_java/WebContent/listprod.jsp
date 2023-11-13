<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery</title>
<style>

header{
    display: flex; 
    position: sticky; 
    text-align: center; 
}
form{
    font-size: 20px; 
}
table, th, td{
    border: .5px solid black; 
    text-align: left; 
    padding-left: 5px; 
    width: 80%;
}
table .links{
    width: 30%; 
}
.table1 tr:nth-child(even) {
    background: #F0F0F0;
}
.header{
    text-align: center; 
    align-items: center; 
}
h1{
    text-align: center;
    align-items: center; 
    color: rgb(255,105,180); 
}
.table1 tr:nth-child(odd) {
    background: #FFF;
}
tr{
   width: 1px;
   word-wrap: break-word;
   padding-left: 0;
   padding-right: 0;
   max-width: 180px;
   min-width: 1px; 
}
.link{
    width: 20px; 
    word-break: break-all;
}
.form .Beverages {
    color: red; 

}
.form .Condiments {
    color: blue; 
}
h4{
    color: red; 
}

</style>
</head>
<body>
<header class = "header">
        <h1><i>SQL Spice & Market: Where Flavor Meets Data</i></h1>
</header>
<hr>

<h2>Browse Products By Category and Search by Product Name:
</h2>
<form method="get" action="listprod.jsp">
<select size = "1" name="categoryName">
    <option value = "All">All</option> 
    <option value = "Beverages" style="color: red;">Beverages</option> 
    <option value = "Condiments" style="color: pink;">Condiments</option> 
    <option value = "Confections" style="color: purple;">Confections</option> 
    <option value = "Dairy Products" style="color: red;">Dairy Products</option> 
    <option value = "Grains/Cereals" style="color: red;">Grains/Cereals</option> 
    <option value = "Meat/Poultry" style="color: red;">Meat/Poultry</option> 
    <option value = "Produce" style="color: red;">Produce</option> 
    <option value = "Seafood" style="color: red;">Seafood</option> 
</select>
<input type="text" name="productName" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>


<% // Get product name to search for
String name = request.getParameter("productName");
String category = request.getParameter("categoryName");

        
//Note: Forces loading of SQL Server driver
try
{   // Load driver class
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
    out.println("ClassNotFoundException: " +e);
}

// Variable name now contains the search string the user entered
// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!

// Make the connection
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa";
String pw = "304#sa#pw";
out.println("<h2>All Products</h2>");
String sql = ""; 
    if(category == null || category.equals("All")) {
        sql = "SELECT productName, productPrice, productId, categoryName FROM product AS P JOIN category AS C ON P.categoryId = C.categoryId WHERE productName LIKE ?"; 
    } else {
        sql = "SELECT P.productName, P.productPrice, P.productId, categoryName FROM product AS P JOIN category AS C ON P.categoryId = C.categoryId WHERE C.categoryName = ? AND P.productName LIKE ?";

    }
try (Connection con = DriverManager.getConnection(url, uid, pw);
    PreparedStatement pstmt = con.prepareStatement(sql);) {
    if(category != null && !category.equals("All")) {
        pstmt.setString(1, category);
        pstmt.setString(2, "%" + name + "%");
    } else {
        pstmt.setString(1, "%" + name + "%");

    }
    ResultSet rst = pstmt.executeQuery();
    NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.US);
    out.println("<table class = 'table1'><tr><th></th><th>Product Name</th><th>Categories</th><th>Price</th></tr>");
        while(rst.next()) {
            String pname = rst.getString(1);
            Double price = rst.getDouble(2); 
            String price2 = currency.format(price);
            Double id = rst.getDouble(3);
            String category1 = rst.getString(4); 
            // out.println("<tr><td>"+rst.getString); 
            String nav = "addcart.jsp?id=" + id + "&name=" + URLEncoder.encode(pname, "UTF-8") + "&price=" + price;
            String link = "<a href='" + nav + "'>Add to Cart</a>";
            out.println("<tr><td><h5 style='width: 100px; margin: 0 auto; text-align: left'>"+ link + "</h5></td><td><h3 style='width: 600px'>" + pname +"</h3></td><td><h4 style='width: 500px'>"+category1+"</h4></td><td><h5>"+ price2 +"</h5></td></tr>");
        }
    rst.close();
} catch (SQLException ex) {
    out.println("SQLException: " + ex.getMessage());
}


// Print out the ResultSet

// For each product create a link of the form
// addcart.jsp?id=productId&name=productName&price=productPrice
// Close connection

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0)); // Prints $5.00
%>
</body>
</html>