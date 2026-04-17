<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>withdrawal</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/openAc.css">
</head>
<body>
<%
	long ac = (Long)session.getAttribute("acno");

	String error = (String)request.getAttribute("error");
	String success =(String)request.getAttribute("success");
	if(error !=null){
%>
<h3 style="color:red;"><%= error %></h3>
<% }
	
	if(success !=null){
	%>
<h3 style="color:green;"><%= success %></h3>
<% } %>

<br><br>
<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Back to Dashboard</button>

<h2>Withdrawal Amount</h2>
	<form action="WithdrawalServlet" method="post">
		<label for="accountNo" >Enter Account No.</label>
		<input type="text" name="acno" value="<%=ac %>" readonly >
		
		<label for="withdrawal">Enter Withdrawal Amount</label>
		<input type="text" name="wamount" required>
		
		<button type="submit">Withdrawal</button>
		<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Cancel</button>
			
	</form>

</body>
</html>