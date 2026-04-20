package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dbconnection.DBConnection;
import model.ContactForm;

public class ContactFormDAO {

	public boolean contactUs(ContactForm cForm) {
		Connection con =DBConnection.getConnection();
		String sql ="Insert into inquiry(name,email,subject,message)values(?,?,?,?)";
			boolean status = false;
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setString(1, cForm.getName());
			ps.setString(2, cForm.getEmail());
			ps.setString(3, cForm.getSubject());
			ps.setString(4, cForm.getMessage());
			int row = ps.executeUpdate();
			 
			if(row > 0 ) status = true;
		}catch(Exception e){e.printStackTrace();}
		return status;
		
	}

	
}
