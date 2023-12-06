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
  body{
	margin-top: 100px; 
}
table {
	border-collapse: collapse; 
	border: none; 
	width: 100%; 
}
tr{
	border: 1px solid black; 
	width: 100%;
	padding: 10px; 
}
.entireorder{
	width: 100%; 
	height: fit-content; 
	background-color: #d9d8d7;
	padding: 10px; 
	border: 2px; 
}
.entireorder .order-items{
	display: flex; 
	width: 100%; 
	margin: 0 auto;
}
.entireorder .order-items .info{
	margin-bottom: 10px; 
}

.order-items .image{
	display: flex; 
	width: 40%; 
}
.order-items .pricing{
	display: inline-block; 
}
.image img{
	width: 100%; 
}
.order-items .info{
	width: 60%;
	display: flex; 
	flex-direction: row; 
	justify-content: space-around;
}
.order-blocks{
	display: inline-block;
}
.overblocks-1{
	width: 100%; 
	justify-content: space-between; 
	flex-direction: row; 
	margin: 0 auto; 
	padding: 0 auto; 
	display: flex;
}
.overblocks1 {
	width: 50%; 
    display: flex;
	flex-direction: column; 
	padding: 0 auto; 
	margin: 0 auto;
}
.tableinfo td, th{
	padding: 10px; 
	font-size: 20px; 
}
.back{
	margin-left: 40px;
}
.back img{
	width: 70px; 
	height: 70px; 
	transition: 1s ease; 
	margin-bottom: 10px; 
}
.back img:hover{
	transform: scale(1.15); 
}

</style>
</head>
<body>
<%@ include file="headertransparent.jsp" %>

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
double totalfr = 0;

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
		out.println("<div class = 'order-container'><div class = 'orderblocks' style='width: 100%;'><h1 style='font-size: 40px;'>Thanks for your order!</h1><div class = 'orderid' style='display: flex; align-items: center; text-align: center; width: fit-content;'><img src = 'img/reviewyes.png' style='width: 50px; height: 50px; display: inline-block; margin: 0 auto; padding: 0 auto; background: transparent;'><div class = 'overblocks-1>");
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
				// out.println("<h1>Your Order Summary</h1>");
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
				out.println("<h2 style='display: inline-block; margin: 0 auto; padding-left: 20px;'> OrderID #"+ordId+"</h2></div></div></div>");
				keys.close();
	// out.print("<table id='table'><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	// out.println("<th>Price</th><th>Subtotal</th></tr>");
		String addintoop = "INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (" + ordId + ", ?, ?, ?)";
		Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
		out.println("<div class = 'orderblocks' style='width: 100%; display: flex;'><div class = 'overblocks1'><div class = 'top'><h2 style='font-size: 30px;'> Order Details: </h2><h4 style='font-size: 20px;'> Order Successfully completed. Will be shipped in 5-8 business days </h4></div>");
		out.println("<div class = 'bottom'><table class = 'tableinfo'><tr><td><b> Name </b></td><td>"+rst.getString(2)+" "+rst.getString(3)+"</td> </tr><tr><td><b> Shipping Address </b></td><td>"+street+"<br>"+city+" , "+state+" "+zip+"</td></tr><tr><td><b> Payment Info </b></td><td>Card Number: **** **** ****"+cardNumber+"</td> </tr> </table></div></div>");
		out.println("<div class='orderblocks1' style='width: 50%; display: flex; margin: 0 auto; padding: 10px;'><div class='entireorder'>");
		while (iterator.hasNext()) {	
			Map.Entry<String, ArrayList<Object>> entry = iterator.next();
			product = (ArrayList<Object>) entry.getValue();
			if (product.size() < 4)
			{
				out.println("Expected product with four entries. Got: "+product);
				continue;
			}
			out.println("<div class = 'orderblocks'><div class = 'orderblocks1' style='width: 100%; display: block; '>");
			url = "addcart.jsp?removeId=" + product.get(0);
			// out.print("<tr><td>"+product.get(0)+"</td>");
			// out.print("<td>"+product.get(1)+"</td>");
			// out.print("<td align=\"center\">" + product.get(3)+ "</td>");
			Object price = product.get(2);
			Object itemqty = product.get(3);
			Object image = product.get(5);
			String imageurl = image + ""; 
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
			// out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
			// out.print("<td align=\"right\">"+currFormat.format(pr*qty)+"</td>");
			// out.println("</tr>");
			total = total +pr*qty;

			PreparedStatement pstmt3 = con.prepareStatement(addintoop); 
			// pstmt3.setInt(1, ordId);
				// pstmt
			double doubleValue = Double.parseDouble(productstring);
			int intValue = (int) doubleValue;
			pstmt3.setInt(1, intValue);
			pstmt3.setInt(2, qty); 
			pstmt3.setDouble(3, pr); 
			pstmt3.executeUpdate(); 
			// out.println("integer value: " + intValue + " quantity: " + qty + " price: "+ pr); 
			// printing right side
			out.println("<div class='order-items'><div class='image'><img src='"+imageurl+"'></div><div class='info' style='display: flex; justify-content: space-between; margin: 0 auto; flex-direction: column; padding-top: 5px; padding-left: 30px;'><div class='info-name'><h1 style='padding: 0 auto; margin: 0 auto;'>" + product.get(1) + "</h1></div><div class='pricing' style='display: flex; justify-content: space-between; flex-direction: row; '><div class='qty' style='display: flex;'><h2>" + qty + "</h2></div><div class='price' style='display: flex;'><h2>" + currFormat.format(pr * qty) + "</h2></div></div></div></div><br></div>");
			// bottom of right side
			totalfr = total + (total*0.12); 
		}
	out.println("<div class = 'order-items' style='display: block;'><hr><div class = 'summary' style='display: flex; flex-direction: row; justify-content: space-between; margin: 0 auto; padding: 0 auto;'><div class = 'summary1'><h3 style = 'font-size: 25px; margin: 0 auto; margin-bottom: 10px;'>Subtotal </h3><h3 style='font-size: 25px; margin: 0 auto;'>Taxes</h3></div><div class = 'summary1' style='text-align: right;'><h4 style='font-size: 25px; margin: 0 auto; margin-bottom: 10px;'>"+currFormat.format(total)+"</h4><h4 style='font-size: 25px; margin: 0 auto;'>"+currFormat.format(total*0.12)+"</h4></div></div><hr><div class = 'total' style='display: flex; flex-direction: row; justify-content: space-between; margin: 0 auto; padding: 0 auto;'><h3 style='font-size: 30px; margin-bottom: 10px; margin-top: 10px;'>Total: </h3><h4 style='font-size: 30px; margin-bottom: 10px; margin-top: 10px;'>"+currFormat.format(totalfr)+"</h4></div></div></div>");
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
		// out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
		// out.println("</table>");
		// out.println("<h1>Order completed. Will be shipped soon...</h1>");
		// out.println("<h1>Shipping to: "+street+" "+city+" "+state+" "+zip+"</h1>");
		// out.println("<h1>Card Number: **** **** **** "+cardNumber+"</h1>");
		// add this back
		session.setAttribute("productList", null);
		// out.println("<h1>Your order reference number is: "+ (ordId) + "</h1>");
		// out.println("<h1>Shipping to customer: "+rst.getInt(1)+ " Name: "+rst.getString(2)+" "+rst.getString(3)+"</h1>" );   
		stmt.executeUpdate("SET IDENTITY_INSERT ordersummary OFF");
	}
		
	if (total == 0.0)
		out.println("--!>");
    ++invalid; 
	}
	out.println("</div></div></div>");
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

