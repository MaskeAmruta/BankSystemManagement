<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer dashboard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admindashboard.css" />
</head>
<body>
<%
	long ac = (Long)session.getAttribute("acno");
%>
<div class="container">
    <div class="sidebar">
        <h2>Customer </h2>
        
        
      	<a href="${pageContext.request.contextPath}/ShownceServletBala">Account Details</a>
      	<a href="${pageContext.request.contextPath}/DepositServlet">Deposit Amount</a>
      	<a href="${pageContext.request.contextPath}/WithdrawalServlet">Withdrawal Amount</a>
        <a href="${pageContext.request.contextPath}/TransferAmount">Transfer Amount</a>    
        <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
        
</div>
     <div class="content">
        <h2>Customer Dashboard</h2>
        <h4>Account No- <%=ac %></h4>
        
        	 <div class="lone-container">
    			<div class="card">
	    			<h3>Home Lone</h3>
	    			<button type="button" onclick="lone()">Apply for lone</button>
	    		</div>
	    	
		    	<div class="card">
		    		<h3>Vehicle Lone</h3>
		    		<button type="button" onclick="lone()">Apply for lone</button>
		    	</div>
		    	
		    	<div class="card">
		    		<h3>Personal Lone</h3>
		    		<button type="button" onclick="lone()">Apply for lone</button>
		    	</div>
		    	
		    	<div class="card">
		    		<h3>Gold Lone</h3>
		    		<button type="button" onclick="lone()">Apply for lone</button>
		    	</div> 
        
    </div>
      
    </div>
    
<script>
	function lone(){	
		window.location.href="ApplyForLone";	
	}
</script>

</body>
</html>