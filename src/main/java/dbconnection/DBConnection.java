package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnection {
	private static final String url ="jdbc:mysql://localhost:3306/webbank";
	private static final String user ="root";
	private static final String password ="amruta";
	
	public static Connection con;
	 
	public static Connection getConnection() {	
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url,user,password);
		
		System.out.println("DB Connected");
		}catch(Exception e) {e.printStackTrace();}
	
		return con;
		
	}
}

