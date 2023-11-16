<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<body>

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
%>
</body>
</html>

