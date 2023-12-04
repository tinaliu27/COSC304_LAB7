<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Base64" %>

<html>
<head>
    <title>RockPalz</title>
</head>
<style> 
body {
    background: url("img/textured.png");
    background-size: cover; 
    background-repeat: no-repeat; 
    text-align: center; 
    align-items: center;
    margin-top: 100px;  
}
.product-container{
    width: 100%; 
    display: flex; 
    padding: 20px; 
    height: fit-content; 
    justify-content: space-around; 
}
.product-container .product-items{
    display: block; 
    align-items: center;
    text-align: center; 

}
.product-container .product-items .product-image{
    display: flex; 
    width: 50%;
}
.product-image img{
    width: 300px; 
    height: fit-content; 
}
.product-container .product-items .product-info {
    display: block; 
    flex-direction: column; 
}
.product-container .product-items .product-info a{
    display: flex; 
    margin: 30px; 
}
.reviews{
    width: 100%; 
}
.review-container{
  padding: 0 20px;
  justify-content: space-evenly; 
  display: flex; 
}
.review-container .item{
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  flex: 1 1 0px;
  padding: 20px; 
  height: fit-content;
  display: block; 
  text-align: center; 
  align-items: center; 
  background-color: white;
  margin: 30px; 
}

</style> 

<body>
<%@ include file="headertransparent.jsp" %>

<%
try {
    // Load driver class
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (java.lang.ClassNotFoundException e) {
    out.println("ClassNotFoundException: " + e);
}

// connection
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa";
String pw = "304#sa#pw";
NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.US);

// Get product name to search for
// TODO: Retrieve and display info for the product

String pname, imageurl, binaryurl, imgSrc, description, reviewDate, comment;
int reviewRating, customerId;
String image1 = "";
String url1 = ""; // Initialize url1
String pid = request.getParameter("id");
double doublevalue = Double.parseDouble(pid);
int intValue = (int) doublevalue;
String sql1 = "SELECT productName, productPrice, productImageURL, productDesc FROM product WHERE productId = ?";
String sql2 = "SELECT reviewRating, reviewDate, customerId, reviewComment FROM review WHERE productId = ?";
String sql3 = "SELECT firstName, lastName FROM customer WHERE customerId = ?";
out.println("<div class = 'product-container'>");
try (Connection con = DriverManager.getConnection(url, uid, pw);
    PreparedStatement pst = con.prepareStatement(sql1); 
    PreparedStatement pst2 = con.prepareStatement(sql2);
    PreparedStatement pst3 = con.prepareStatement(sql3)) {
   // first sql 
    pst.setInt(1, intValue);
    ResultSet rst = pst.executeQuery();

    // review sql 
    pst2.setInt(1, intValue); 
    ResultSet rst2 = pst2.executeQuery(); 
    
    pst3.setInt(1, intValue); 
    ResultSet rst3 = pst3.executeQuery(); 

    if (rst.next()) {
        // product information from sql 
        pname = rst.getString("productName");
        double price = rst.getDouble("productPrice");
        image1 = rst.getString("productImageURL");
        description = rst.getString("productDesc");
        if(image1.equals(null) || image1.length() <= 0) {
                image1 = ""; 
        } else {
            url1 = "displayImage.jsp?id=" + intValue;
            url1 = "displayImage.jsp?id=" + intValue;
            if(intValue == 0 ) {
                out.print("<img src='" + url1 + "'>");
            }
            out.println("<div class = 'product-items'><div class = 'product-image'><img src='" + image1 + "'></div></div>");
        }
        
        out.println("<div class = 'product-items'><div class = 'product-info'><h1>"+pname+"</h1><h4>"+description+"<br>ID: "+intValue+"</h4><h5>"+currency.format(price)+"</h5><br><div style='display: flex; justify-content: space-between;'><a href='addcart.jsp' align='left' class='cart'><button id='shopping2'><h2 align='center'>Add to Cart</h2></button></a><a href='listprod.jsp?productName=' align='left' class='shopping'><button id='shopping'><h2 align='center'>Continue Shopping</h2></button></a></div></div>");
    }
    out.println("</div></div>");
    out.println("<h1 align='center'>Reviews</h1>");
     if(!rst2.next()){
        out.println("<h3 align='center'>No reviews yet!</h3>");
    }
    out.println("<div class = 'reviews'><div class = 'review-container'>");
    while (rst2.next()) {
         //review product information from sql2 
        reviewRating = rst2.getInt(1);
        reviewDate = rst2.getString(2);
        customerId = rst2.getInt(3); 
        comment = rst2.getString(4); 
        out.println("<div class = 'item'>");
        String customerName = "";
        if(rst3.next()) {
            customerName = rst3.getString(1) + " " + rst3.getString(2);
            out.println("<h2>"+customerName+"</h2>");
        }
        out.println("<h3>"+reviewRating+"</h3><p>"+comment+"</p></div>");
    }
    out.println("</div></div>");
    // TODO: If there is a productImageURL, display using IMG tag
        // TODO: Retrieve any image stored directly in the database.
        // Note: Call displayImage.jsp with product id as a parameter.

    rst.close();
    rst2.close();
} catch (SQLException ex) {
    out.println("SQLException: " + ex);
}

String rnav = "addingreview.jsp?id=" + pid; 
String link = "<a href='" + rnav + "' class='reviewbutton'>Add Review</a>";
// TODO: add links to Add to Cart and Continue Shopping

%>
<br> 
</body>
</html>
<div class = 'card-container'>
    <div class = 'item'>
    </div>
</div>
