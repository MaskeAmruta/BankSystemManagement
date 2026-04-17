<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>apply for lone</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/openAc.css">
</head>
<body>
<%
	Customer c1 = (Customer)request.getAttribute("customer");
%>

<h2>Check Sanction Lone Amount</h2>

<form action="ApplyForLone" method="post">
	<label>Account No </label>
	<input type="text"  name="acn" value="<%=c1.getAcno() %>" readonly/>
	
	<label>Account type</label>
	<input type="text" name="acTy" value="<%=c1.getAcType() %>" readonly/>
	
	<label>Monthly Salary</label>
	<input type="text" name="salary" />
	
	<button type="submit">Check Lone Amount</button>
	<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Cancel</button>
</form>

</body>
</html>