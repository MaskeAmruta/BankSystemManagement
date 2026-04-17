package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

import java.io.IOException;
import java.sql.Date;

import dao.CustomerDAO;


@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Customer c =new Customer();
		
		c.setFullName(request.getParameter("fname"));
		c.setDob(Date.valueOf(request.getParameter("dob")));
		c.setGender(request.getParameter("gender"));
		c.setAdharno(request.getParameter("adharno"));
		c.setPanno(request.getParameter("panno"));
		c.setMobileNo(request.getParameter("mobileno"));
		c.setAcType(request.getParameter("actype"));
		c.setOpenBal(Double.parseDouble(request.getParameter("openbal")));
		
		CustomerDAO cDao =new CustomerDAO();
		boolean status =  cDao.addCustomer(c);
		
		if(status) {
			request.getRequestDispatcher("/WEB-INF/admin/adminDashboard.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/WEB-INF/admin/openNewAc.jsp").forward(request, response);
		}
	}

}
