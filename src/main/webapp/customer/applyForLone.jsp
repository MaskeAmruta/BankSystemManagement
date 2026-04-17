<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>apply for lone</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/openAc.css">
</head>
<body>
<% 	double am = (Double)request.getAttribute("lamount");
	double rate =(Double)request.getAttribute("interestRate");	
	%>

<h2>Apply for Lone</h2>

<form action="ApplicationLone">

	<label>Your Sanctioned Lone is Rs.<%=am %> </label><br>
	<label>And Interest Rate is  <%=rate %></label><br><br>
	<button type="submit" >Apply for Lone</button>
	<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Cancel </button>
		
</form>

</body>
</html>