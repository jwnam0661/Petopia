package org.petopia.vo;

public class Transaction {
	private int transactionNo;
	private int sittingNo;
	private String category;
	private int amount;
	private String transactionDate;
	
	public Transaction() {
		// TODO Auto-generated constructor stub
	}

	public Transaction(int transactionNo, int sittingNo, String category, int amount, String transactionDate) {
		super();
		this.transactionNo = transactionNo;
		this.sittingNo = sittingNo;
		this.category = category;
		this.amount = amount;
		this.transactionDate = transactionDate;
	}

	public int getTransactionNo() {
		return transactionNo;
	}

	public void setTransactionNo(int transactionNo) {
		this.transactionNo = transactionNo;
	}

	public int getSittingNo() {
		return sittingNo;
	}

	public void setSittingNo(int sittingNo) {
		this.sittingNo = sittingNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}

	@Override
	public String toString() {
		return "Transaction [transactionNo=" + transactionNo + ", sittingNo=" + sittingNo + ", category=" + category
				+ ", amount=" + amount + ", transactionDate=" + transactionDate + "]";
	}
	
	
}
