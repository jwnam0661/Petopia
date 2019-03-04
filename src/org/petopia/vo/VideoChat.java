package org.petopia.vo;

public class VideoChat {
	private int sittingNo;
	private String status;
	private String endStatus;
	
	public VideoChat() {
	}
	
	public VideoChat(int sittingNo, String status, String endStatus) {
		super();
		this.sittingNo = sittingNo;
		this.status = status;
		this.endStatus = endStatus;
	}

	public int getSittingNo() {
		return sittingNo;
	}

	public void setSittingNo(int sittingNo) {
		this.sittingNo = sittingNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEndStatus() {
		return endStatus;
	}

	public void setEndStatus(String endStatus) {
		this.endStatus = endStatus;
	}

	@Override
	public String toString() {
		return "VideoChat [sittingNo=" + sittingNo + ", status=" + status + ", endStatus=" + endStatus + "]";
	}
	
	
	
}
