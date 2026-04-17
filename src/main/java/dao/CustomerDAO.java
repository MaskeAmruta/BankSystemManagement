package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.DBConnection;
import model.Customer;
import model.CustomerLoginDetails;

public class CustomerDAO {
//Insert new Customer record
	public boolean addCustomer(Customer c) {

		boolean status=false;
		String sql ="insert into customer(full_name,dob,gender,aadhar_no,pan_no,mobile_no,account_type,opening_balance)"
				+ "values(?,?,?,?,?,?,?,?)";
		Connection con =DBConnection.getConnection();
		
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setString(1, c.getFullName());
			ps.setDate(2, c.getDob());
			ps.setString(3, c.getGender());
			ps.setString(4, c.getAdharno());
			ps.setString(5, c.getPanno());
			ps.setString(6, c.getMobileNo());
			ps.setString(7, c.getAcType());
			ps.setDouble(8, c.getOpenBal());
			
			status = ps.executeUpdate() > 0;
		}catch(Exception e) {e.printStackTrace();}
		
		return status;	
	}

//view all customer
	public List<Customer> getAllCustomers(){
		List<Customer> customer =new ArrayList<>();
		try {
			Connection con =DBConnection.getConnection();
			String sql = "Select * from customer";
			
			PreparedStatement ps =con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Customer c =new Customer();

				c.setId(rs.getInt("id"));
				c.setAcno(rs.getLong("account_no"));
				c.setFullName(rs.getString("full_name"));
				c.setDob(rs.getDate("dob"));
				c.setGender(rs.getString("gender"));
				c.setAdharno(rs.getString("aadhar_no"));
				c.setPanno(rs.getString("pan_no"));
				c.setMobileNo(rs.getString("mobile_no"));
				c.setAcType(rs.getString("account_type"));
				c.setOpenBal(rs.getDouble("opening_balance"));
				c.setAcOpenDate(rs.getDate("created_at"));
				c.setStatus(rs.getString("status"));
				
				customer.add(c);
				
			}
			
		}catch(SQLException e) {e.printStackTrace();}
		
		return customer;	
	}

//see all  Request 
	public List<Customer> getAllRequest(){
		List<Customer> customer = new ArrayList<>();
		
		try {
			Connection con =DBConnection.getConnection();
			String sql ="Select * from customer where status='painding'";
			
			PreparedStatement ps =con.prepareStatement(sql);
			ResultSet rs =ps.executeQuery();
			
			if(rs.next()) {
				Customer c = new Customer();
				
				c.setId(rs.getInt("id"));
				c.setAcno(rs.getLong("account_no"));
				c.setFullName(rs.getString("full_name"));
				c.setMobileNo(rs.getString("mobile_no"));
				c.setAcOpenDate(rs.getDate("created_at"));
				c.setStatus(rs.getString("status"));
				
				customer.add(c);	
			}
			
		}catch(SQLException e) {e.printStackTrace();}
		
		return customer;
	}

//	Approver Request
	public boolean approveRequest(Customer c ){
		
		boolean status =false;
		String sql ="update customer set status='Approve' where account_no=?";
		
		Connection con =DBConnection.getConnection();
	
		try{
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setLong(1, c.getAcno());
			status = ps.executeUpdate() > 0;
			
		}catch(SQLException e) {e.printStackTrace();}
		
		return status;	
	}

//Signin customer for transections
	public  boolean customerSign( long ac) {
		boolean status = false;
		String sql ="Select * from customer where account_no=?";
		
		String sql2 ="insert into logbyac(account_no,password)values(?,?)";
		Connection con =DBConnection.getConnection();
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setLong(1, ac);
			
			ResultSet rs =ps.executeQuery();
			if(rs.next()) {
				status = true;;
			}
			
		}catch(Exception e) {e.printStackTrace();}
		
		return status;
		
	}

//custoer Login for transection
	public boolean customerLogin(CustomerLoginDetails c) {
		boolean status =false;
		String sql ="select * from logbyac where account_no=? AND password=?";
		Connection con =DBConnection.getConnection();
		
		try {
			
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setLong(1, c.getAcNo());
			ps.setString(2, c.getPass());
			
			String a = String.valueOf(c.getAcNo());
			String p =c.getPass();
					
			ResultSet rs =ps.executeQuery();
			
			if(rs.next())  {
				long ac = rs.getLong(1);
				String ps1 =rs.getString(2);
								
				if(a.equals(ps1)) {
				status =true;
				}
			}
			}catch(Exception e) {e.printStackTrace();}
		
		return status;
		
	}

	
}
