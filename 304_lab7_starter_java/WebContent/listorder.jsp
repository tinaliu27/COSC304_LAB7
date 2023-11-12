<%@ page import="java.sql.*, java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery Order List</title>
<style>

table, th, td {
  		border: 2px solid black;
		text-align: left;
		padding-left: 5px; 
	}
h1{ 
	color: 	black;
}
h2{
	color: 	rgb(255,20,147);
	font-size: 16px;
	padding: 5px; 
}
h3{
	color: 	rgb(255,105,180);
	font-size: 14px; 
	padding-left: 5px; 
}
h4 { 
    padding: 5px;
    margin: 5px 5px; 
    background-color:rgb(65,105,225);
	text-align: center; 
	color: white; 
}	
table {
    border-collapse: collapse;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
table td{
	padding: 7px 7px; 
}
.table1{
	align-items: center; 
	width: 90%; 
	margin: 0 auto; 
}
.person{ 
	background-color: rgb(255,105,180);
}
.table2{
	width: 100%; 
	padding-left: 5px; 

}
	</style> 
</head>
<body>
<h1>SQL Spice & Market: Where Flavor Meets Data</h1>
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
NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.US);


try ( Connection con = DriverManager.getConnection(url, uid, pw);

	Statement stmt = con.createStatement();)
	  {
	// first select 
	PreparedStatement pstmt = con.prepareStatement("SELECT productId, quantity, price FROM orderproduct WHERE orderId = ?");
	String sql = "SELECT O.orderId, O.orderDate, C.customerId, C.firstName, C.lastname, O.totalAmount FROM ordersummary as O INNER JOIN customer as C ON O.customerId = C.customerId";
	ResultSet rst = stmt.executeQuery(sql); 
	// second select 
	out.println("<table class = 'table1'><tr><th><h2>Order Id</h2></th><th><h2>Order Date</h2></th><th><h2>Customer Id</h2></th><th><h2>Customer Name</h2></th><th><h2>Total Amount</h2></th></tr>");
	while(rst.next()) {
		int orderid = rst.getInt(1); 
		out.println("<tr class = 'person'><td>" + orderid +"</td><td>"+ rst.getString(2)+"</td><td>"+rst.getInt(3)+"</td>"+"<td>"+rst.getString(4)+" "+rst.getString(5)+"</td><td>$"+rst.getString(6)+"</td></tr>");
		pstmt.setInt(1, orderid); 
		ResultSet rst2 = pstmt.executeQuery(); 
		int count = 0; 
		double total = 0; 
		int quantitytotal = 0; 
		if(rst2.next()) {
			out.println("<tr align='center'><td colspan='5'><table class='table2'><th><h3>Product Id</h3></th><th><h3>Quantity</h3></th><th><h3>Price</h3></th></td></tr>");
			do {
					String value = rst2.getString(3); 
					int quantity = rst2.getInt(2); 
					out.println("<tr><td>" + rst2.getInt(1)+"</td><td>"+ rst2.getInt(2)+"</td><td>$"+rst2.getString(3)+"</td></tr>");
					quantitytotal += quantity; 
					total+=(quantity*Double.parseDouble(value)); 
			} while (rst2.next()); 
		}
		String total2 = currency.format(total);

		out.println("<tr><td><h4>Total:</h4></td><td>"+quantitytotal+"</td><td>"+total2+"</td></tr>");
		total = 0;


	}	

	out.println("</table>");

	out.println("</table>");

	rst.close();
	stmt.close();
	con.close(); 
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

