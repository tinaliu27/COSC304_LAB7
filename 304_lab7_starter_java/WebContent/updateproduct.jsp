<%@ page import="java.sql.*" %>
<%
String productId = request.getParameter("productId");
String productName = request.getParameter("productName");
String productPrice = request.getParameter("productPrice");
String productDesc = request.getParameter("productDesc");

// Basic validation
if (productId == null || productId.trim().isEmpty() || 
    productName == null || productName.trim().isEmpty() || 
    productPrice == null || productPrice.trim().isEmpty() || 
    productDesc == null || productDesc.trim().isEmpty()) {
    out.println("All fields are required.");
    return;
}

try {
    // Parse the productId and productPrice to their appropriate types
    int parsedProductId = Integer.parseInt(productId);
    double parsedProductPrice = Double.parseDouble(productPrice);

    String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
    String uid = "sa";
    String pw = "304#sa#pw";

    try (Connection con = DriverManager.getConnection(url, uid, pw);
        PreparedStatement pstmt = con.prepareStatement("UPDATE product SET productName = ?, productPrice = ?, productDesc = ? WHERE productId = ?")) {
        pstmt.setString(1, productName);
        pstmt.setDouble(2, parsedProductPrice);
        pstmt.setString(3, productDesc);
        pstmt.setInt(4, parsedProductId);
        pstmt.executeUpdate();
    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
        return;
    }

    // Redirect to the admin page after the product is updated
    response.sendRedirect("admin.jsp");
} catch (NumberFormatException ex) {
    out.println("Product ID and price must be valid numbers.");
}
%>