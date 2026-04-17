<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Transection" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mini statement</title>
<style>
	body{
	margin:20px;
	padding:20px;
	}
	table{
	border:1px solid gray;
	width:50%;
	}
	th{
	background-color:lightblue;
	font-weight:bold;
	
	}
	th,td{
		border:1px solid gray;
		font-size:20px;
		padding:10px;
		height:20px;
	}
	a{
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
    text-decoration:none;
	}
	
</style>
</head>
<body>

<table>
<h2>Transection History</h2>
	<tr> 
		<th>Id</th>
		<th>Account no</th>
		<th>amount</th>
		<th>Transection Type</th>
		<th>Transection Date</th>
	</tr>

<%  List<Transection> list =(List<Transection>) request.getAttribute("transection");

	for(Transection t2 :list){

%>
	
	<tr>
		<td><%= t2.getId() %></td>
		<td><%=t2.getAcno() %></td>
		<td><%=t2.getAmount() %></td>
		<td><%=t2.getType() %></td>
		<td><%=t2.getDate() %></td>
	</tr>
<% } %>
</table>
<br>
<br><br>

<a href="${pageContext.request.contextPath }/customer/customerDashboard.jsp">Back</a>
</body>
</html>