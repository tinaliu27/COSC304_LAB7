<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery</title>
</head>
<body>

<h1>Search for the products you want to buy:</h1>

<form method="get" action="listprod.jsp">
<input type="text" name="productName" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>

<% // Get product name to search for
String name = request.getParameter("productName");
		
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

try ( Connection con = DriverManager.getConnection(url, uid, pw);
	Statement stmt = con.createStatement();)
	  {	
		String sql = "SELECT productName, productPrice, productId FROM product";
		ResultSet rst = stmt.executeQuery(sql);
		NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.US);
		out.println("<table><tr><th></th><th>Product Name</th><th>Price</th></tr>");
		while(rst.next()) {
			String pname = rst.getString(1);
			Double price = rst.getDouble(2); 
			String price2 = currency.format(price);
			Double id = rst.getDouble(3);
			String nav = "http://localhost/shop/" + "addcart.jsp?id=" + id + "&name=" + pname + "&price=" + price;
			String link = "<a href=" + nav + ">Add to Cart</a>";
			out.println("<tr><td>"+ link + "</td>"+ "<td>" + pname +"</td>" + "<td>"+ price2 +"</td></tr>");

		}
		rst.close();
		stmt.close();
		con.close(); 
	  } catch (SQLException ex) {
		out.println("SQLException: " + ex);
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