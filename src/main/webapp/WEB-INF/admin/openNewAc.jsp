<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>open-new-account</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/openAc.css">
</head>
<body>
<h2>Open New Account</h2>

<form name="acform" action="${pageContext.request.contextPath }/AddCustomerServlet" 
	  method="post">

	<label>Enter full Name:</label>
	<input type="text" name="fname" required/><br>
	
	<label>Date-of-birth:</label> 
	<input type="date" name="dob" required /><br>
	
	<label>Gender:</label> 
	 <input type="radio" name="gender" value="Female" />Female
	 <input type="radio" name="gender" value="Male" />Male<br>
	
	<label>Aadhar No:</label> 
	<input type="text" name="adharno" id="adharno" placeholder="Enter 12 digit adhar no" required/>
	<span id="adharError" style="color:red;"></span>
	
	<label>Pan No:</label>
	<input type="text" name="panno" id="panno" placeholder="DFERTG1234G" required/>
	<span id="panError" style="color:red;"></span>
	
	
	<label>Mobile No:</label>
	<input type="text" name="mobileno" id="mobileno"  required/>
	<span id="mobileError" style="color:red;"></span>
	
	<label>Account type</label>
		<select name="actype">
			<option>select-type</option>
			<option>Saving</option>
			<option>Current </option>
			<option>Salary </option>
			<option>Business</option>
		</select><br>
	
	<label>Opening Balance</label>
	<input type="text" name="openbal" id="openbal"  required/>
	<span id="openBalError" style="color:red;"></span>
		
	<button type="submit" onclick="return validateForm()">Save</button>
	<button type="button" onClick="location.href='${pageContext.request.contextPath}/AdminDashboardServlet'">Cancel</button>

</form>

<script>
	function validateForm(){
		let mobile = document.getElementById("mobileno").value;
		let mobilePattern = /^[0-9]{10}$/;
		
		let pan = document.getElementById("panno").value;
		let panPattern = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
		
		let adharNo =document.getElementById("adharno").value;
		let adharPattern = /^[0-9]{12}$/;
	
		let openBal = document.getElementById("openbal").value;
		
		
		valid = true;
		
		if(!mobile.match(mobilePattern)){
			document.getElementById("mobileError").innerHTML= "Enter 10 digit Mobile No";
			valid = false;
		}
		
		
		if(!pan.match(panPattern)){
			document.getElementById("panError").innerHTML = "Check Pan card Format";
			valid =false;
		}
		if(!adharNo.match(adharPattern)){
			document.getElementById("adharError").innerHTML ="Invalid Adhar No.";
			valid =false;
		}	
		
		if(openBal <= 1000){
			document.getElementById("openBalError").innerHTML ="Opening Balance grater than Rs.1000 ";
			console.log(openBal);
			valid =false;
		}
		
		return valid;
		
	}


</script>

</body>
</html>