<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.LoanAcDetails" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lone application</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/openAc.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/loanCalculate.js">


</script>

</head>
<body>
<% LoanAcDetails ld=(LoanAcDetails)request.getAttribute("ldetails"); %>

<h2>Lone Application</h2>

<form action="ApplicationLone" method="post" onsubmit="return validLoan()" >
	<label> Full Name: </label><input type="text" name="fname" value="<%=ld.getFullName() %>" readonly><br><br>
	<label> Account No: </label><input type="text" name="acno" value="<%=ld.getAcno() %>" readonly ><br><br>
	<label>Salary:</label><input type="text" name="sal" value="<%=ld.getSalary() %>" readonly ><br><br>
	<label> Lone Type: </label>
		<select name="ltype" required>
			<option>Home Loan</option>
			<option>Vehicle Loan</option>
			<option>Personal Loan</option>
			<option>Gold Lone</option>
		</select><br><br>
		
	<label>Lone Amount: </label><input type="text" id="lamount" name="lamount" value="<%=ld.getLoanAmount() %> " readonly><br>
	
	<label>Required Loan Amount:</label><input type="text" id="reqamount" name="reqamount"  required >
		<p id="errorMsg" style="color:red; font-size:12px;"></p>
	
	<label>Interest Rate:</label><input type="text" id="rate" name="rate" value="<%=ld.getInteresRate() %>" required><br>
	
	<label>Current Date:</label><input type="date" id="startDate" name="startDate"  readonly><br>
	
	<label>Tenure Year:</label><input type="text" id="tyear" name="tyear" onkeyup="endDateCalulate()"  required><br>
	
	<label>End Date:</label><input type="date" id="endDate" name="endDate"  readonly><br>
	
	<label>EMI Amount:</label><input type="text" id="emi" name="emi" readonly><br>
	
	<button type="submit">Apply</button>
	<button type="button" onClick="location.href='${pageContext.request.contextPath}/CustomerDashboardServlet'">Cancel </button>
</form>


<script type="text/javascript">
function validLoan(){
	var sanAmount = parseInt(document.getElementById("lamount").value);
	var amount =parseInt(document.getElementById("reqamount").value);
		
	if(amount > sanAmount){
		document.getElementById("errorMsg").innerHTML = "Loan amount exceeds sanctioned amount.";
		document.getElementById("reqamount").focus();
		
	//	console.log("Loan amount exceeds sanctioned amount.");
		return false ;
		}	
	
	return true;
	}
	

</script>


</body>
</html>