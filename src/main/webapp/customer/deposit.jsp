<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deposit</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/openAc.css">
</head>
<body>
<%
	long ac = (Long)session.getAttribute("acno");
	String error=(String)request.getAttribute("error");
	String success1=(String)request.getAttribute("success");
	
	if(error != null){
%>
<h3 style="color:red;"><%=error %></h3>
<%
	}
	if(success1 !=null){
%>
<h3 style="color:green;"><%=success1 %></h3>
<%  } %>

<br><br>

<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Back to Dashboard</button>

<h2>Deposit Amount</h2>
	<form action="DepositServlet" method="post">
		<label for="accountNo" >Enter Account No.</label><br>
		<input type="text" name="acno"  value="<%=ac %>"  readonly><br>
		
		<label for="deposit">Enter Deposit Amount</label><br>
		<input type="text" name="damount" required><br>
		
		<button type="submit">Deposit</button>
		<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Cancel</button>
		
	
	</form>
</body>
</html>