<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String msg= (String) request.getParameter("msg"); 
   String error = (String) request.getParameter("error");	%>
   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/service.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />

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

<section class="contact">
  <h2 class="section-title">Contact Us</h2>

  <div class="contact-container">

    <!-- Contact Info -->
    <div class="contact-info">
      <h3>Get in Touch</h3>
      <p><i class="fas fa-map-marker-alt"></i> Chh.Sambhaji Nagar, Maharashtra, India</p>
      <p><i class="fas fa-phone"></i> +91 1800234890</p>
      <p><i class="fas fa-envelope"></i> support@sbi.co.in</p>
    </div>

    <!-- Contact Form -->
    <div class="contact-form">
      <form action="${pageContext.request.contextPath}/contactUs" method="post">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <input type="text" name="subject"  placeholder="Subject">
        <textarea rows="5" name="message"  placeholder="Your Message"></textarea>
        <button type="submit">Send Message</button>
      </form>
    </div>

  </div> 
</section>
<% if(msg != null ){
	%>
<h2 style="color:green; text-align:center;"><%=msg %></h2>

<% } if(error != null){ %>

<h2 style="color:red; text-align:center" ><%=error %></h2>

<%} %>

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
        <li><a href="#">Contact</a></li>
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