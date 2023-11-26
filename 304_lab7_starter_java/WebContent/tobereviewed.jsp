<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Base64" %>
<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productReview = (HashMap<String, ArrayList<Object>>) session.getAttribute("productReview");
boolean remove = false;

if (productReview == null)
{	// No products currently in list.  Create a list.
	productReview = new HashMap<String, ArrayList<Object>>();
}
else {
	productReview.remove(request.getParameter("removeId"));
}

// Add new product selected
// Get product information
String id = request.getParameter("id");
String name = request.getParameter("name");

// Store product information in an ArrayList
if (!remove){
ArrayList<Object> product = new ArrayList<Object>();
product.add(id);
product.add(name);

// Update quantity if add same item to order again
if (productReview.containsKey(id))
{	product = (ArrayList<Object>) productReview.get(id);
	int curAmount = ((Integer) product.get(3)).intValue();
	product.set(3, new Integer(curAmount+1));
}
else
	productReview.put(id,product);
}
session.setAttribute("productRate", productReview);


%>
<jsp:forward page="addingreview.jsp" />