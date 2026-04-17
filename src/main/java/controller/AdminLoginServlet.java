package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnection.DBConnection;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/admin/adminLogin.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name =req.getParameter("adminname");
		String pass =req.getParameter("password");
			
		Connection con =DBConnection.getConnection();
		String sql ="select * from adminlogin where name=? AND password=?";
		
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, pass);
			
			resp.getWriter().println("Login servlet reached!");
			
			ResultSet rs =ps.executeQuery();
			
			if(rs.next()) {
				req.getRequestDispatcher("WEB-INF/admin/adminDashboard.jsp").forward(req, resp);
			}else {
				req.getRequestDispatcher("WEB-INF/admin/adminLogin.jsp").forward(req, resp);
			}
		}catch(Exception e) {e.printStackTrace();}
	}
	
}

