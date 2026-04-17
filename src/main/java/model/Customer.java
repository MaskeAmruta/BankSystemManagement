package model;

import java.sql.Date;

public class Customer {
	
	private int id;
	
	private long acno;
	private String fullName;
	private Date dob;
	private String gender;
	private String adharno;
	private String panno;
	private String mobileNo;
	private String acType;
	private double openBal;
	private Date acOpenDate ;
	private String status;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAdharno() {
		return adharno;
	}
	public void setAdharno(String adharno) {
		this.adharno = adharno;
	}
	public String getPanno() {
		return panno;
	}
	public void setPanno(String panno) {
		this.panno = panno;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getAcType() {
		return acType;
	}
	public void setAcType(String acType) {
		this.acType = acType;
	}
	public double getOpenBal() {
		return openBal;
	}
	public void setOpenBal(double openBal) {
		this.openBal = openBal;
	}
	public Date getAcOpenDate() {
		return acOpenDate;
	}
	public void setAcOpenDate(Date acOpenDate) {
		this.acOpenDate = acOpenDate;
	}
	public long getAcno() {
		return acno;
	}
	public void setAcno(long acno) {
		this.acno =acno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
	
}
