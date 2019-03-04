package org.petopia.vo;

import java.util.List;

public class Sitting {
	private int sittingNo;
	private int memberNo;
	private int sitterNo;
	private int petNo;
	private String status;
	private String requestDate;
	private String startDate;
	private String endDate;
	private String option1;
	private String option2;
	private String option3;
	private int price;
	//시터페이지 및 마이페이지에서 쓸 photoNo변수 추가
	private int photoNo;
	
	private Member member;
	private Sitter sitter;
	private Pet pet;
	private Photo photo;
	private List<Message> messageList;
	
	public Sitting() {}

	@Override
	public String toString() {
		return "Sitting [sittingNo=" + sittingNo + ", memberNo=" + memberNo + ", sitterNo=" + sitterNo + ", petNo="
				+ petNo + ", status=" + status + ", requestDate=" + requestDate + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", option1=" + option1 + ", option2=" + option2 + ", option3=" + option3
				+ ", price=" + price + ", photoNo=" + photoNo + ", member=" + member + ", sitter=" + sitter + ", pet="
				+ pet + ", photo=" + photo + ", messageList=" + messageList + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public int getSittingNo() {
		return sittingNo;
	}

	public void setSittingNo(int sittingNo) {
		this.sittingNo = sittingNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getSitterNo() {
		return sitterNo;
	}

	public void setSitterNo(int sitterNo) {
		this.sitterNo = sitterNo;
	}

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
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

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}
	
	
}
