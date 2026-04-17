package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

import java.io.IOException;
import java.util.List;

import dao.CustomerDAO;

@WebServlet("/viewCustomer")
public class ViewAllCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDAO cdao = new CustomerDAO();
		List<Customer> customers = cdao.getAllCustomers();
		
//		System.out.println(customers);
		
		request.setAttribute("customers", customers);
		
		request.getRequestDispatcher("WEB-INF/admin/viewAllCustomer.jsp").forward(request, response);	
	}

	
}
