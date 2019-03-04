package org.petopia.vo;


public class Photo {
	private int photoNo;
	private String category;
	private String location;
	private String originalfile;
	private String savedfile;
	private String photoDate;
	private int memberNo;
	private int sitterNo;
	private int sittingNo;
	private int petNo;
	
	public Photo() {
	}

	public Photo(int photoNo, String category, String location, String originalfile, String savedfile, String photoDate,
			int memberNo, int sitterNo, int sittingNo, int petNo) {
		super();
		this.photoNo = photoNo;
		this.category = category;
		this.location = location;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.photoDate = photoDate;
		this.memberNo = memberNo;
		this.sitterNo = sitterNo;
		this.sittingNo = sittingNo;
		this.petNo = petNo;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	public String getPhotoDate() {
		return photoDate;
	}

	public void setPhotoDate(String photoDate) {
		this.photoDate = photoDate;
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

	public int getSittingNo() {
		return sittingNo;
	}

	public void setSittingNo(int sittingNo) {
		this.sittingNo = sittingNo;
	}

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	@Override
	public String toString() {
		return "Photo [photoNo=" + photoNo + ", category=" + category + ", location=" + location + ", originalfile="
				+ originalfile + ", savedfile=" + savedfile + ", photoDate=" + photoDate + ", memberNo=" + memberNo
				+ ", sitterNo=" + sitterNo + ", sittingNo=" + sittingNo + ", petNo=" + petNo + "]";
	}
	
	
}
