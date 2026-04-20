<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SBI Services</title>

<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/service.css" />
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


<section class="services">
  <h2 class="section-title">Our Services</h2>
  <div class="service-container">

    <div class="card">
      <i class="fas fa-university"></i>
      <h3>Banking</h3>
      <p>Savings, Current Accounts, FD & Net Banking.</p>
    </div>

    <div class="card">
      <i class="fas fa-hand-holding-usd"></i>
      <h3>Loans</h3>
      <p>Home, Car, Education & Personal Loans.</p>
    </div>

    <div class="card">
      <i class="fas fa-mobile-alt"></i>
      <h3>Digital Banking</h3>
      <p>UPI, YONO, Online Transfers & Bill Pay.</p>
    </div>

    <div class="card">
      <i class="fas fa-chart-line"></i>
      <h3>Investments</h3>
      <p>Mutual Funds, SIP & Insurance Plans.</p>
    </div>

    <div class="card">
      <i class="fas fa-briefcase"></i>
      <h3>Business</h3>
      <p>SME Banking, Trade Finance & Loans.</p>
    </div>

    <div class="card">
      <i class="fas fa-globe"></i>
      <h3>NRI Services</h3>
      <p>NRE/NRO Accounts & Global Transfers.</p>
    </div>

  </div>
</section>

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
