<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<style>
body{
    background: url("img/textured.png");
    position: absolute; 
    background-size: cover;
    background-repeat: repeat; 
    top: 0; 
    left: 0;  
    z-index: -1; 
    object-fit: cover; 
}
</style>
<body>
<%@ include file="headertransparent.jsp" %>
<%@ include file="auth.jsp" %>
<%@ include file="jdbc.jsp" %>
<h3>Administrator Sales Report by Day</h3>
<%
String sql = "SELECT CAST(orderDate AS DATE) as OrderDate, SUM(totalAmount) as TotalOrderAmount FROM ordersummary GROUP BY CAST(orderDate AS DATE) ORDER BY OrderDate;";
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa";
String pw = "304#sa#pw";
try ( Connection con = DriverManager.getConnection(url, uid, pw);
	Statement stmt = con.createStatement();){
	PreparedStatement pstmt = con.prepareStatement("SELECT customerId, firstName, lastName, email, phoneNum, address, city, state, postalCode, country, userid FROM customer WHERE userid = ?;");
	ResultSet rst = stmt.executeQuery(sql); 
    out.println("<table class='table' border='1'><tr><th>Order Date</th><th>Total Order Amount</th>");
	while (rst.next()){
        out.println("<tr><td>" + rst.getString(1) + "</td><td>" + rst.getString(2) + "</td></tr>");
    }
    out.println("</table>");
	rst.close();
	stmt.close();
	con.close(); 
} catch (SQLException ex) {
	out.println("SQLException: " + ex);
}

//Show the Administrator Sales Report by Day with a graph
out.println("<h3>Administrator Sales Report by Day with Graph</h3>");
out.println("<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>");
out.println("<script type='text/javascript'>");
out.println("google.charts.load('current', {'packages':['corechart']});");
out.println("google.charts.setOnLoadCallback(drawChart);");
out.println("function drawChart() {");
out.println("var data = google.visualization.arrayToDataTable([");
out.println("['Order Date', 'Total Order Amount'],");
try ( Connection con = DriverManager.getConnection(url, uid, pw);
	Statement stmt = con.createStatement();){
	PreparedStatement pstmt = con.prepareStatement("SELECT CAST(orderDate AS DATE) as OrderDate, SUM(totalAmount) as TotalOrderAmount FROM ordersummary GROUP BY CAST(orderDate AS DATE) ORDER BY OrderDate;");
	ResultSet rst = stmt.executeQuery("SELECT CAST(orderDate AS DATE) as OrderDate, SUM(totalAmount) as TotalOrderAmount FROM ordersummary GROUP BY CAST(orderDate AS DATE) ORDER BY OrderDate;"); 
	while (rst.next()){
		out.println("['" + rst.getString(1) + "'," + rst.getString(2) + "],");
	}
	rst.close();
	stmt.close();
	con.close(); 
} catch (SQLException ex) {
	out.println("SQLException: " + ex);
}
out.println("]);");
out.println("var options = {");
out.println("title: 'Sales Report by Day',");
out.println("curveType: 'function',");
out.println("legend: { position: 'bottom' }");
out.println("};");
out.println("var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));");
out.println("chart.draw(data, options);");
out.println("}");
out.println("</script>");
out.println("<div id='curve_chart' style='width: 900px; height: 500px'></div>");

//List all customers
out.println("<h3>Administrator Customer List</h3>");
try ( Connection con = DriverManager.getConnection(url, uid, pw);
	Statement stmt = con.createStatement();){
	PreparedStatement pstmt = con.prepareStatement("SELECT customerId, firstName, lastName, email, phoneNum, address, city, state, postalCode, country, userid FROM customer WHERE userid = ?;");
	ResultSet rst = stmt.executeQuery("SELECT customerId, firstName, lastName, email, phoneNum, address, city, state, postalCode, country, userid FROM customer;"); 
	out.println("<table class='table' border='1'><tr><th>Customer ID</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Phone Number</th><th>Address</th><th>City</th><th>State</th><th>Postal Code</th><th>Country</th><th>User ID</th>");
	while (rst.next()){
		out.println("<tr><td>" + rst.getString(1) + "</td><td>" + rst.getString(2) + "</td><td>" + rst.getString(3) + "</td><td>" 
		+ rst.getString(4) + "</td><td>" + rst.getString(5) + "</td><td>" + rst.getString(6) + "</td><td>" + rst.getString(7) + "</td><td>" 
		+ rst.getString(8) + "</td><td>" + rst.getString(9) + "</td><td>" + rst.getString(10) + "</td><td>" + rst.getString(11) + "</td></tr>");
	}
	out.println("</table>");
	rst.close();
	stmt.close();
	con.close(); 
} catch (SQLException ex) {
	out.println("SQLException: " + ex);
}
%>

<h3>Add a Product</h3>
<form method="post" action="addproduct.jsp">
    <label for="productName">Product Name:</label><br>
    <input type="text" id="productName" name="productName"><br>
    <label for="productPrice">Product Price:</label><br>
    <input type="text" id="productPrice" name="productPrice"><br>
    <label for="productDesc">Product Description:</label><br>
    <textarea id="productDesc" name="productDesc"></textarea><br>
    <input type="submit" value="Submit">
</form>

<h3>Update a Product</h3>
<form method="post" action="updateproduct.jsp">
    <label for="productId">Product ID:</label><br>
    <input type="text" id="productId" name="productId"><br>
    <label for="productName">Product Name:</label><br>
    <input type="text" id="productName" name="productName"><br>
    <label for="productPrice">Product Price:</label><br>
    <input type="text" id="productPrice" name="productPrice"><br>
    <label for="productDesc">Product Description:</label><br>
    <textarea id="productDesc" name="productDesc"></textarea><br>
    <input type="submit" value="Update">
</form>

<h3>Delete a Product</h3>
<form method="post" action="deleteproduct.jsp">
    <label for="productId">Product ID:</label><br>
    <input type="text" id="productId" name="productId"><br>
    <input type="submit" value="Delete">
</form>

<%
out.println("<h2><a href='index.jsp'>Back to Main Page</a></h2>");
%>
</body>
</html>

