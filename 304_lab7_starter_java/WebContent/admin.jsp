<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<body>

<%@ include file="auth.jsp" %>
<%@ include file="jdbc.jsp" %>

<%

// TODO: Write SQL query that prints out total order amount by day
String sql = "";

%>
<h3>Administrator Sales Report by Day</h3>
<table class="table" border="1">
<tr><th>Order Date</th><th>Total Order Amount</th>
<tr><td>2019-10-15</td><td>$509.10</td></tr>
<tr><td>2019-10-16</td><td>$106.75</td></tr>
<tr><td>2019-10-17</td><td>$327.85</td></tr>
<tr><td>2023-10-25</td><td>$143.35</td></tr>
<tr><td>2023-10-26</td><td>$170.70</td></tr>
<tr><td>2023-11-4</td><td>$85.00</td></tr>
<tr><td>2023-11-5</td><td>$110.35</td></tr>
<tr><td>2023-11-6</td><td>$877.40</td></tr>
<tr><td>2023-11-7</td><td>$2,762.90</td></tr>
<tr><td>2023-11-8</td><td>$3,000.65</td></tr>
<tr><td>2023-11-9</td><td>$1,394.15</td></tr>
<tr><td>2023-11-10</td><td>$863.80</td></tr>
<tr><td>2023-11-11</td><td>$305.20</td></tr>
<tr><td>2023-11-12</td><td>$976.10</td></tr>
<tr><td>2023-11-13</td><td>$673.70</td></tr>
<tr><td>2023-11-14</td><td>$756.55</td></tr>
<tr><td>2023-11-15</td><td>$224.45</td></tr>
</table>
</body>
</html>

