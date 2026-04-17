package model;

public class LoanAcDetails extends Customer{
	private int id;
	private double salary;
	private double sanLoanAmount;
	private double loanAmount;
	private String loanType;
	private String startDate;
	private String endDate;
	private int tenureYear;
	private double interesRate;
	private double emi;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoneType() {
		return loanType;
	}

	public void setLoneType(String loneType) {
		this.loanType = loneType;
	}

	public int getTenureYear() {
		return tenureYear;
	}

	public void setTenureYear(int tenureYear) {
		this.tenureYear = tenureYear;
	}

	public double getInteresRate() {
		return interesRate;
	}

	public void setInteresRate(double interesRate) {
		this.interesRate = interesRate;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public double getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(double loanAmount) {
		this.loanAmount = loanAmount;
	}

	public double getSanLoanAmount() {
		return sanLoanAmount;
	}

	public void setSanLoanAmount(double sanLoanAmount) {
		this.sanLoanAmount = sanLoanAmount;
	}

	public double getEmi() {
		return emi;
	}

	public void setEmi(double emi) {
		this.emi = emi;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	@Override
	public String toString() {
		return "LoanAcDetails [id=" + id + ", salary=" + salary + ", sanLoanAmount=" + sanLoanAmount + ", loanAmount="
				+ loanAmount + ", loanType=" + loanType + ", tenureYear=" + tenureYear + ", interesRate=" + interesRate
				+ ", emi=" + emi + "]";
	}
	

}
