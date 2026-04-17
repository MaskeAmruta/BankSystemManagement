package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Transection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.TransectionDAO;
import dbconnection.DBConnection;

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/customer/deposit.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Transection t = new Transection();
		t.setAcno(Long.parseLong(request.getParameter("acno")));
		t.setAmount(Integer.parseInt(request.getParameter("damount")));
		
		TransectionDAO tdao = new TransectionDAO();
		double bal =tdao.getCurrentBalance(t);	
		
		System.out.println("Balance " +bal);
		
		
		if(bal<=0) {
			request.setAttribute("error", "Your account in inactive");
			request.getRequestDispatcher("/customer/deposit.jsp").forward(request, response);	
		}else {	
//		Update balance 
			
			Connection con =DBConnection.getConnection();
			String sql1 = "update customer set  opening_balance=? where account_no=?";
			try {
				PreparedStatement ps =con.prepareStatement(sql1);
				
				int depo =  t.getAmount();
				double total = bal + depo;
				
				ps.setDouble(1, total);
				ps.setLong(2, t.getAcno());
				ps.executeUpdate();
				
				
//Insert into transection Table
				
				String sql = "insert into transection(account_no,amount,transection_type)values(?,?,'DEPOSIT')";
				long acc = t.getAcno();	
				PreparedStatement ps1 = con.prepareStatement(sql);
					ps1.setLong(1, acc);
					ps1.setInt(2, depo);
					
					ps1.executeUpdate();
				
				request.setAttribute("success", "Amount Deposited Successfuly");
				request.getRequestDispatcher("/customer/deposit.jsp").forward(request, response);
				
				
				
	}catch(Exception e) {e.printStackTrace();}	
			
		}
	}
}
