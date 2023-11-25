<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.ParseException"  %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery Order Processing</title>
<style>
table, th, td {
       border: 1px solid black;
       text-align: left;
       padding: 5px;
   }
.top{
   background-color: rgb(255,105,180);
}
table tr:nth-child(even) {
   background: #F0F0F0;
}


table tr:nth-child(odd) {
   background: #FFF;
}
header h1{ 
    color: rgb(255,105,180); 

}
</style>
</head>
<body>
<header>
        <h1 align="center">SQL Spice & Market: Where Flavor Meets Data</h1>
        <hr> 
</header>
<% 
// Get customer id
String custId = request.getParameter("customerId");
String custPassword = request.getParameter("customerPassword");
double total = 0; 
double pr = 0;

// Get shipping address + card info from : http://localhost/shop/order.jsp?customerId=1&customerPassword=304Arnold%21&street=&city=&state=&zip=&cardNumber=&expirationDate=&securityCode=&submit=Submit
String street = request.getParameter("street");
String city = request.getParameter("city");
String state = request.getParameter("state");
String zip = request.getParameter("zip");
//last 4 digits of card number
String cardNumber = request.getParameter("cardNumber");
String expirationDate = request.getParameter("expirationDate");
String securityCode = request.getParameter("securityCode");

//validate data
if (street == null || city == null || state == null || zip == null || cardNumber == null || street.equals("") || city.equals("") || state.equals("") || zip.equals("") || street.length() > 50 || city.length() > 50 || state.length() > 50 || zip.length() != 6) {
    out.println("<h1>Invalid shipping information. Go back to the previous page and try again.</h1>");
    return;
}

if (cardNumber.equals("") || cardNumber.length() != 16 || !cardNumber.matches("[0-9]+") || expirationDate.equals("") || expirationDate.length() != 5 || !expirationDate.matches("(0[1-9]|1[0-2])/[0-9]{2}") || securityCode.equals("") || securityCode.length() != 3 || !securityCode.matches("[0-9]+")) {
	out.println("<h1>Invalid payment information. Go back to the previous page and try again.</h1>");
	return;
}

cardNumber = cardNumber = cardNumber.substring(cardNumber.length() - 4);

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
ArrayList<Object> product;
int qty = 1; 
String productstring =""; 

try ( Connection con = DriverManager.getConnection(url, uid, pw);
	Statement stmt = con.createStatement();)
	  {
		if(productList.isEmpty()){
			throw new NullPointerException();
		}
		if(custId == null){
			throw new IndexOutOfBoundsException();
		}
		String cust = "SELECT customerId, password FROM customer WHERE customerId = ?";
		PreparedStatement pst22 = con.prepareStatement(cust);
		pst22.setString(1, custId);
		ResultSet rst22 = pst22.executeQuery();
		if(!rst22.next()){
			throw new IndexOutOfBoundsException();
		}
		String pass = rst22.getString("password");
		if(!pass.equals(custPassword)){
			throw new IllegalArgumentException();
		}
		rst22.close();
		// first get customerid 
		ResultSet cidrst = stmt.executeQuery(cidsql); 
		
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

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
        String formattedDate = dateFormat.format(date);
		String addOrder = "INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES ( ?, ?, " + 0 + ")";
		PreparedStatement pst2 = con.prepareStatement(addOrder, Statement.RETURN_GENERATED_KEYS);
		pst2.setString(1, custId);
		pst2.setString(2, formattedDate);
		pst2.executeUpdate();
		ResultSet keys = pst2.getGeneratedKeys();
		keys.next();
		int ordId = keys.getInt(1);
		keys.close();

	out.print("<table id='table'><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	out.println("<th>Price</th><th>Subtotal</th></tr>");
	String addintoop = "INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (" + ordId + ", ?, ?, ?)";
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) 
	{	
		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		product = (ArrayList<Object>) entry.getValue();
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
		pr = 0;
		qty = 0;
		productstring = product.get(0) + "";
		
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

		PreparedStatement pstmt3 = con.prepareStatement(addintoop); 
		// pstmt3.setInt(1, ordId);
			// pstmt
		out.println("this is the orderid" + ordId); 
		double doubleValue = Double.parseDouble(productstring);
		int intValue = (int) doubleValue;
		pstmt3.setInt(1, intValue);
		pstmt3.setInt(2, qty); 
		pstmt3.setDouble(3, pr); 
		pstmt3.executeUpdate(); 
		out.println("integer value: " + intValue + " quantity: " + qty + " price: "+ pr); 
	}

	String updateAmount = "UPDATE ordersummary SET totalAmount = ? WHERE orderId = ?";
	PreparedStatement pst4 = con.prepareStatement(updateAmount);
	pst4.setDouble(1, total);
	pst4.setInt(2, ordId);
	pst4.executeUpdate();

	if (total == 0.0) {
		out.println("</table> <script> document.getElementById('table').remove(0); </script>");
    	out.println("<h1>Your Cart is empty!!</h1><!--");
	}
	else {
		out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
		out.println("</table>");
		out.println("<h1>Order completed. Will be shipped soon...</h1>");
		out.println("<h1>Shipping to: "+street+" "+city+" "+state+" "+zip+"</h1>");
		out.println("<h1>Card Number: **** **** **** "+cardNumber+"</h1>");
		session.setAttribute("productList", null);
		out.println("<h1>Your order reference number is: "+ (ordId) + "</h1>");
		out.println("<h1>Shipping to customer: "+rst.getInt(1)+ " Name: "+rst.getString(2)+" "+rst.getString(3)+"</h1>" );   
		stmt.executeUpdate("SET IDENTITY_INSERT ordersummary OFF");

	}
		
	if (total == 0.0)
		out.println("--!>");
				out.println("<h2><a href='index.jsp'>Back to Main Page</a></h2>");
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
	  } catch(NullPointerException e) {
		out.println("<h1>You cannot check out without any items in your cart.</h1>");

	  } catch(IndexOutOfBoundsException e) {
		out.println("<h1>Enter a valid customer ID</h1>"); 
	  } catch(IllegalArgumentException e){
		out.println("<h1>Incorrect Password</h1>");
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