<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-Up</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<style>
button{
	width: 40%;
	margin:10px;
    padding: 10px;
    background-color: #1f4fa3;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}
</style>

</head>
<% String errorpass =(String)request.getAttribute("matchpass"); %>
<body>
	<% if(errorpass !=null){ %>
	<h3><%=errorpass %></h3>
	<% } %>
	
<div class="log-form">	
<h2>Sign-Up Here</h2>
<form action="CustomerSignupServlet" method="post">
	<label>Account No:</label>
	<input type="number" name="acno"  required /><br>
	
	<label>Set Password</label>
	<input type="password" name="password" required />
	
	<label>Conform Password</label>
	<input type="password" name="passConfarm" required />
	
	<button type="submit">Sign-Up</button>
	<button type="button" onclick="location.href='index.jsp'">Cancel</button><br><br>
	
	<p>Already Have Account  <a href="login.jsp"> Login </a></P>
	
</form>

</div>

</body>
</html>