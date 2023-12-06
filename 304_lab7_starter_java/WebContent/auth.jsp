<style>

</style>
<%
	boolean authenticated = session.getAttribute("authenticatedUser") == null ? false : true;

	if (!authenticated)
	{
		String loginMessage = "You have not been authorized to access the URL <br>"+request.getRequestURL().toString();
        session.setAttribute("loginMessage",loginMessage);        
		response.sendRedirect("login.jsp");
	}
%>
