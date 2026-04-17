package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.CustomerDAO;
import dbconnection.DBConnection;


@WebServlet("/CustomerSignupServlet")
public class CustomerSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long  ac = Long.parseLong(request.getParameter("acno"));
		String pass = request.getParameter("password");
		String confpass= request.getParameter("passConfarm");	
		
		
		CustomerDAO dao =new CustomerDAO();
		boolean status =  dao.customerSign(ac);
		
		
		
		Connection con =DBConnection.getConnection();
		if(status) {	
			
			if(pass.equals(confpass)) {
				pass=confpass;	
				String sql ="insert into logbyac(account_no,password)values(?,?)";
				try {
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setLong(1, ac);
					ps.setString(2, pass);
					
					ps.executeUpdate();
					
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}catch(Exception e) {e.printStackTrace();}		
			}
			
//				else {
//			request.setAttribute("matchpass", "Account No or Password Mismatch please check.");
//			request.getRequestDispatcher("signup.jsp").forward(request, response);
//			
//		}
			
	}else {
		request.setAttribute("matchpass", "Account No or Password Mismatch please check.");
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}

}
}
