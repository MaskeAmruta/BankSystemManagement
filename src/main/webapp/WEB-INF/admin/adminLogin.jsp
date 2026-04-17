<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/openAc.css">
</head>
<body>

	<form action="AdminLoginServlet" method="post">
			<h2>Admin Login</h2>
			
		<label> Admin Name:</label>
		<input type="text" name="adminname"  required/>
		
		<label> Password: </label>
		<input type="password" name="password"  required />
		
		<button type="submit">Login</button>
		<button type="button" onClick="location.href='index.jsp'">Cancel</button>
	</form>

</body>
</html>