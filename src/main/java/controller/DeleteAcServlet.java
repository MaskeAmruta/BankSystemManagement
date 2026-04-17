package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import dao.CustomerDAO;
import dbconnection.DBConnection;

@WebServlet("/DeleteAcServlet")
public class DeleteAcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDAO cdao = new CustomerDAO();
		List<Customer>customers = cdao.getAllRequest();
		
		request.setAttribute("customers", customers);
		request.getRequestDispatcher("WEB-INF/admin/allRequest.jsp").forward(request, response);	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long ac =Long.parseLong(request.getParameter("acno"));
		
		String sql ="Delete from customer where account_no=? ";
		Connection con =DBConnection.getConnection();
	
		try{
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setLong(1, ac);
			ps.executeUpdate();
			
			
		}catch(SQLException e) {e.printStackTrace();}

		request.getRequestDispatcher("/WEB-INF/admin/adminDashboard.jsp").forward(request, response);
			}
	
	}
