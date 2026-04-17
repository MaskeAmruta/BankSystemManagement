package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;
import model.Transection;

import java.io.IOException;

import dao.TransectionDAO;

@WebServlet("/SearchCustomer")
public class SearchCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/admin/searchCustomer.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long ac =Long.parseLong(request.getParameter("acno"));
		Transection t = new Transection();
		t.setAcno(ac);
		
		TransectionDAO tdao = new TransectionDAO();
		Customer c = tdao.getCustomerByAcNo(t);
		
		System.out.println(" Customer serched =" +c.getAcno());
		
		request.setAttribute("customer", c);
		request.getRequestDispatcher("WEB-INF/admin/searchCustomer.jsp").forward(request, response);
		
	}

}
