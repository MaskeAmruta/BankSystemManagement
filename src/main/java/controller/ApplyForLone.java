package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.LoanAcDetails;
import model.Transection;
import java.io.IOException;

import dao.LoanCalculater;
import dao.TransectionDAO;


@WebServlet("/ApplyForLone")
public class ApplyForLone extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		long acn = (Long)session.getAttribute("acno");
		Transection t =new Transection();
		t.setAcno(acn);
		
		TransectionDAO tdao = new TransectionDAO();
		Customer c = tdao.getCustomerByAcNo(t);
		
		request.setAttribute("customer", c);
		request.getRequestDispatcher("/customer/checkLoneSantion.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double sal = Integer.parseInt(request.getParameter("salary"));
		LoanCalculater loan =new LoanCalculater();
		double loanAmount =	loan.getLoneAmount(sal);
		
		HttpSession session=request.getSession();
		long acn = (Long)session.getAttribute("acno");
		Transection t =new Transection();
		t.setAcno(acn);
		
		TransectionDAO tdao = new TransectionDAO();
		Customer c = tdao.getCustomerByAcNo(t);
		
//		System.out.println("get lone amount " + loanAmount);
		
		if(loanAmount == 0) {
			
			request.setAttribute("lamount",loanAmount );
			request.setAttribute("error","Not Applicable" );
			request.getRequestDispatcher("error.jsp").forward(request, response);
		
		}else {
			
			double rate =9.0;
			LoanAcDetails ld =new LoanAcDetails();
			ld.setAcno(acn);
			ld.setFullName(c.getFullName());
			ld.setSalary(sal);
			ld.setLoanAmount(loanAmount);
			ld.setInteresRate(rate);
			
//			System.out.println(acn +" "+ c.getFullName()+" " +sal +" "+loanAmount);
			
			LoanCalculater lc = new LoanCalculater();
			lc.saveCheckLoneDetails(ld);
						
		request.setAttribute("lamount",loanAmount );
		request.setAttribute("interestRate", rate);
		request.getRequestDispatcher("/customer/applyForLone.jsp").forward(request, response);
		}
	}

}
