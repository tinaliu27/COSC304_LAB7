<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Shopping Cart</title>
<style>
header{
    display: flex; 
    position: sticky; 
    text-align: center; 
}
form{
    font-size: 20px; 
}
table, th, td{
    border: .2px solid black; 
    text-align: left; 
    padding-left: 5px; 
    width: 80%;
}
table .links{
    width: 30%; 
}
.header{
    text-align: center; 
    align-items: center; 
}
h1{
    text-align: center;
    align-items: center; 
    color: rgb(255,105,180); 
}
tr{
   width: 1px;
   word-wrap: break-word;
   padding-left: 0;
   padding-right: 0;
   max-width: 180px;
   min-width: 1px; 
}
.link{
    width: 20px; 
    word-break: break-all;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<br>
<%
String updateId = request.getParameter("updateId");
String newQty = request.getParameter("newQty");

if (updateId != null && newQty != null) {
    // Parse the new quantity
    int parsedNewQty = Integer.parseInt(newQty);

    // Check if the new quantity is negative
    if (parsedNewQty < 0) {
        // Set the new quantity to zero or ignore the update
        parsedNewQty = 0;
    }

    // Get the productList from the session
    HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

    // Check if the productList is null
    if (productList == null) {
        // Initialize the productList
        productList = new HashMap<String, ArrayList<Object>>();
    }

    // Get the product from the productList
    ArrayList<Object> product = productList.get(updateId);

    // Check if the product exists in the productList
    if (product != null) {
        // Update the quantity of the product in the productList
        product.set(3, parsedNewQty);
    }

    // Save the updated productList back to the session
    session.setAttribute("productList", productList);
}
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null)
{	out.println("<h1>Your shopping cart is empty!</h1>");
	productList = new HashMap<String, ArrayList<Object>>();
}
else
{
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();

	out.println("<h1>Your Shopping Cart</h1>");
	out.print("<table class='table' width = '800px' align = 'center'><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	out.println("<th>Price</th><th>Subtotal</th><th>Remove from Cart</th><th>Update Quantity</th></tr>");

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
		String url = "addcart.jsp?removeId=" + product.get(0);
		out.print("<tr id='row'><td><h5 style='width: 100px; margin: 0 auto; text-align: left'>"+product.get(0)+"</h5></td>");
		out.print("<td>"+product.get(1)+"</td>");
		out.print("<td>" + product.get(3)+ "</td>");
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
		out.print("<td align=\"right\"><h5 style='width: 200px'>"+currFormat.format(pr)+"</h5></td>");
		out.print("<td align=\"right\"><h5 style='width: 200px'>"+currFormat.format(pr*qty)+"</h5></td>");
		out.print("<td><h5 style='width: 200px'><a href='" + url + "'> Remove Item from Cart</h5></a>");
		out.print("<td><h5 style='width: 200px'><form action='addcart.jsp' method='get'> <input type='hidden' name='updateId' value='" + product.get(0) + "'>New Quantity: <input type='text' name='newQty'><input type='submit' value='Update Quantity'></form></h5></td>");
		out.println("</tr>");
		total = total +pr*qty;
		if (product.get(0) == null)
			out.println("<script> document.getElementById('row').remove(0);</script>");
	}
	if(total == 0)
		out.println("<script> document.getElementById('table').remove(0);</script>");
	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
			+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
	out.println("</table>");
}
%>
<br>
<a href="checkout.jsp" align="left" class="stopshopping">
        <button id = "shopping2">
                <h2 align="center">Check out</h2>     
        </button>
</a>
<br>
<br>
<a href="listprod.jsp?productName=" align="left" class="shopping">
        <button id = "shopping">
                <h2 align="center">Continue Shopping</h2>     
        </button>
</a>
</body>
</html> 

