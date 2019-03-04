package org.petopia.vo;

public class Calendar {
	private int memberNo;
	private String unavailableDate;
	
	public Calendar() {
	}
	
	public Calendar(int memberNo, String unavailableDate) {
		this.memberNo = memberNo;
		this.unavailableDate = unavailableDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getUnavailableDate() {
		return unavailableDate;
	}

	public void setUnavailableDate(String unavailableDate) {
		this.unavailableDate = unavailableDate;
	}

	@Override
	public String toString() {
		return "Calendar [memberNo=" + memberNo + ", unavailableDate=" + unavailableDate + "]";
	}
}
