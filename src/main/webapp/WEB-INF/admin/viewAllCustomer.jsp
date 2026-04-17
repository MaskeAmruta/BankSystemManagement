<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List"  %>
<%@ page import="model.Customer" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Customers</title>
<style type="text/css">
	button{
	width: 60px;
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

<h2>All Customers</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Account No</th>
        <th>Full Name</th>
        <th>Mobile No</th>
        <th>Account Type</th>
        <th>Opening Balance</th>
        <th>AcOpen Date</th>
        <th>Status</th>
    </tr>

<%
    List<Customer> customers =
        (List<Customer>) request.getAttribute("customers");

    if (customers != null && !customers.isEmpty()) {
        for (Customer c : customers) {
%>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getAcno() %>
        <td><%= c.getFullName() %></td>
        <td><%= c.getMobileNo() %></td>
        <td><%= c.getAcType() %></td>
        <td><%= c.getOpenBal() %></td>
        <td><%= c.getAcOpenDate() %> </td>
        <td style="color:green; font-weight:bold">
        	<%= c.getStatus() %>
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="9">No customers found</td>
    </tr>
<%
    }
%>

</table>


<button type="button" onClick="location.href='${pageContext.request.contextPath}/AdminDashboardServlet'"> Back </button>
</body>
</html>
