<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transfer amount</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/openAc.css">
</head>
<body>
<%
	Long ac =(Long)session.getAttribute("acno");
%>

<%
	String error = (String)request.getAttribute("error");
	String error1 =(String)request.getAttribute("error1");
	String success1= (String)request.getAttribute("success");
	
	if(error != null){
%>
<h3 style="color:red;"><%= error %></h3>
<% }
	
	if(error1 !=null){
	%>
<h3 style="color:blue;"><%= error1 %></h3>
<% } 

	if(success1 != null){
	%>
<h3 style="color:green;"><%=success1 %></h3>
<% } %>


<h2>Transfer Amount</h2>

<form action="TransferAmount" method="post">

		<label for="senderAc" >Senders Account No.</label><br>
		<input type="text" name="sender" value="<%=ac %>"  readonly/><br>
		
		
		<label for="reciverAc" >Recivers Account No.</label><br>
		<input type="text" name="reciver" required /><br>
		
		<label for="withdrawal">Enter Transfer Amount</label><br>
		<input type="text" name="tamount" required /><br>
		
		<button type="submit">Transfer</button>
		<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Cancel</button>

</form>

</body>
</html>