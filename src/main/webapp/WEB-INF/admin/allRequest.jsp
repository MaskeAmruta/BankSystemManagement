<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all requests</title>
<style type="text/css">

	.container{
	margin:10px 8px;
	padding: 10px;
	display:flex;
	justify-containt:space-between;
	align-item:center;
	gap:40px;
	}
	.container .card{
	margin:10px 8px;
	padding: 10px;
	border:1px solid blue;
	border-radius:5px;
	box-shadow: 
        0 8px 20px rgba(0, 0, 0, 0.25),
        0 0 0 4px rgba(31, 79, 163, 0.1);

    transition: transform 0.3s ease, box-shadow 0.3s ease;
	}

	.close-btn{
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
	button{
	width: 60px;
	margin:10px;
    padding: 10px;
    background-color: red;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 10px;
    font-weight: bold;
    cursor: pointer;
    }
</style>
</head>
<body>
<div class="container">
	<div class="card">
		<h2>New Account Approve </h2>
		<form action="AllRequestServlet" method="post">
			<label>Account No</label> 
			<input type="text" name="acno" required>
			<button type="submit"> Approve </button>		
		</form>
		<button type="button" class="close-btn" 
			onClick="location.href='${pageContext.request.contextPath}/AdminDashboardServlet'"> Back </button>
	</div>
	
	<div class="card">
		<h2>Account Close Request</h2>
		<form action="DeleteAcServlet" method="post">
			<label>Account No</label> 
			<input type="text" name="acno" required>
			<button type="submit"> Close A/c </button>		
		</form>
		<button type="button" class="close-btn" 
			onClick="location.href='${pageContext.request.contextPath}/AdminDashboardServlet'"> Back </button>
	</div>

</div>

</body>
</html>