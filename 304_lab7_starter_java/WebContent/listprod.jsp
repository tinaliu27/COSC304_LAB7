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
.header{
    display: flex; 
    position: sticky; 
    text-align: center; 
}
</style>
</head>
<body>
<div class="header container">
    <nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
        <a class="navbar-brand" href="#">WebSiteName</a>
        </div>
        </div>
    </nav>
</div>

<h1>Browse Products By Category and Search by Product Name:
</h1>
<form method="get" action="listprod.jsp">
<select size = "1" name="categoryName">
    <option value = "All">All</option> 
    <option value = "Beverages">Beverages</option> 
    <option value = "Condiments">Condiments</option> 
    <option value = "Confections">Confections</option> 
    <option value = "Dairy Products">Dairy Products</option> 
    <option value = "Grains/Cereals">Grains/Cereals</option> 
    <option value = "Meat/Poulty">Meat/Poultry</option> 
    <option value = "Produce">Produce</option> 
    <option value = "Seafood">Seafood</option> 
</select>
<input type="text" name="productName" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>


<% // Get product name to search for
String name = request.getParameter("productName");
String category = request.getParameter("categoryName");
		
//Note: Forces loading of SQL Server driver
try
{	// Load driver class
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
out.println(category); 
String sql = ""; 
    if(category == null || category.equals("All")) {
        sql = "SELECT productName, productPrice, productId FROM product as P WHERE productName LIKE ?"; 
    } else {
        sql = "SELECT P.productName, P.productPrice, P.productId FROM product AS P JOIN category AS C ON P.categoryId = C.categoryId WHERE C.categoryName = ? AND P.productName LIKE ?";

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
    out.println("<table><tr><th></th><th>Product Name</th><th>Price</th></tr>");
        while(rst.next()) {
            String pname = rst.getString(1);
            Double price = rst.getDouble(2); 
            String price2 = currency.format(price);
            Double id = rst.getDouble(3);
            // out.println("<tr><td>"+rst.getString); 
            String nav = "addcart.jsp?id=" + id + "&name=" + URLEncoder.encode(pname, "UTF-8") + "&price=" + price;
            String link = "<a href='" + nav + "'>Add to Cart</a>";
            out.println("<tr><td>"+ link + "</td><td>" + pname +"</td><td>"+ price2 +"</td></tr>");
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
// out.println(currFormat.format(5.0));	// Prints $5.00
%>
</body>
</html>