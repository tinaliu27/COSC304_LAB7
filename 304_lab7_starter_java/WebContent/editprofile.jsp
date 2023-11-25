<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("username");

    // Get the user's current details
    String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
    String uid = "sa";
    String pw = "304#sa#pw";
    Connection con = DriverManager.getConnection(url, uid, pw);
    PreparedStatement pstmt = con.prepareStatement("SELECT customerId, firstName, lastName, email, phoneNum, address, city, state, postalCode, country, userid FROM customer WHERE userid = ?;");
    pstmt.setString(1, userName);
    ResultSet rst = pstmt.executeQuery();
    rst.next();
%>
<form action="updateProfile.jsp" method="post">
    <input type="hidden" name="username" value="<%= userName %>">
    First Name: <input type="text" name="firstName" value="<%= rst.getString(2) %>"><br>
    Last Name: <input type="text" name="lastName" value="<%= rst.getString(3) %>"><br>
    Email: <input type="text" name="email" value="<%= rst.getString(4) %>"><br>
    Phone Number: <input type="text" name="phoneNum" value="<%= rst.getString(5) %>"><br>
    Address: <input type="text" name="address" value="<%= rst.getString(6) %>"><br>
    City: <input type="text" name="city" value="<%= rst.getString(7) %>"><br>
    State: <input type="text" name="state" value="<%= rst.getString(8) %>"><br>
    Postal Code: <input type="text" name="postalCode" value="<%= rst.getString(9) %>"><br>
    Country: <input type="text" name="country" value="<%= rst.getString(10) %>"><br>
    <input type="submit" value="Update Profile">
</form>
<%
    rst.close();
    pstmt.close();
    con.close();
%>