<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>

<%
String updateId = request.getParameter("updateId");
String newQty = request.getParameter("newQty");

if (updateId != null && newQty != null) {
    // Get the cart from the session
    HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");

    // Check if the cart is null
    if (cart == null) {
        // Initialize the cart
        cart = new HashMap<String, Integer>();
    }

    // Update the quantity of the product in the cart
    cart.put(updateId, Integer.parseInt(newQty));

    // Save the updated cart back to the session
    session.setAttribute("cart", cart);
}
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");
boolean remove = false;

if (productList == null)
{	// No products currently in list.  Create a list.
	productList = new HashMap<String, ArrayList<Object>>();
}
else {
	productList.remove(request.getParameter("removeId"));
}

// Add new product selected
// Get product information
String id = request.getParameter("id");
String name = request.getParameter("name");
String price = request.getParameter("price");
Integer quantity = new Integer(1);

// Store product information in an ArrayList
if (!remove){
ArrayList<Object> product = new ArrayList<Object>();
product.add(id);
product.add(name);
product.add(price);
product.add(quantity);


// Update quantity if add same item to order again
if (productList.containsKey(id))
{	product = (ArrayList<Object>) productList.get(id);
	int curAmount = ((Integer) product.get(3)).intValue();
	product.set(3, new Integer(curAmount+1));
}
else
	productList.put(id,product);
}
session.setAttribute("productList", productList);
session.setAttribute("productRate", productList);


%>
<jsp:forward page="showcart.jsp" />