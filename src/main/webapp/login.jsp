<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">


<% String error1 = (String) request.getAttribute("error");
	if(error1 != null){
%>

</head>
<body>
	<h3> <%= error1 %></h3>
<% } %>


<div class="log-form">
	<h2>Login-Here</h2>
	
	<form action="CustomerLoginServlet" method="post">
	
		<label>Account No:</label>
		<input type="number" name="acno"  required />
		
		<label>Password</label>
		<input type="password" name="password" required />
	
	
		<button  type="submit">Login</button>
		<button type="button" onclick="location.href='index.jsp'">Cancel</button>
		
		<p>Don't have Account <a href="signup.jsp"> SignUp </a></P>
	</form>

</div>


</body>
</html>