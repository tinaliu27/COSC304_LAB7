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
    <title>Ray's Grocery - Product Information</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>

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

try (Connection con = DriverManager.getConnection(url, uid, pw);
    PreparedStatement pst = con.prepareStatement(sql1); 
    PreparedStatement pst2 = con.prepareStatement(sql2)) {
   // first sql 
    pst.setInt(1, intValue);
    ResultSet rst = pst.executeQuery();

    // review sql 
    pst2.setInt(1, intValue); 
    ResultSet rst2 = pst2.executeQuery(); 
    

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
            if(intValue > 2) {
                out.print("<img src='" + url1 + "'>");
            }
            out.println("<img src='" + image1 + "'>"); 

        }
        out.println("<h1>" + pname + "</h1>");
        out.println("<h4>" + description + "</h4>");
        out.println("<h4>ID: " + intValue + "</h4>");
        out.println("<h4>" + currency.format(price) + "</h4>");
    }
    out.println("<h1>Reviews</h1>");
    if (rst2.next()) {
         //review product information from sql2 
        reviewRating = rst2.getInt(1);
        reviewDate = rst2.getString(2);
        customerId = rst2.getInt(3); 
        comment = rst2.getString(4); 
        out.println("<h2>" + reviewRating +"/ 5</h2>\n");
        out.println("<h4>"+comment+"</h4>\n");
        out.println("<h4>"+customerId+"</h4>\n");
    }
    // TODO: If there is a productImageURL, display using IMG tag
        // TODO: Retrieve any image stored directly in the database.
        // Note: Call displayImage.jsp with product id as a parameter.

    rst.close();
    rst2.close();
} catch (SQLException ex) {
    out.println("SQLException: " + ex);
}

// TODO: add links to Add to Cart and Continue Shopping

%>
<br> 
<a href="addcart.jsp" align="left" class="cart">
        <button id = "shopping2">
                <h2 align="center">Add to Cart</h2>     
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
