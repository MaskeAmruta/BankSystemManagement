package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LoanAcDetails;
import java.io.IOException;
import dao.LoanCalculater;

@WebServlet("/ApplicationLone")
public class ApplicationLone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session=request.getSession();
		long acn = (Long)session.getAttribute("acno");
		
		LoanCalculater lc =new LoanCalculater();
		LoanAcDetails loanDet = lc.getCustomerByIdForLoan(acn);
		
		request.setAttribute("ldetails", loanDet);
		request.getRequestDispatcher("/customer/applicationForLone.jsp").forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			LoanAcDetails ld = new LoanAcDetails();
			
				ld.setFullName(req.getParameter("fname"));
				ld.setAcno(Long.parseLong(req.getParameter("acno")));
				ld.setSalary(Double.parseDouble(req.getParameter("sal")));
				ld.setLoneType(req.getParameter("ltype"));
				ld.setLoanAmount(Double.parseDouble(req.getParameter("lamount")));
				ld.setSanLoanAmount(Double.parseDouble(req.getParameter("reqamount")));
				ld.setInteresRate(Double.parseDouble(req.getParameter("rate")));	
				ld.setStartDate(req.getParameter("startDate"));
				ld.setEndDate(req.getParameter("endDate"));
				ld.setTenureYear(Integer.parseInt(req.getParameter("tyear")));
				ld.setEmi(Double.parseDouble(req.getParameter("emi")));
				
//				System.out.println("loan details = " +ld);
				
				LoanCalculater lc = new LoanCalculater();
				lc.addCustomerToLoanAc(ld);
				
//				System.out.println("customer Added..");
				
				resp.sendRedirect("CustomerDashboardServlet");
				
		
	}
	
}
