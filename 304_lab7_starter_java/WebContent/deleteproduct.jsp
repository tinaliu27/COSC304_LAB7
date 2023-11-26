<%@ page import="java.sql.*" %>
<%
String productId = request.getParameter("productId");

// Basic validation
if (productId == null || productId.trim().isEmpty()) {
    out.println("Product ID is required.");
    return;
}

try {
    // Parse the productId to its appropriate type
    int parsedProductId = Integer.parseInt(productId);

    String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
    String uid = "sa";
    String pw = "304#sa#pw";

    try (Connection con = DriverManager.getConnection(url, uid, pw)) {
        // First, delete all rows in orderproduct, incart and productinventory that reference the product
        try (PreparedStatement pstmt = con.prepareStatement("DELETE FROM orderproduct WHERE productId = ?")) {
            pstmt.setInt(1, parsedProductId);
            pstmt.executeUpdate();
        }
        try (PreparedStatement pstmt = con.prepareStatement("DELETE FROM incart WHERE productId = ?")) {
            pstmt.setInt(1, parsedProductId);
            pstmt.executeUpdate();
        }
        try (PreparedStatement pstmt = con.prepareStatement("DELETE FROM productinventory WHERE productId = ?")) {
            pstmt.setInt(1, parsedProductId);
            pstmt.executeUpdate();
        }

        // Then, delete the product
        try (PreparedStatement pstmt = con.prepareStatement("DELETE FROM product WHERE productId = ?")) {
            pstmt.setInt(1, parsedProductId);
            pstmt.executeUpdate();
        }
    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
        return;
    }

    // Redirect to the admin page after the product is deleted
    response.sendRedirect("admin.jsp");
} catch (NumberFormatException ex) {
    out.println("Product ID must be a valid number.");
}
%>