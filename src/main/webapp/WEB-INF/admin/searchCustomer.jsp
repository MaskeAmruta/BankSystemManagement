<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="model.Customer" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search customer</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/searchCustomer.css" />
</head>
<body>
	<form action="SearchCustomer" method="post">
		<label>Customers Account No</label>
		<input type="text" name ="acno">
		
		<button type="submit" >Search</button>
	</form>

<% Customer c1 =(Customer)request.getAttribute("customer");
	if(c1 != null)
	{
%>
	<table>
		 <tr>
	        <th>Account No</th>
	        <th>Full Name</th>
	        <th>Date Of Birth</th>
	        <th>Gender</th>
	        <th>Addhar No</th>
	        <th>Pan No</th>
	        <th>Mobile No</th>
	        <th>Account Type</th>
	        <th>Opening Balance</th>
	        <th>AcOpen Date</th>
	        <th>Status</th>
   		 </tr>
		
	
		<tr>
			<td><%=c1.getAcno() %></td>
			<td><%=c1.getFullName() %></th>
			<th><%=c1.getDob() %></td>
			<td><%=c1.getGender() %></td>
			<td><%=c1.getAdharno() %></td>
			<td><%=c1.getPanno() %></td>
			<td><%=c1.getMobileNo() %></td>
			<td><%=c1.getAcType() %></td>
			<td><%=c1.getOpenBal() %></td>
			<td><%=c1.getAcOpenDate() %></td>
			<td><%=c1.getStatus() %></td>			
	
	<% } else { %>
		<td>Record Not found</td>
	
	<% } %>
			</tr>
	</table>

<br><br>

<button type="button" onClick="location.href='${pageContext.request.contextPath}/AdminDashboardServlet'"> Back </button>
</body>
</html>