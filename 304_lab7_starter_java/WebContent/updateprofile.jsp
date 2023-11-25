<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("username");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phoneNum = request.getParameter("phoneNum");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String postalCode = request.getParameter("postalCode");
    String country = request.getParameter("country");

    // Update the user's details
    String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
    String uid = "sa";
    String pw = "304#sa#pw";
    Connection con = DriverManager.getConnection(url, uid, pw);
    PreparedStatement pstmt = con.prepareStatement("UPDATE customer SET firstName = ?, lastName = ?, email = ?, phoneNum = ?, address = ?, city = ?, state = ?, postalCode = ?, country = ? WHERE userid = ?;");
    pstmt.setString(1, firstName);
    pstmt.setString(2, lastName);
    pstmt.setString(3, email);
    pstmt.setString(4, phoneNum);
    pstmt.setString(5, address);
    pstmt.setString(6, city);
    pstmt.setString(7, state);
    pstmt.setString(8, postalCode);
    pstmt.setString(9, country);
    pstmt.setString(10, userName);
    pstmt.executeUpdate();
    pstmt.close();
    con.close();

    // Redirect back to the customer page
    response.sendRedirect("customer.jsp");
%>