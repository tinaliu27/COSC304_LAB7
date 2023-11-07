<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery Order List</title>
</head>
<body>

<h1>Order List</h1>

<%
//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0));  // Prints $5.00

// Make connection

String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa";
String pw = "304#sa#pw";

try ( Connection con = DriverManager.getConnection(url, uid, pw);

	Statement stmt = con.createStatement();)
	  {
	// first select 
	String sql = "SELECT O.orderId, O.orderDate, C.customerId, C.firstName, C.lastname, O.totalAmount FROM ordersummary as O INNER JOIN customer as C ON O.customerId = C.customerId";
	ResultSet rst = stmt.executeQuery(sql); 
	// second select 
	//String sql2 = "SELECT OP.productId, OP.quantity, OP.price FROM orderproduct as OP WHERE OP.productId (SELECT productId FROM customer)";
	// ResultSet rst2 = stmt.executeQuery(sql2); 
	out.println("<table><tr><th>Order Id</th><th>Order Date</th><th>Customer Id</th><th>Customer Name</th><th>Total Amount</th></tr>");
	while(rst.next()) {
		out.println("<tr><td>" + rst.getInt(1)+"</td><td>"+ rst.getString(2)+"</td><td>"+rst.getInt(3)+"</td>"+"<td>"+rst.getString(4)+" "+rst.getString(5)+"</td>"+"<td>"+"$"+rst.getString(6)+"</td>"+"</tr>");
		// out.println("<tr><td>"+ rst2.getInt(1)+"</td>"+"</tr>");
	}
	out.println("</table>");
	rst.close();
	
} catch (SQLException ex) {
	out.println("SQLException: " + ex);
}
// Write query to retrieve all order summary records

// For each order in the ResultSet

	// Print out the order summary information
	// Write a query to retrieve the products in the order
	//   - Use a PreparedStatement as will repeat this query many times
	// For each product in the order
		// Write out product information 

// Close connection
%>

</body>
</html>

