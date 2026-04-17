package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbconnection.DBConnection;
import model.Customer;
import model.Transection;

public class TransectionDAO {

//	Deposit amount
	public void depositAmount(Transection t) {	
		Connection con =DBConnection.getConnection();
		String sql1 ="select opening_balance from customer where account_no=?";
		double bal = 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql1);
			ps.setLong(1, t.getAcno());
			
			ResultSet rs =ps.executeQuery();
			if(rs.next()) {
			 bal = rs.getDouble("opening_balance");
//			 System.out.println(bal);	 
			}
			
			}catch(Exception e) {e.printStackTrace();}
		
//		Update Balance
		String sql ="update customer set opening_balance=? where account_no=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int dep = t.getAmount();
			double total = bal + dep;	
			
			ps.setDouble(1, total);
			ps.setLong(2, t.getAcno());
			ps.executeUpdate();
			
			
		}catch(Exception e) {e.printStackTrace();}		
		
	}

	
//get Current Balance
	public double getCurrentBalance(Transection t) {	
		long ac =t.getAcno();
		
		String sql1 = "select opening_balance from customer where account_no=?";
		Connection con =DBConnection.getConnection();
		double bal=0;
		try {
			PreparedStatement ps =con.prepareStatement(sql1);
			ps.setLong(1, ac);
			ResultSet rs =ps.executeQuery();
			if(rs.next()) {
				bal = rs.getDouble("opening_balance");
//				System.out.println("balance=" + bal);
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return bal;
			
	}

// getCustomers personal details	
	public Customer getCustomerByAcNo(Transection t) {	
		long ac =t.getAcno();
		Customer c =null;
		String sql1 = "select * from customer where account_no=?";
		Connection con =DBConnection.getConnection();
		
		try {
			PreparedStatement ps =con.prepareStatement(sql1);
			ps.setLong(1, ac);
			
			ResultSet rs =ps.executeQuery();
			if(rs.next()) {
				c =new Customer();
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
						
			}
		}catch(Exception e) {
			
			e.printStackTrace();}
		return c;
			
	}

	
//Transefer amount 

	public boolean transerAmount(long sender, long reciver, double amount) {
		boolean status = false;
		Connection con =DBConnection.getConnection();	
		double bal = 0;
		double total = 0;
	
		try {
//	Check senders balance
			String sql = "select opening_balance from customer where account_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, sender);
			
			ResultSet rs =ps.executeQuery();
			if(rs.next()) {
				 bal =rs.getDouble("opening_balance");
//				 System.out.println("opening balance selected= " + bal);
				}	
			
//	update senders balance	
			String sql2 = "update customer set opening_balance=? where account_no=?";
			PreparedStatement ps1 = con.prepareStatement(sql2);
			
				bal =bal - amount;	
				ps1.setDouble(1, bal);
				ps1.setLong(2, sender);
				ps1.executeUpdate();				

//Insert into Transection Table
			String debit ="insert into transection(account_no,amount,transection_type)values(?,?,'TRANSFER')";
			PreparedStatement prs =con.prepareStatement(debit);

			prs.setLong(1, sender);
			prs.setDouble(2, amount);
			prs.executeUpdate();
		
			
			
//	Credited to recivers account
		String sql3 ="select opening_balance from customer where account_no=?";
			PreparedStatement ps3 =con.prepareStatement(sql3);
			ps3.setLong(1, reciver);
			
			ResultSet rs2 = ps3.executeQuery();
			double bal2 =0;
			
			if(rs2.next()) {
				bal2 = rs2.getDouble("opening_balance");
//				System.out.println("recivers opening balance= " + bal2);
			}	
			
		String sql4 ="update customer set opening_balance=? where account_no=?";						
			PreparedStatement ps4 = con.prepareStatement(sql4);
			
			 double credited =bal2 + amount;	
			
			ps4.setDouble(1,credited);
			ps4.setLong(2, reciver);
			ps4.executeUpdate();
			
			
//Insert into Transection Table
			String credit ="insert into transection(account_no,amount,transection_type)values(?,?,'RECIVED')";
			PreparedStatement prs1 =con.prepareStatement(credit);

			prs1.setLong(1, reciver);
			prs1.setDouble(2, amount);
			prs1.executeUpdate();
						
			status=true;
					
		}catch(Exception e) {e.printStackTrace();}	
	
	return status;				
	}

//Mini Statement 
	public List<Transection> getMiniStatByAc(Transection t) {
		Connection con =DBConnection.getConnection();
		ArrayList<Transection> list = new ArrayList<>();
		
		String sql = "select * from transection where account_no=? order by trans_date desc LIMIT 5" ;
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setLong(1, t.getAcno());
			ResultSet rs =ps.executeQuery();
			
			while(rs.next()) {
				
				Transection	t1 = new Transection();
				t1.setId(rs.getInt("id"));
				t1.setAcno(rs.getLong("account_no"));
				t1.setAmount(rs.getInt("amount"));
				t1.setType(rs.getString("transection_type"));
				t1.setDate(rs.getDate("trans_date"));
				
				list.add(t1);
			}
		}catch(Exception e) {e.printStackTrace();}
		return list;

	}
	
}
		
