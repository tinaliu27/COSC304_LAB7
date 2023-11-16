<!DOCTYPE html>
<html>
<head>
<title>Customer Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<h3>Customer Profile</h3>
<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<%
// TODO: Print Customer information
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa";
String pw = "304#sa#pw";
try ( Connection con = DriverManager.getConnection(url, uid, pw);
	Statement stmt = con.createStatement();){
	PreparedStatement pstmt = con.prepareStatement("SELECT customerId, firstName, lastName, email, phoneNum, address, city, state, postalCode, country, userid FROM customer WHERE userid = ?;");
	pstmt.setString(1, userName);
	ResultSet rst = pstmt.executeQuery(); 
	rst.next();
	out.println("<table class='table' border='1'><tr><th>Id</th><td>" + rst.getString(1) + "</td></tr><tr><th>First Name</th><td>" + rst.getString(2) + "</td></tr><tr><th>Last Name</th><td>" + rst.getString(3) + "</td></tr><tr><th>Email</th><td>" + rst.getString(4) + "</td></tr><tr><th>Phone</th><td>" + rst.getString(5) + "</td></tr><tr><th>Address</th><td>" + rst.getString(6) + "</td></tr><tr><th>City</th><td>" + rst.getString(7) + "</td></tr><tr><th>State</th><td>" + rst.getString(8) + "</td></tr><tr><th>Postal Code</th><td>" + rst.getString(9) + "</td></tr><tr><th>Country</th><td>" + rst.getString(10) + "</td></tr><tr><th>User id</th><td>" + rst.getString(11) + "</td></tr></table>");
	rst.close();
	stmt.close();
	con.close(); 
} catch (SQLException ex) {
	out.println("SQLException: " + ex);
}
out.println("<h2><a href='index.jsp'>Back to Main Page</a></h2>");
// Make sure to close connection
%>
</body>
</html>

