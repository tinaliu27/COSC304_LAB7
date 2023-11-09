<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>

<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery Order Processing</title>
</head>
<body>

<% 
// Get customer id
String custId = request.getParameter("customerId");
int id = 0; 

@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

// Determine if valid customer id was entered


// Determine if there are products in the shopping cart
// If either are not true, display an error message

// Make connection
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa";
String pw = "304#sa#pw";

String sql = "SELECT customerId, firstName, lastName FROM customer WHERE customerId = ?";
// Save order information to database

// gets last row in customer ddl to retrieve the correct customerid
String cidsql = "SELECT TOP 1 orderId FROM ordersummary ORDER BY orderId DESC";

try ( Connection con = DriverManager.getConnection(url, uid, pw);

	Statement stmt = con.createStatement();)
	  {
		// first get customerid 
		ResultSet cidrst = stmt.executeQuery(cidsql); 

		if(cidrst.next()) {
			id = cidrst.getInt("orderId");
		}
		
		PreparedStatement pstmt = con.prepareStatement(sql); 
		pstmt.setInt(1, Integer.parseInt(custId)); 
		ResultSet rst = pstmt.executeQuery();
		NumberFormat currFormat = NumberFormat.getCurrencyInstance();
		int invalid = 0; 
		if (productList.isEmpty())
			out.println("<h1>Your Cart is empty</h1>");
		while(rst.next() && invalid != 2) {
				out.println("<h1>Your Order Summary</h1>");
				currFormat = NumberFormat.getCurrencyInstance();
	out.print("<table id='table'><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	out.println("<th>Price</th><th>Subtotal</th><th></th><th></th></tr>");
				double total = 0;		
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) 
	{	Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		if (product.size() < 4)
		{
			out.println("Expected product with four entries. Got: "+product);
			continue;
		}
		url = "addcart.jsp?removeId=" + product.get(0);
		out.print("<tr><td>"+product.get(0)+"</td>");
		out.print("<td>"+product.get(1)+"</td>");
		out.print("<td align=\"center\">" + product.get(3)+ "</td>");
		Object price = product.get(2);
		Object itemqty = product.get(3);
		double pr = 0;
		int qty = 0;
		
		try
		{
			pr = Double.parseDouble(price.toString());
		}
		catch (Exception e)
		{
			//out.println("Invalid price for product: "+product.get(0)+" price: "+price);
		}
		try
		{
			qty = Integer.parseInt(itemqty.toString());
		}
		catch (Exception e)
		{
			out.println("Invalid quantity for product: "+product.get(0)+" quantity: "+qty);
		}		
		out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
		out.print("<td align=\"right\">"+currFormat.format(pr*qty)+"</td>");
		out.println("</tr>");
		total = total +pr*qty;
	}
	if (total == 0.0) {
	out.println("</table> <script> document.getElementById('table').remove(0); </script>");
    out.println("<h1>Your Cart is empty!!</h1><!--");
	}
	else {
	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
	out.println("</table>");
	out.println("<h1>Order completed. Will be shipped soon...</h1>");
	session.setAttribute("productList", null);
	out.println("<h1>Your order reference number is: "+ (++id) + "</h1>");
	out.println("<h1>Shipping to customer: "+rst.getInt(1)+ " Name: "+rst.getString(2)+" "+rst.getString(3)+"</h1>" );    stmt.executeUpdate("SET IDENTITY_INSERT ordersummary OFF");
	String addintoddl = "INSERT INTO ordersummary (totalAmount, customerId) VALUES (?,?)";
	PreparedStatement pstmt2 = con.prepareStatement(addintoddl, Statement.RETURN_GENERATED_KEYS); 
	
	try{
		String totals = total + "";
		pstmt2.setString(1, totals);
		pstmt2.setInt(2, Integer.parseInt(custId)); 
		int rowsAffected = pstmt2.executeUpdate();
            // Check the result
        if (rowsAffected > 0) {
			ResultSet generatedKeys = pstmt2.getGeneratedKeys();
			if(generatedKeys.next()) {
				int updatedid = generatedKeys.getInt(1); 
			}
            out.println("Row inserted successfully!");
        } else {
            	out.println("Failed to insert row.");
        }
	} catch (SQLException ex) {
			out.println("SQLException: " + ex);
	
	}
	}
	if (total == 0.0)
		out.println("--!>");
				out.println("<h2><a href='shop.html'>Back to Main Page</a></h2>");
				++invalid; 
		}
		if (invalid==0) {
		out.println("<h1>Invalid customer id. Go back to the previous page and try again.</h1>");
		}
		if (invalid == 2)
			out.println("<h1>Invalid customer id. Go back to the previous page and try again.</h1>");

    
	stmt.close();
	con.close(); 
	rst.close();
	  } catch (SQLException ex) {
			out.println("SQLException: " + ex);
}

	/*
	// Use retrieval of auto-generated keys.
	PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);			
	ResultSet keys = pstmt.getGeneratedKeys();
	keys.next();
	int orderId = keys.getInt(1);
	*/

// Insert each item into OrderProduct table using OrderId from previous INSERT

// Update total amount for order record

// Here is the code to traverse through a HashMap
// Each entry in the HashMap is an ArrayList with item 0-id, 1-name, 2-quantity, 3-price

/*
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext())
	{ 
		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		String productId = (String) product.get(0);
        String price = (String) product.get(2);
		double pr = Double.parseDouble(price);
		int qty = ( (Integer)product.get(3)).intValue();
            ...
	}
*/

// Print out order summary

// Clear cart if order placed successfully
%>
</BODY>
</HTML>
