<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<style >
	h3{
	margin-top:10%;
	font-size: 30px;
	color:red;
	text-align:center;
	}
	
	button{
	width: 20%;
	margin-left: 40%;
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
<body>
<% 	double am = (Double)request.getAttribute("lamount");
	String error1 = (String)request.getAttribute("error"); %> 

<% if(am == 0){%>
<h3> <%=error1 %></h3>
<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Go Back</button>
<% } %>


</body>
</html>