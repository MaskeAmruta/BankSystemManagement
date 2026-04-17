package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dbconnection.DBConnection;

@WebServlet("/AdminSignupServlet")
public class AdminSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname =request.getParameter("username");
		String pass = request.getParameter("password");
		

		try {
		Connection con =DBConnection.getConnection();
		String sql ="Insert into adminlogin(name,password)values(?,?)";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setString(1, uname);
		ps.setString(2, pass);
		ps.executeUpdate();
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
		
		}catch(Exception e) {e.printStackTrace();}
		
	}

}
