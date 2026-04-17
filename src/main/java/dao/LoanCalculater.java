package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.DBConnection;
import model.LoanAcDetails;

public class LoanCalculater {

	public double getLoneAmount(double sal) {
		double res=0;
		if(sal >=25000 && sal<50000) {
			res = 200000;
					}else if(sal >=50000 && sal < 100000){
			res = 500000;
		}else {
			res = 0;
		}
		return res;
		
	}

	public void saveCheckLoneDetails(LoanAcDetails ld) {	
		Connection con =DBConnection.getConnection();
		String sql ="insert into checkloan(account_no,full_name,salary,loanAmount,interesRate)values(?,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, ld.getAcno());
			ps.setString(2, ld.getFullName());
			ps.setDouble(3, ld.getSalary());
			ps.setDouble(4, ld.getLoanAmount());
			ps.setDouble(5, ld.getInteresRate());
			
			ps.executeUpdate();
//			System.out.println("loan recored save");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	public LoanAcDetails getCustomerByIdForLoan(long acn) {
		Connection con = DBConnection.getConnection();
		String sql ="Select * from checkloan where account_no=?";
		LoanAcDetails ld = null;
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setLong(1, acn);
			
			ResultSet rs =ps.executeQuery();
			if(rs.next()) {
				ld =new LoanAcDetails();
				ld.setAcno(rs.getLong("account_no"));
				ld.setFullName(rs.getString("full_name"));
				ld.setSalary(rs.getDouble("salary"));
				ld.setLoanAmount(rs.getDouble("loanAmount"));
				ld.setInteresRate(rs.getDouble("interesRate"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ld;
		
	}
	
	public void addCustomerToLoanAc(LoanAcDetails ld) {
		String sql = "insert into loanac(full_name,account_no,salary,loanAmount,req_LoanAmount,loanType,tenureYear,interesRate,emi_amount,start_date,end_date)values(?,?,?,?,?,?,?,?,?,?,?)";
		
		Connection con =DBConnection.getConnection();
		
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			
			ps.setString(1, ld.getFullName());
			ps.setLong(2, ld.getAcno());
			ps.setDouble(3, ld.getSalary());
			ps.setDouble(4,ld.getLoanAmount());
			ps.setDouble(5, ld.getSanLoanAmount());
			ps.setString(6, ld.getLoneType());
			ps.setInt(7, ld.getTenureYear());
			ps.setDouble(8, ld.getInteresRate());
			ps.setDouble(9, ld.getEmi());
			ps.setString(10, ld.getStartDate());
			ps.setString(11, ld.getEndDate());
			
			ps.executeUpdate();
			System.out.println("data added into Loan ac ");
			
		}catch(Exception e) {e.printStackTrace();}
	}

	public List<LoanAcDetails> getAllLoanCustomer() {
		List<LoanAcDetails> loanCustomser = new ArrayList<>();
		
		String sql = "select * from loanac";
		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				LoanAcDetails ld = new LoanAcDetails();
				ld.setId(rs.getInt("id"));
				ld.setFullName(rs.getString("full_name"));
				ld.setAcno(rs.getLong("account_no"));
				ld.setSalary(rs.getDouble("salary"));
				ld.setLoanAmount(rs.getInt("loanAmount"));
				ld.setSanLoanAmount(rs.getInt("req_LoanAmount"));
				ld.setLoneType(rs.getString("loanType"));
				ld.setTenureYear(Integer.parseInt(rs.getString("tenureYear")));
				ld.setInteresRate(rs.getDouble("interesRate"));
				ld.setEmi(rs.getInt("emi_amount"));
				ld.setStatus(rs.getString("status"));
				
				 loanCustomser.add(ld);
//				 System.out.print(loanCustomser);
			}
			
		}catch(Exception e) {e.printStackTrace();}	
		
		return loanCustomser;	
	}

	public boolean updateLoanStatus(long id, String stat) {
		String sql= "update loanac set status=? where id=?";
		boolean res = false;
		Connection con =DBConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, stat);
			ps.setLong(2, id);
			res = ps.executeUpdate() > 0;
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;	
	}
	
	public boolean rejectLoan(long id) {
		String sql= "update loanac set status='Rejected' where id=?";
		boolean res = false;
		Connection con =DBConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, id);
			res = ps.executeUpdate() > 0;
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;	
	}
	
}
