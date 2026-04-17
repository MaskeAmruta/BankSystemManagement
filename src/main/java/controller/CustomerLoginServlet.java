package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CustomerLoginDetails;
import java.io.IOException;

import dao.CustomerDAO;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		CustomerLoginDetails clog = new CustomerLoginDetails();
		
		clog.setAcNo(Long.parseLong(req.getParameter("acno")));
		clog.setPass(req.getParameter("password"));
		
		CustomerDAO dao =new CustomerDAO();
		
		boolean status = dao.customerLogin(clog);

		if(status) {
			HttpSession session = req.getSession();
			session.setAttribute("acno", clog.getAcNo());
			
//			req.setAttribute("acno", clog.getAcNo());
			req.getRequestDispatcher("/customer/customerDashboard.jsp").forward(req, resp);
		}else {
			
			req.setAttribute("error", "Account No Incurrect or SignUp First" );
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		
	}

	

}
