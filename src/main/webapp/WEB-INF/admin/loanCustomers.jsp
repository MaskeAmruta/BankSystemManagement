
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="model.LoanAcDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view loan Customers</title>
<style type="text/css">
	.backbtn{
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
	.approved{
		color:green;
		font-weight:bold;
	}
	.pending{
		color:red;
		font-weight:bold;
	}
	
	.rejected{
		color:orange;
		font-weight:bold;
	}
</style>
</head>
<body>
<h2> View Loan Customers</h2>

<table border="1">
	<tr>																																																																																																																																			
		<th>ID</th>
		<th>Customer Name</th>
		<th>Account_no</th>
		<th>Salary</th>
		<th>LoanAmount</th>
		<th>Req_LoanAmount</th>
		<th>LoanType</th>
		<th>TenureYear</th>
		<th>InteresRate</th>
		<th>Emi_amount</th>
		<th>Status</th>
		<th>Action</th>
	</tr>	

<% 	List<LoanAcDetails> loanCustomer = 
		(List<LoanAcDetails>)request.getAttribute("loanCustomer");
	
	if(loanCustomer != null && !loanCustomer.isEmpty())
		{		
			for(LoanAcDetails ld :loanCustomer )
			   {	
					String statusClass = "pending";
					  if("Approved".equalsIgnoreCase(ld.getStatus())){
						  statusClass = "approved";
					  }else if("Rejected".equalsIgnoreCase(ld.getStatus())){
						  statusClass = "rejected";
					  }
%>	
				<tr>
					<td name="loanId"><%=ld.getId() %></td>
					<td><%=ld.getFullName() %></td>
					<td><%=ld.getAcno() %></td>
					<td><%=ld.getSalary() %></td>
					<td><%=ld.getLoanAmount() %></td>
					<td><%=ld.getSanLoanAmount() %></td>
					<td><%=ld.getLoneType() %></td>
					<td><%=ld.getTenureYear() %></td>
					<td><%=ld.getInteresRate() %></td>
					<td><%=ld.getEmi() %></td>
					
					<td id="status<%=ld.getId() %>"
						class ="<%=statusClass %>" >
						
        				<%= ld.getStatus() %>
        			</td>
        			
        			<td>	
	        			<button id="aprovBtn<%=ld.getId() %>"  style="background-color: lightgreen;
	        			 color:blue" 
	        			 onclick="approveLoan(<%=ld.getId() %> )"
	        			 <%="Rejected".equalsIgnoreCase(ld.getStatus()) ? "disabled" : "" %>
	        			 >Approved</button> 
	        			 
	        			 <button id="rejBtn<%=ld.getId() %>" 
		        			 style="background-color:yellow;
		        			 color:blue" 
		        			 onclick="rejectLoan(<%=ld.getId() %>)"
		        			 <%="Approved".equalsIgnoreCase(ld.getStatus()) ? "disabled" : "" %>
	        			 >Rejected</button>
        			 </td>
        			  
				</tr>						
<%	} 
	  }
	else
	{
%>
		<tr>
		     <td colspan="12">No customers found</td>
		</tr>	
<%	} %>

</table>	

<% String error =(String)request.getAttribute("error"); 
	if(error != null){
	
%>
<h3><%=error %></h3>	
		
<% } %>

<button class="backbtn" type="button" onClick="location.href='${pageContext.request.contextPath}/AdminDashboardServlet'"> Back </button>

<script>
	function approveLoan(id){
		fetch('LoanRequest?id=' + id + '&status=Approved',
				{method:'PUT'})
				.then(response => response.text())
				.then(data => {location.reload();
				})
				.catch(error => console.error(error));
				
		document.getElementById("rejBtn" +id).disabled =true;
		
			}
	
	function rejectLoan(id){
		fetch('LoanRequest?id=' + id +'&status=Rejected',
				{method:'PUT'})
				.then(response => response.text())
				.then(data =>{location.reload();
				})
				.catch(error => consol.error(error));
		
		document.getElementById("aprovBtn" +id).disabled =true;
	
	
	}
	
</script>
	
</body>
</html>
