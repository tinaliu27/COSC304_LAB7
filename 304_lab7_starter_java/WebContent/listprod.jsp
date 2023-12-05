<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery</title>
<style>

body{
    background: url("img/textured.png");
    position: absolute; 
    background-size: cover;
    background-repeat: repeat; 
    top: 0; 
    left: 0;  
    z-index: -1; 
    object-fit: cover; 
}
h1{
    text-align: center;
    align-items: center; 
    color: rgb(255,105,180); 
    margin: 0 auto;
}
h2{
    font-size: 2.2em; 
    margin: 10px 0px;
}
h4{
    margin: 0 auto; 
    font-size: 1.0em; 
}
p {
    font-size: 0.7em; 
}
.link{
    width: 20px; 
    word-break: break-all;
}
.form .Beverages {
    color: red; 

}
.form .Condiments {
    color: blue; 
}
h4{
    font-size: 2em; 
}
.card-container {
    width: 100%;
    margin: 50px auto; 
    padding: 50px auto;
}
.card-container:after {
  content: "";
  display: table;
  clear: both;

}
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 100%; 
  height: 550px;
  display: block; 
  text-align: left; 
  align-items: center; 
  margin-bottom: 20px; 
  background-color: white;
}
.column {
  float: left;
  width: 30%;
  padding: 0 20px;
}
.card .image{
    height: fit-content; 
    width: 100%; 
    margin: 0 auto;
    padding: 0 auto;
}
.card img{
    height: 200px;
    width: 100%; 
    object-fit: cover;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.product-container {
  padding: 0px 20px; 
  height: fit-content; 
  margin: 0 auto; 
}
.product-container h4{
    font-size: 1.5em; 
}
input[type=text] {
  padding: 10px;
  font-size: 2.0rem;
  border: 1px solid black;
  border: none;
  background: transparent;
  margin: 0;
  padding: 7px 8px;
  border: 1px solid transparent;
  border-radius: inherit;
}
button[type="submit"] {
  text-indent: -999px;
  overflow: hidden;
  width: 40px;
  padding: 0;
  margin: 0;
  border: 1px solid transparent;
  border-radius: inherit;
  background: transparent url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' class='bi bi-search' viewBox='0 0 16 16'%3E%3Cpath d='M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z'%3E%3C/path%3E%3C/svg%3E") no-repeat center;
  cursor: pointer;
  opacity: 0.7;
}
button[type="submit"]:hover {
  opacity: 1;
  transition: 0.5s ease transform; 
  transform: scale(1.2);
}


button[type="submit"]:focus,
input[type="search"]:focus {
  box-shadow: 0 0 3px 0 #1183d6;
  border-color: #1183d6;
  outline: none;
}
.searchbar{
    align-items: center; 
    text-align: center; 
    display: flex; 
    justify-content: center;
    margin: 0 auto; 
}
.searchbar:hover {
    box-shadow: 2px 3px 3px 2px gray; 
    background-color: white; 
    opacity: .7; 
}
.searching{
    display: inline-block; 
    flex: 1;
}
.reset {
    background-color: #FFFFFF; 
    border: 2px solid black; 
    border-radius: 10px; 
    cursor: pointer; 
    font-size: 20px; 
    margin: 0;
    opacity: .5; 
    text-align: center; 
    padding: 7px 40px; 
}
.reset:hover{
    opacity: 1; 
}
.searchings {
    margin-top: 10px; 
    display: flex; 
    width: 100%; 
    flex-direction: row; 
    margin-top: 10px; 
    justify-content: space-between; 
}
.searchings .searching1 {
    display: flex; 
        margin: 0;


}
.searchings .searching2 {
    display: flex; 
        margin: 0;



}
.top{
    width: fit-content;
    height: fit-content; 
    align-items: center; 
    display: block; 
    justify-content: center;
}
.top-container{
    width: 100%;
    align-items: center; 
    justify-content: center;
    display: flex;
}
.searching1 .dropdown {
    font-size: 1.2em;
    padding: 8px;
    border: 1px solid black;
    border-radius: 5px;
    background-color: #fff;
    color: #333;
}
.searching1 .dropdown option{
    padding: 10px;

}
.adding {
    text-align: center; 
    align-items: center; 
}
.adding button{
    padding: 12px 60px; 
    background-color: black; 
    color: white; 
    border-radius: 16px; 
    box-sizing: border-box; 
    font-size: 30px; 
    margin: 0; 
    border: 1px solid black; 
}
.adding button:hover{
    background-color: white; 
    color: black; 
}
.product {
    text-align: center; 
    align-items: center; 
    margin-top: 0 auto; 
    padding-top: 5px ; 
}

.product a{
      margin-top: 0 auto; 
    padding-top: 0 auto; 
    color: inherit; 
    font-size: 20px; 
}
.product:hover a{
  text-decoration-color: rgba(255, 255, 255, 1);
}
.footer{
    bottom: 0;
    position: relative; 
    width:100%; 
    display: block; 
}

</style>
</head>
<body>
<%@ include file="headertransparent.jsp" %>
<h2 style="text-align: center; padding-top: 90px; padding-bottom: 10px;">Browse Our Products</h2>
<p style="text-align: center; font-size: 1.2em; padding-bottom: 10px; "><i>Leave blank for all products</i></p>
<!--https://codepen.io/huange/pen/bGqMqM -->
</h2>
<form method="get" action="listprod.jsp" align="center">
    <div class = "top-container">
    <div class = "top">
        <div class = "searchings">
            <div class="searchbar" style="width: fit-content; height: fit-content; border: 1px solid black;" >
                <input type="text" name="productName" size="50" placeholder="Enter Product Name...">
                <button type="submit" value="Submit">Search</button>
            </div>
        </div>
        <div class = "searchings">
            <div class = "searching1">
                <select size = "1" name="categoryName" style="font-size: 1.2em;" class="dropdown">
                    <option value = "All">All</option> 
                    <option value = "Classic Pet Rocks"">Classic Pet Rocks</option> 
                    <option value = "Celebrity Lookalikes" ">Celebrity Lookalikes</option> 
                    <option value = "Animal Lookalikes"">Animal Lookalikes</option> 
                    <option value = "Professor Lookalikes"">Professor Lookalikes</option> 
                    <option value = "Unique Pet Rocks"">Unique Pet Rocks</option> 
                    <option value = "Build your own pet rock kit"">Build your own pet rock kit</option> 
                    <option value = "Accessories">Accessories</option> 
                    <option value = "New">New</option>
                </select>
            </div>
            <div class = "searching2">
                <button type="reset" value="reset" class="reset">Reset</button>
            </div> 
        </div>
    </div>
    </div>
</form>


<% // Get product name to search for
String name = request.getParameter("productName");
String category = request.getParameter("categoryName");

        
//Note: Forces loading of SQL Server driver
try
{   // Load driver class
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
    out.println("ClassNotFoundException: " +e);
}

// Variable name now contains the search string the user entered
// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!

// Make the connection
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa";
String pw = "304#sa#pw";
Double id; 
String sql = ""; 
    if(category == null || category.equals("All")) {
        sql = "SELECT productName, productPrice, productId, categoryName, productImageURL, productDesc FROM product AS P JOIN category AS C ON P.categoryId = C.categoryId WHERE productName LIKE ?"; 
    } else {
        sql = "SELECT P.productName, P.productPrice, P.productId, categoryName, productImageURL, productDesc FROM product AS P JOIN category AS C ON P.categoryId = C.categoryId WHERE C.categoryName = ? AND P.productName LIKE ?";
    }
String rnav = "addingreview.jsp?"; 
    String links = "<a href='" + rnav + "'>Add Review</a>";
if(category == null) {
} else {
out.println("<h2 align='left' style='margin-left: 20px; margin-bottom: 0px; padding-bottom: 0px; text-align: center;'>"+category+"</h2>");
}

try (Connection con = DriverManager.getConnection(url, uid, pw);
    PreparedStatement pstmt = con.prepareStatement(sql);) {
    if(category != null && !category.equals("All")) {
        pstmt.setString(1, category);
        pstmt.setString(2, "%" + name + "%");
    } else {
        pstmt.setString(1, "%" + name + "%");

    }
    ResultSet rst = pstmt.executeQuery();
    NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.US);
    // out.println("<table class = 'table1'><tr><th></th><th>Product Name</th><th>Categories</th><th>Price</th></tr>");
        out.println("<div class = 'card-container'>");
        while(rst.next()) {
            String pname = rst.getString(1);
            Double price = rst.getDouble(2); 
            String price2 = currency.format(price);
            id = rst.getDouble(3);
            String category1 = rst.getString(4);
            String imageurl = rst.getString(5); 
            String pdesc = rst.getString(6); 
            // out.println("<tr><td>"+rst.getString); 
            String nav = "addcart.jsp?id=" + id + "&name=" + URLEncoder.encode(pname, "UTF-8") + "&price=" + price + "&desc=" + pdesc + "&image=" + imageurl;
            String pnav = "product.jsp?id=" + id; 
            String link = "<div class = 'adding'><a href='" + nav + "'><button type='button'>Add to Cart</button></a></div>";
            String product = "<div class = 'product'><a href='" + pnav + "'>Product Info</a></div>";
            // out.println("<tr><td><h5 style='width: 100px; margin: 0 auto; text-align: left'>"+ link + "</h5></td><td><h3 style='width: 600px'>" + product +"</h3></td><td><h4 style='width: 500px'>"+category1+"</h4></td><td><h5>"+ price2 +"</h5></td></tr>");
            out.println("<div class='column'><div class='card'><div class ='image'><img src='"+ imageurl + "'></div><div class='product-container'><h2><b>"+pname+"</b></h2><h4>$"+price+"0</<h4><p>"+pdesc+"</p></div><div class='footer'><p>"+link+"\n"+product+"</p></div></div></div>");
        }
        out.println("</div>");
    rst.close();

} catch (SQLException ex) {
    out.println("SQLException: " + ex.getMessage());
}


// Print out the ResultSet

// For each product create a link of the form
// addcart.jsp?id=productId&name=productName&price=productPrice
// Close connection

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0)); // Prints $5.00
%>
</body>
</html>