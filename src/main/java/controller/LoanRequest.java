package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LoanAcDetails;

import java.io.IOException;
import java.util.List;

import dao.LoanCalculater;


@WebServlet("/LoanRequest")
public class LoanRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoanCalculater lc = new LoanCalculater();
		List<LoanAcDetails> loanCustomer = lc.getAllLoanCustomer();
		
	//	System.out.println(loanCustomer);
		
		request.setAttribute("loanCustomer", loanCustomer);
		request.getRequestDispatcher("WEB-INF/admin/loanCustomers.jsp").forward(request, response);
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long id1 = Long.parseLong(req.getParameter("id"));
		String stat = req.getParameter("status");
		
//		System.out.println("id= " +id1 + " " + "status= " + stat);
		
		LoanCalculater lc = new LoanCalculater();
		boolean result1 = lc.updateLoanStatus(id1,stat);
				
	}
	
	

}
