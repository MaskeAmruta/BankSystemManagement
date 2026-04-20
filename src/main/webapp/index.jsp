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
			<li><a href="service.jsp">Services</a></li>
			
			<li><a href="contact.jsp">Contact</a></li>
			<li><a href="AdminLoginServlet">AdminLog</a></li>
			<li><a href="CustomerLoginServlet">CustomerLog</a></li>
			<li><a href="openNewAc.jsp">Open New A/C</a>	</li>
		</ul>	
</nav>

<div>
	<h3 class="move-heading">SBI never asks for confidential information such as PIN and OTP from customers.</h3>
</div>
<br>

	
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

<footer class="footer">
  <div class="footer-container">

    <div class="footer-box">
      <h3>About Us</h3>
      <p>State Bank of India provides a wide range of banking and financial services to individuals and businesses.</p>
    </div>

    <div class="footer-box">
      <h3>Quick Links</h3>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="openNewAc.jsp">Open New Account</a></li>
        <li><a href="loan.jsp">Loans</a></li>
        <li><a href="contact.jsp">Contact</a></li>
      </ul>
    </div>

    <div class="footer-box">
      <h3>Contact</h3>
      <p>Email: support@sbi.co.in</p>
      <p>Phone: +91 1800234890</p>
    </div>

  </div>

  <div class="footer-bottom">
    <p>© 2026 State Bank of India. All Rights Reserved.</p>
  </div>
</footer>
	

</body>
</html>