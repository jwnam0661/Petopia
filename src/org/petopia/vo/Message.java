package org.petopia.vo;

public class Message {
	private int SittingNo; //시팅 번호
	private int messageNo; //메시지 고유 번호(자동 생성)
	private int sendNo; //보낸 사람 번호
	private int receiveNo; //받는 사람 번호
	private String messageDate; //메시지 보낸 날짜
	private String text; //메시지 내용
	private String sendMemberID; //보낸사람 아이디
	
	public Message() { }

	public Message(int sittingNo, int messageNo, int sendNo, int receiveNo, String messageDate, String text,
			String sendMemberID) {
		super();
		SittingNo = sittingNo;
		this.messageNo = messageNo;
		this.sendNo = sendNo;
		this.receiveNo = receiveNo;
		this.messageDate = messageDate;
		this.text = text;
		this.sendMemberID = sendMemberID;
	}

	public int getSittingNo() {
		return SittingNo;
	}

	public void setSittingNo(int sittingNo) {
		SittingNo = sittingNo;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public int getSendNo() {
		return sendNo;
	}

	public void setSendNo(int sendNo) {
		this.sendNo = sendNo;
	}

	public int getReceiveNo() {
		return receiveNo;
	}

	public void setReceiveNo(int receiveNo) {
		this.receiveNo = receiveNo;
	}

	public String getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSendMemberID() {
		return sendMemberID;
	}

	public void setSendMemberID(String sendMemberID) {
		this.sendMemberID = sendMemberID;
	}

	@Override
	public String toString() {
		return "Message [SittingNo=" + SittingNo + ", messageNo=" + messageNo + ", sendNo=" + sendNo + ", receiveNo="
				+ receiveNo + ", messageDate=" + messageDate + ", text=" + text + ", sendMemberID=" + sendMemberID
				+ "]";
	}

	
}
