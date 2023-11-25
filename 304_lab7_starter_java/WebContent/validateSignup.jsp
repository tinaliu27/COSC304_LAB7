<%@ page import="java.sql.*" %>
<%
    // Get form data
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String password2 = request.getParameter("password2");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String email = request.getParameter("email");
    String phonenum = request.getParameter("phonenum");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String postalcode = request.getParameter("postalcode");
    String country = request.getParameter("country");

    // Validate form data
    if(false) {
        session.setAttribute("signupMessage", "Invalid form data.");
        response.sendRedirect("index.jsp");
    } else {
        String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
        String uid = "sa";
        String pw = "304#sa#pw";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Connect to the database
            conn = DriverManager.getConnection(url, uid, pw);

            // Insert the new user into the database
            String sql = "INSERT INTO users (username, password, firstname, lastname, email, phonenum, address, city, state, postalcode, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, firstname);
            pstmt.setString(4, lastname);
            pstmt.setString(5, email);
            pstmt.setString(6, phonenum);
            pstmt.setString(7, address);
            pstmt.setString(8, city);
            pstmt.setString(9, state);
            pstmt.setString(10, postalcode);
            pstmt.setString(11, country);
            pstmt.executeUpdate();

            // Redirect to the login page
            session.setAttribute("signupMessage", "Account created successfully. You can now log in.");
            response.sendRedirect("login.jsp");
        } catch (SQLException ex) {
            // Handle any errors
            session.setAttribute("signupMessage", "An error occurred. Please try again.");
            response.sendRedirect("signup.jsp");
        } finally {
            // Close the database connection
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {}
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {}
            }
        }
    }
%>