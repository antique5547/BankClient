package com.atique.bankClient.TO;

import java.util.List;

public class AccountDetails {
	int accId;
	
	String accNo;
	double accBal;
	
	private List<AccountStatement> acStmts;
	
	public AccountDetails() {
		// TODO Auto-generated constructor stub
	}

	public AccountDetails(String accNo, double accBal) {
		super();
		this.accNo = accNo;
		this.accBal = accBal;
	}

	public int getAccId() {
		return accId;
	}

	public void setAccId(int accId) {
		this.accId = accId;
	}

	

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public double getAccBal() {
		return accBal;
	}

	public void setAccBal(double accBal) {
		this.accBal = accBal;
	}

	public List<AccountStatement> getAcStmts() {
		return acStmts;
	}

	public void setAcStmts(List<AccountStatement> acStmts) {
		this.acStmts = acStmts;
	}
	
	

}
