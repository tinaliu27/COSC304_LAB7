<%@ page import="java.sql.*, java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.util.Locale" %>

<!DOCTYPE html>
<html>
<head>
    <title>Ray's Grocery - Product Information</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>

<%
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

   String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
   String uid = "sa";
   String pw = "304#sa#pw";
   // TODO: Get order id
String id = request.getParameter("orderId");
   // TODO: Check if valid order id in database


   // TODO: Start a transaction (turn-off auto-commit)
  try(Connection con = DriverManager.getConnection(url, uid, pw); 
	Statement stmt = con.createStatement();) 
{
	con.setAutoCommit(false); 
	// returns the information about the users inventory and quantity 
	String sql = "SELECT OP.productId, OP.quantity, PI.quantity FROM orderproduct OP INNER JOIN productinventory PI ON OP.productId = PI.productId WHERE orderId = ?"; 
	PreparedStatement pst = con.prepareStatement(sql); 
	pst.setInt(1, Integer.parseInt(id));  // double check if this integer thing works 
	ResultSet rst = pst.executeQuery(); 
boolean successful = false; 
   // TODO: Retrieve all items in order with given id
   	while(rst.next()) {
		int pid = rst.getInt(1); 
		int quantity = rst.getInt(2); 
		int inventory = rst.getInt(3);
		if(!(inventory-quantity < 0)) {
			out.println("<h3>Ordered product: " + pid  + " Qty: " + quantity + " Previous Quantity: " + inventory + " New Inventory: " + (inventory-quantity) +"</h2>"); 
			successful = true; 
		} else {
			inventory = 0; 
			out.println("<h2>Shipment not done. Insufficient inventory for product id: " + pid + "</h2>"); 
			successful = false; 
			break;
		}
String sql2 = "UPDATE productinventory SET quantity = ? WHERE productId = ?";
PreparedStatement pst2 = con.prepareStatement(sql2); 
pst2.setInt(1, inventory); 
pst2.setInt(2, pid); 
pst2.executeUpdate(); 
}
if(successful){
	out.println("<h2>Shipment successfully processed</h2>"); 
}
// TODO: Create a new shipment record.
   // TODO: For each item verify sufficient quantity available in warehouse 1.
   
   // TODO: If any item does not have sufficient inventory, cancel transaction and rollback. Otherwise, update inventory for each item.
   // TODO: Auto-commit should be turned back on
   con.setAutoCommit(true);
   rst.close();
   stmt.close();
   con.close();
} catch (SQLException ex) {
   out.println("SQLException: " + ex);
}


%> 
</body>
</html>