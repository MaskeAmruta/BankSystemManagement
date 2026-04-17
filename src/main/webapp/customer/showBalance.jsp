<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="model.Customer" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer details</title>
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
<body>

<% 
	Customer c1 = (Customer)request.getAttribute("customer");
%>
	
	<table>
		<caption>Customer Details</caption>
		<tr>
			<th>Customer Name</th>
			<td><%= c1.getFullName() %></td>
		</tr>
		<tr>
			<th>Account No</th>
			<td><%=c1.getAcno() %></td>
		</tr>
		<tr>
			<th>Current Balance</th>
			<td><%=c1.getOpenBal() %></td>
		</tr>
	</table>

<br><br><br>
<a href="${pageContext.request.contextPath }/customer/customerDashboard.jsp">Back</a>
<a href="${pageContext.request.contextPath}/MiniStatement">Mini Statement</a>


<br><br>
 	  <form action="RequestToDeleteAccountServlet" method="post">
      		<input type="hidden" name="acn" value="<%=c1.getAcno() %>" readonly >
      		<button type="submit" onClick="return confirm('Are you sure to delete ?')">Request To Close A/c</button>	
      </form> 
</body>
</html>