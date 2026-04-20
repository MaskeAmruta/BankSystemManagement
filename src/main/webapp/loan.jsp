<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loan page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loan.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/service.css" />
</head>
<body>
	<section class="loans">
  <h2 class="section-title">Loan Services</h2>

  <div class="loan-container">

    <div class="loan-card">
      <i class="fas fa-home"></i>
      <h3>Home Loan</h3>
      <p>Affordable housing loans with low interest rates.</p>
      <button class="apply-btn" onclick="window.location.href='login.jsp'">
		  Apply Now
	  </button>
    </div>

    <div class="loan-card">
      <i class="fas fa-car"></i>
      <h3>Car Loan</h3>
      <p>Drive your dream car with easy EMI options.</p>
      <button class="apply-btn" onclick="window.location.href='login.jsp'">
		  Apply Now
	  </button>
    </div>

    <div class="loan-card">
      <i class="fas fa-user-graduate"></i>
      <h3>Education Loan</h3>
      <p>Finance your higher education in India or abroad.</p>
      <button class="apply-btn" onclick="window.location.href='login.jsp'">
		  Apply Now
	  </button>
    </div>

    <div class="loan-card">
      <i class="fas fa-coins"></i>
      <h3>Gold Loan</h3>
      <p>Instant loan against your gold at best rates.</p>
      <button class="apply-btn" onclick="window.location.href='login.jsp'">
		  Apply Now
	  </button>
    </div>

    <div class="loan-card">
      <i class="fas fa-briefcase"></i>
      <h3>Business Loan</h3>
      <p>Expand your business with flexible funding.</p>
      <button class="apply-btn" onclick="window.location.href='login.jsp'">
		  Apply Now
	  </button>
    </div>

    <div class="loan-card">
      <i class="fas fa-wallet"></i>
      <h3>Personal Loan</h3>
      <p>Quick loans for your personal needs.</p>
      <button class="apply-btn" onclick="window.location.href='login.jsp'">
		  Apply Now
	  </button>
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