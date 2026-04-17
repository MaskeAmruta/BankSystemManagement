package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.Transection;

import java.io.IOException;
import dao.TransectionDAO;


@WebServlet("/ShownceServletBala")
public class ShowBalanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
			
			long ac = (Long)session.getAttribute("acno");
			
			Transection t = new Transection();
			t.setAcno(ac);
			
			TransectionDAO tdao = new TransectionDAO();
			Customer c = tdao.getCustomerByAcNo(t);
			
//			System.out.println("Customers name= " + c.getFullName());
			
			request.setAttribute("customer", c);
			
			request.getRequestDispatcher("/customer/showBalance.jsp").forward(request, response);
	}

	
}
