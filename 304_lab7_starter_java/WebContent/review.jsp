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
    <title>Adding Review</title> 
<style>
</style> 
 </head>
 <body>
    <header>
        <h1>Left a Review</h1>
    </header> 
    <%@ include file="jdbc.jsp" %>
    <%
        String pname = request.getParameter("productName");
        String cid = request.getParameter("customerId"); 
        String rating = request.getParameter("rating"); 
        String review = request.getParameter("review"); 

        int pid = 1; 
        // Make connection
        String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
        String uid = "sa";
        String pw = "304#sa#pw";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String formattedDate = dateFormat.format(date);
        ArrayList<Object> product;
        String addreview = "INSERT INTO review (reviewRating, reviewDate, customerId, productId, reviewComment) VALUES (?, ?, ?, ?, ?)"; 
        String getproductid = "SELECT productId FROM product WHERE productname = ?"; 
        try (Connection con = DriverManager.getConnection(url, uid, pw); 
            Statement stmt = con.createStatement(); ) {            
                PreparedStatement pst1 = con.prepareStatement(getproductid); 
                pst1.setString(1, pname); 
                ResultSet rst1 = pst1.executeQuery();
                while(rst1.next()) {
                    pid = rst1.getInt(1);
                }
                PreparedStatement pst = con.prepareStatement(addreview);
                pst.setInt(1, Integer.parseInt(rating)); 
                pst.setString(2, formattedDate); 
                pst.setString(3, cid); 
                pst.setInt(4, pid);
                pst.setString(5, review); 
                int rowsAffected = pst.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("Review added successfully!");
                } else {
                    out.println("Failed to add review.");
                }
        } catch (SQLException ex) {
            out.println("SQLException: " + ex); 
        }

    %>
 </body> 
 </html> 