out.println("</div></div><br><a href='index.jsp' class='back'><img src = 'img/back.png'></a>");

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
<!--
<div class = "order-container">
	<div class = "orderblocks" style="width: 100%; ">
		<h1>Thanks for your order!</h1>
		<div class = "orderid" style="display: flex; border: 2px solid black; align-items: center; text-align: center; width: fit-content;">
			<img src = "img/reviewyes.png" style="width: 50px; height: 50px; display: inline-block; margin: 0 auto; padding: 0 auto; background: transparent; ">
			<h2 style="display: inline-block; margin: 0 auto; padding-left: 10px; "> OrderID </h2> 
		</div>
	</div>
	<div class = "orderblocks " style="width: 100%; justify-content: space-between; flex-direction: row; margin: 0 auto; padding: 0 auto; display: flex;">
		<div class = "orderblocks1" style="width: 50%; display: block; padding: 10px;">
				<div class = "top">
					<h2> Order Details: </h2>
					<h4> Order Successfully completed. Will be shipped in 5-8 business days </h4>
				</div>
			<div class = "bottom" style="">
				<table>
					<tr style='padding: 5px;'> 
						<td> Name </td>
						<td> Arnold Anderson </td> 
					</tr>
					<tr> 
						<td> Shipping Address  </td>
						<td> Street  </td> 
					</tr>
					<tr>
						<td> Payment Info </td> 
						<td> Card </td> 
					</tr> 
				</table>
			</div>
		// </div>
		<div class = "orderblocks1" style="width: 50%; display: flex; margin: 0 auto; padding: 10px;  ">
			<div class = "entireorder">
				<h2>Your Order: </h2> 
				<div class = "order-items">
					<div class = "image"><img src = "img/ba.jpg"></div>
					<div class = "info" style="display: flex; justify-content: space-between; margin: 0 auto; flex-direction: column;">
						<div class = "info-name"><h1 style="padding: 0 auto; margin: 0 auto;">This is a Rock</h1></div> 
						<div class = "pricing" style="display: flex; justify-content: space-between; flex-direction: row; "><div class = "qty" style="display: flex; "><h2>1</h2></div><div class = "price" style="display: flex;"><h2>$1233</h2></div></div>
					</div>
				</div>
				<div class = "order-items" style="display: block;">
					<hr>
					<div class = "summary" style="display: flex; flex-direction: row; justify-content: space-between; margin: 0 auto; padding: 0 auto;">
						<div class = "summary1">
							<h3>Subtotal</h3>
							<h3>Taxes</h3>
						</div>
						<div class = "summary1" style="text-align: right;">
							<h4>Taxes</h4>
							<h4>Costs2</h4>
						</div>
					</div>
					<hr>
					<div class = "total" style="display: flex; flex-direction: row; justify-content: space-between; margin: 0 auto; padding: 0 auto;">
						<h3>Total: </h3>
						<h4>Total Cost</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 
-->

</body>
</html>