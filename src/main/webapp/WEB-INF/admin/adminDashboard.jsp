<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admindashboard.css" />
</head>

<body>

<div class="container">
    <div class="sidebar">
        <h2>Admin</h2>
        
      	<a href="${pageContext.request.contextPath}/admin/openNewAccount">Open New Account</a>
        <a href="${pageContext.request.contextPath}/viewCustomer">View All Customers</a>
        <a href="${pageContext.request.contextPath}/AllRequestServlet">Approve Request</a>
        <a href="${pageContext.request.contextPath }/SearchCustomer">SearchCustomer</a>
        <a href="${pageContext.request.contextPath }/LoanRequest">LoanRequest</a>
        <a href="LogoutServlet">Logout</a>
        
    </div>

    <div class="content">
        <h2>Admin Dashboard</h2>
        
    </div>
</div>

</body>
</html>