<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<style>
body {
    background: url("img/textured.png");
    background-size: cover; 
    background-repeat: no-repeat; 
    text-align: center; 
    align-items: center; 
	margin-top: 50px; 
}
header{
    display: flex; 
    position: sticky; 
    text-align: center; 
}
form{
    font-size: 20px; 
}
table .links{
    width: 30%; 
}
.header{
    text-align: center; 
    align-items: center; 
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
.cart-container{
	height: 100%;
	display: flex; 
	height: fit-content;
}
.cart-container .item-70{
	display: block; 
	width: 70%; 
}
.cart-container .item-30{
	display: flex; 
	width: 30%; 
	margin: 10px;
	margin-top: 0px;  
}
.item-30 .total{
	flex-direction: column;
    align-items: center;
	text-align: center; 
	padding-left: 5px; 
}
.item-30 .total p {
	text-align: left; 
	font-size: 1.5em; 
}
.item-30 .total a{
	margin: 0 auto; 
	padding: 0 auto; 
}
.item-30 button{
	background-color: #878686;
}
.item-30 button:hover{
	background-color: #615f5f;

}
.empty{
	width: 10%; 
}
.total{
	width: 90%;
	padding: 5px; 
	background-color: white; 
	display: block; 
	border: 2px solid black; 
	height: fit-content; 
	padding-bottom: 10px; 
}
.card { 
	display: block; 
	width: 100%;
	}
.card-item{
	width: 100%;
	height: fit-content;
	min-height: 20vh; 
	max-height: fit-content;
	display: flex;
    box-shadow: 0 0 6px 1px rgba(0, 0, 0, 0.5);
	background-color: white; 
	padding: 0 auto;
	margin: 0 auto;  

}
.card-item .image{
	margin: 0 auto;
	height: fit-content; 
	padding: 0 auto;
	display: flex; 
}
.card-item .image img{
	height: fit-content; 
	width: 100%; 
	object-fit: cover; 
	margin: 0 auto; 
	
}
.card-item .content-left{
	width: 70%;
	display: flex;  
	flex-direction: column; 
	justify-content: space-between; 
	align-items: left; 
	text-align: left; 
	margin: 0 auto;
	padding-left: 10px; 
}

.card-item .content-left h1{
	font-size: 1.5rem; 
}
.card-item .content-left p{
	margin-bottom: auto; 
}
.card-item .content-left .quantitychange{
	padding-bottom: 10px; 
}
.card-item .content-left form{
	margin: 0 auto; 
	padding: 0 auto; 
}
.card-item .content-right{
	width: 30%;
	display: flex;  
	flex-direction: column; 
	justify-content: space-between; 
	align-items: flex-end; 
	margin: 0 auto;
	padding:0 auto; 
}
.card-item .content-right .pricing{
	display: block;
	padding-right: 5px; 
}
.card-item .content-right .pricing h2{
	margin: 0 auto;
	padding-top: 10px; 
	text-align: right; 
	font-weight: normal;
}

.content-right .pricing h3{
	font-weight: normal; 
	margin: 0 auto;
	padding-top: 5px; 
	text-align: right; 


}

.card-item .content-right img{
	width: 30px;
	height: 30px; 
	background: transparent; 
	margin: 0 auto; 
	padding: 0 auto;
}
.card-item .content-right .trash{
	padding-right: 5px; 
	padding-bottom: 5px; 
}
.item-70 .bottom {
	align-items: right; 
	display: flex; 
}
.item-70 .bottom button{
	background-color: #FFD812;
}
.item-70 .bottom button:hover{
	background-color: #F7CA00;

}

</style>
</head>
<body>
<%@ include file="headertransparent.jsp" %>
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

	out.println("<h1 style='padding-left: 20px; '>Shopping Cart</h1>");
	// out.print("<table class='table' width = '800px' align = 'center'><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	// out.println("<th>Price</th><th>Subtotal</th><th>Remove from Cart</th><th>Update Quantity</th></tr>");
	out.println("<div class = 'cart-container'><div class='item-70'><div class = 'card' id='card'>"); // 3 close 
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

		Object price = product.get(2);
		Object itemqty = product.get(3);
		Object description = product.get(4); 
		Object image = product.get(5);
		String urlimage; 
		if(image != null) {
			urlimage = image + ""; 
		} else {
			urlimage = "unavailable"; 
		}
		double pr = 0;
		int qty = 0;
		//  print out cards 
		String url = "addcart.jsp?removeId=" + product.get(0);
		// out.print("<tr id='row'><td><h5 style='width: 100px; margin: 0 auto; text-align: left'>"+product.get(0)+"</h5></td>");
		// out.print("<td>"+product.get(1)+"</td>");
		// out.print("<td>" + product.get(3)+ "</td>");
		
		try
		{
			pr = Double.parseDouble(price.toString());
		}
		catch (Exception e)
		{
			out.println("<h2 align='left'>Empty Cart!</h2>");
		}
		try
		{
			qty = Integer.parseInt(itemqty.toString());
		}
		catch (Exception e)
		{
			out.println("Invalid quantity for product: "+product.get(0)+" quantity: "+qty);
		}		
		// out.print("<td align=\"right\"><h5 style='width: 200px'>"+currFormat.format(pr)+"</h5></td>");
		// out.print("<td align=\"right\"><h5 style='width: 200px'>"+currFormat.format(pr*qty)+"</h5></td>");
		// out.print("<td><h5 style='width: 200px'><a href='" + url + "'> Remove Item from Cart</h5></a>");
		// out.print("<td><h5 style='width: 200px'><form action='addcart.jsp' method='get'> <input type='hidden' name='updateId' value='" + product.get(0) + "'>New Quantity: <input type='text' name='newQty'><input type='submit' value='Update Quantity'></form></h5></td>");
		// out.println("</tr>");
		total = total +pr*qty;
		out.println("<div class = 'card-item' id = 'card-item' style='margin-bottom: 30px;'><div class = 'image' style='width: 30%; margin: 0 auto; padding: 0 auto;'><img src='"+urlimage+"'></div><div class='content-left' style='width: 70%;'><div class ='all-content'><h1>"+product.get(1)+"</h1><p>"+product.get(4)+"<br><h3>Quantity: "+qty+"</h3></p></div><div class = 'quantitychange'><form action='addcart.jsp' method='get'> <input type='hidden' name='updateId' value='" + product.get(0) + "'>New Quantity: <input type='text' name='newQty'><input type='submit' value='Update Quantity'></form></div></div><div class = 'content-right'><div class='pricing'><h2>Subtotal: <b>"+currFormat.format(pr*qty)+"</b></h2><h3 style='margin: 0 auto; padding: 0 auto;'>Price Per item: "+currFormat.format(pr)+"</h3></div><div class = 'trash'><a href='" + url + "'><img src = 'img/trash.png'></a></div></div></div>");

		if (product.get(0) == null)
			out.println("<script> document.getElementById('card-item').remove();</script>");
	}
	out.println("<div class='bottom' style='width: 100%;'><a href='listprod.jsp?productName=' align='right' class='shopping'><button id='shopping'><h2 align='center'>Continue Shopping</h2></button></a></div></div></div>");
out.println("<div class=\"item-30\"><div class=\"empty\"></div><div class=\"total\"><p style='padding-left: 10px; '>Total: <b>" + currFormat.format(total) + "</b></p><a href=\"checkout.jsp\" class=\"stopshopping\" style='text-decoration: none; margin: 0px; padding: 0px;'><button id=\"shopping2\" style='padding: 0px 60px; border-radius: 50px;'><h2>Checkout</h2></button></a></div></div></div>");
	out.println("</div>");
	
	if(total == 0)
		out.println("<script> document.getElementById('card').parentNode.removeChild(document.getElementById('card-item'));</script>");
	
	/* out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
			+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
	out.println("</table>");
	*/
	
}
%>
<br>
<br>
<br>

</div>
</body>
</html> 

