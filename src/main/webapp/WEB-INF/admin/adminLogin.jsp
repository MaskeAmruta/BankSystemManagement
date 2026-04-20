<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/openAc.css">

</head>
<body>
<% String error1 = (String) request.getAttribute("error");
	if(error1 != null){
%>

</head>
<body>
	<h3> <%= error1 %></h3>
<% } %>

<div class="log-form">
	
	<form action="AdminLoginServlet" method="post" >
		<h2>Admin Login</h2>
			
		<label> Admin Name:</label>
		<input type="text" name="adminname"  required/>
		
		<label> Password: </label>
		<input type="password" name="password"  required />
		
		<button type="submit">Login</button>
		<button type="button" onClick="location.href='index.jsp'">Cancel</button>
	</form>
</div>
	

</body>
</html>