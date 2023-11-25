<!DOCTYPE html>
<html>
<head>
<title>Create Account</title>
</head>
<body>
<div style="margin:0 auto;text-align:center;display:inline">

<%@ include file="jdbc.jsp" %>
<h3>Account Registration</h3>
<form name="MyForm" method=post action="validateSignup.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Username:</font></div></td>
	<td><input type="text" name="username"  size=10 maxlength=10></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Password:</font></div></td>
	<td><input type="password" name="password" size=10 maxlength="10"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Confirm Password:</font></div></td>
    <td><input type="password" name="password2" size=10 maxlength="10"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">First Name:</font></div></td>
    <td><input type="text" name="firstname" size=20 maxlength="20"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Last Name:</font></div></td>
    <td><input type="text" name="lastname" size=20 maxlength="20"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Email:</font></div></td>
    <td><input type="text" name="email" size=20 maxlength="20"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Phone Number:</font></div></td>
    <td><input type="text" name="phonenum" size=20 maxlength="20"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Address:</font></div></td>
    <td><input type="text" name="address" size=20 maxlength="20"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">City:</font></div></td>
    <td><input type="text" name="city" size=20 maxlength="20"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">State:</font></div></td>
    <td><input type="text" name="state" size=20 maxlength="20"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Postal Code:</font></div></td>
    <td><input type="text" name="postalcode" size=20 maxlength="20"></td>
</tr>
<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Country:</font></div></td>
    <td><input type="text" name="country" size=20 maxlength="20"></td>
</tr>
</table>

</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="Sign up">
</form>
<%
    String signupMessage = (String) session.getAttribute("signupMessage");
    session.removeAttribute("signupMessage"); // remove the attribute after retrieving it
%>

<% if (signupMessage != null) { %>
    <p><%= signupMessage %></p>
<% } %>

</div>

</body>
</html>


