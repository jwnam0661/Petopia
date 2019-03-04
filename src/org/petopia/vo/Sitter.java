package org.petopia.vo;

import java.util.List;

public class Sitter {
	private int memberNo;
	private String sex;
	private int age;
	private String availableCategory;
	private int availableNumber;
	private String availableSize;
	private String houseCategory;
	private String sitterComment;
	private String license;
	private String status;//???
	private String pet;
	private int sittingLength;
	private String option1;
	private String option2;
	private String option3;
	private String account;
	private double avgRate;//평균 평점
	
	private Member memberSearch;	// sitterMapper 중 searchAddressSitter 에서 member객체 갖고 오기 위해서
	private Photo photoSearch;	// sitterMapper 중 searchAddressSitter 에서 photo객체 갖고 오기 위해서
	private List<Calendar> unavailableDateList;
	
	public Sitter() {
	}

	public Sitter(int memberNo, String sex, int age, String availableCategory, int availableNumber,
			String availableSize, String houseCategory, String sitterComment, String license, String status, String pet,
			int sittingLength, String option1, String option2, String option3, String account, double avgRate,
			Member memberSearch, Photo photoSearch, List<Calendar> unavailableDateList) {
		super();
		this.memberNo = memberNo;
		this.sex = sex;
		this.age = age;
		this.availableCategory = availableCategory;
		this.availableNumber = availableNumber;
		this.availableSize = availableSize;
		this.houseCategory = houseCategory;
		this.sitterComment = sitterComment;
		this.license = license;
		this.status = status;
		this.pet = pet;
		this.sittingLength = sittingLength;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.account = account;
		this.avgRate = avgRate;
		this.memberSearch = memberSearch;
		this.photoSearch = photoSearch;
		this.unavailableDateList = unavailableDateList;
	}



	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAvailableCategory() {
		return availableCategory;
	}

	public void setAvailableCategory(String availableCategory) {
		this.availableCategory = availableCategory;
	}

	public int getAvailableNumber() {
		return availableNumber;
	}

	public void setAvailableNumber(int availableNumber) {
		this.availableNumber = availableNumber;
	}

	public String getAvailableSize() {
		return availableSize;
	}

	public void setAvailableSize(String availableSize) {
		this.availableSize = availableSize;
	}

	public String getHouseCategory() {
		return houseCategory;
	}

	public void setHouseCategory(String houseCategory) {
		this.houseCategory = houseCategory;
	}

	public String getSitterComment() {
		return sitterComment;
	}

	public void setSitterComment(String sitterComment) {
		this.sitterComment = sitterComment;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}

	public int getSittingLength() {
		return sittingLength;
	}

	public void setSittingLength(int sittingLength) {
		this.sittingLength = sittingLength;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Member getMemberSearch() {
		return memberSearch;
	}

	public void setMemberSearch(Member memberSearch) {
		this.memberSearch = memberSearch;
	}

	public Photo getPhotoSearch() {
		return photoSearch;
	}

	public void setPhotoSearch(Photo photoSearch) {
		this.photoSearch = photoSearch;
	}

	public List<Calendar> getUnavailableDateList() {
		return unavailableDateList;
	}

	public void setUnavailableDateList(List<Calendar> unavailableDateList) {
		this.unavailableDateList = unavailableDateList;
	}

	public double getAvgRate() {
		return avgRate;
	}

	public void setAvgRate(double avgRate) {
		this.avgRate = avgRate;
	}

	@Override
	public String toString() {
		return "Sitter [memberNo=" + memberNo + ", sex=" + sex + ", age=" + age + ", availableCategory="
				+ availableCategory + ", availableNumber=" + availableNumber + ", availableSize=" + availableSize
				+ ", houseCategory=" + houseCategory + ", sitterComment=" + sitterComment + ", license=" + license
				+ ", status=" + status + ", pet=" + pet + ", sittingLength=" + sittingLength + ", option1=" + option1
				+ ", option2=" + option2 + ", option3=" + option3 + ", account=" + account + ", avgRate=" + avgRate
				+ ", memberSearch=" + memberSearch + ", photoSearch=" + photoSearch + ", unavailableDateList="
				+ unavailableDateList + "]";
	}

	
	
}
	
