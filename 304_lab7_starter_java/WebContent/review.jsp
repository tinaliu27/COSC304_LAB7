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
    <!-- adding confetti : https://codepen.io/ieatwebsites/pen/KKBvywP-->
<script src="https://cdn.jsdelivr.net/npm/js-confetti@latest/dist/js-confetti.browser.js"></script>
<style>
body{
  background: url("img/textured.png");
    background-size: cover; 
    text-align: center; 
    align-items: center;
    margin-top: 75px;
    object-fit: cover; 
}
.celebrate{
    display: block; 
    text-align: center; 
    align-items: center; 
    width: 100%; 
    height: fit-content; 

}
.celebrate .celebrate-container{
    display: block; 
    padding: 20px; 
    align-items: center; 
    width: fit-content; 
    margin: 0 auto; 
    background-color: white; 
    box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.5);

}
.celebrate .button-53{
    text-decoration: none; 
    background-color:transparent;
    border: none; 
}
.celebrate img{
    width: 100px; 
    height: 100px; 
    background: transparent; 
}
.celebrate img:hover{
    transform: scale(1.1); 
}
.celebrate .button-2{
    margin: 10px; 
}
.celebrate .button-2:hover{
    box-shadow: 0 0 6px 1px rgba(0, 0, 0, 0.5);

}


</style> 
 </head>
 <body>
    <%@ include file="jdbc.jsp" %>
    <%@ include file="headertransparent.jsp" %>
    <canvas id="confetti"></canvas>
    <%
        String pname = request.getParameter("rock"); // selected rock 
        String cid = request.getParameter("customerId");  // id
        String rating = request.getParameter("star");  // rating 
        String review = request.getParameter("comments"); // commment 

        int pid = 1; 
        String image = ""; 
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
                    image = "img/reviewyes.png"; 
                } else {
                    image = "img/reviewno.png"; 
                }
        } catch (SQLException ex) {
            out.println("SQLException: " + ex); 
        }
        out.println("<div class = 'celebrate'><div class = 'celebrate-container'><button id='button' class='button-53' role='button'><img src = '"+image +"''></button><h1>Thanks for leaving a review!</h1><p>Your feedback helps us improve! :) </p><br><a href='listprod.jsp?productName=' align='left' class='shopping'><button id='shopping' class='button-2' style='background-color: #878686'><h2 align='center'>Continue Shopping</h2></button></a><a href='addingreview.jsp?' align='left' class='shopping'><button id='shopping' class='button-2' style='background-color: #FFD812;'><h2 align='center'>Add Another Review</h2></button></a></div></div>");

    %>
 </body> 
 <script>
    const button = document.querySelector('#button');
    const canvas = document.querySelector('#confetti');

    const jsConfetti = new JSConfetti();

    button.addEventListener('click', () => {
        jsConfetti.addConfetti({
            emojis: ['🪨', '🪨', '🗿'],
        }).then(() => jsConfetti.addConfetti())
    });
 </script> 

 </html> 