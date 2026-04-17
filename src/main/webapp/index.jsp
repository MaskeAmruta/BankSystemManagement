<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sliding.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/imageSlider.js"></script>

</head>
<body>
<div class="head">

<span><img src="images/bank_1.png" alt="logo" /></span>
	<span><h2>Welcome to SBI WebPortal</h2></span>
</div>

<nav class="navbar">
	<ul>
		<li><a href="index.jsp">Home</a></li>
		<li>Services
			<div class="submenu">
				<ul>
					<li><a href="CustomerLoginServlet">Home Lone</a></li>
					<li><a href="CustomerLoginServlet">Vehicle Lone</a></li>
					<li><a href="CustomerLoginServlet">Personal Lone</a></li>
					<li><a href="CustomerLoginServlet">Gold Lone</a></li>
					<li><a href="CustomerLoginServlet">Business Lone</a></li>
				</ul>	
			</div>	
		</li>
		
		<li><a href="#">Contact</a></li>
		<li><a href="AdminLoginServlet">AdminLog</a></li>
		<li><a href="CustomerLoginServlet">CustomerLog</a></li>
	</ul>	
</nav>

<div>
	<h3 class="move-heading">SBI never asks for confidential information such as PIN and OTP from customers.</h3>
</div>


<div class="slider">
    <div class="slides">

        <img src="images/slide1.jpg" class="active" />
        <img src="images/slide2.jpg" />
        <img src="images/slide3.jpg" />
        <img src="images/slide5.jpg" />

        <button class="prev" onclick="changeSlide(-1)">Prev</button>
        <button class="next" onclick="changeSlide(1)">Next</button>
    </div>

    <div class="dots">
        <span class="dot active" onclick="setSlide(0)"></span>
        <span class="dot" onclick="setSlide(1)"></span>
        <span class="dot" onclick="setSlide(2)"></span>
        <span class="dot" onclick="setSlide(3)"></span>
    </div>

    <div class="thumbnails">
        <img src="images/slide1.jpg" class="active" onclick="setSlide(0)" />
        <img src="images/slide2.jpg" onclick="setSlide(1)" />
        <img src="images/slide3.jpg" onclick="setSlide(2)" />
        <img src="images/slide5.jpg" onclick="setSlide(3)" />
    </div>
</div>


</body>
</html>