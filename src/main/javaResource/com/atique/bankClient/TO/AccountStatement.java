package com.atique.bankClient.TO;

public class AccountStatement {
	int asId;
	int userId;
	String time;
	String type;
	String amount;
	
	public AccountStatement() {
		// TODO Auto-generated constructor stub
	}

	public int getAsId() {
		return asId;
	}

	public void setAsId(int asId) {
		this.asId = asId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	

}
