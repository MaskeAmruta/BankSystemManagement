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

@WebServlet("/RequestToDeleteAccountServlet")
public class RequestToDeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long ac =Long.parseLong(request.getParameter("acn"));
//		System.out.println("request delte ac" + ac);
		
		Connection con = DBConnection.getConnection();
		
		String sql ="update customer set status='A/C Close' where account_no=?";
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setLong(1, ac);
			ps.executeUpdate();
			
			
		String sql2 ="delete from logbyac where account_no=?";
			PreparedStatement ps1 = con.prepareStatement(sql2);
			ps1.setLong(1, ac);
			ps1.executeUpdate();
			
			
			System.out.println("Record deleted from login table also." +ac);
			response.sendRedirect("ShownceServletBala");
		}catch(Exception e) {e.printStackTrace();}
		
		
	}

}
