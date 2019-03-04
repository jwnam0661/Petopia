package org.petopia.vo;

public class Favorite {
	private int favoriteNo;
	private String favoriteDate;
	private int memberNo;
	private int sitterNo;
	
	public Favorite() {
		// TODO Auto-generated constructor stub
	}

	public Favorite(int favoriteNo, String favoriteDate, int memberNo, int sitterNo) {
		super();
		this.favoriteNo = favoriteNo;
		this.favoriteDate = favoriteDate;
		this.memberNo = memberNo;
		this.sitterNo = sitterNo;
	}

	public int getFavoriteNo() {
		return favoriteNo;
	}

	public void setFavoriteNo(int favoriteNo) {
		this.favoriteNo = favoriteNo;
	}

	public String getFavoriteDate() {
		return favoriteDate;
	}

	public void setFavoriteDate(String favoriteDate) {
		this.favoriteDate = favoriteDate;
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

	@Override
	public String toString() {
		return "Favorite [favoriteNo=" + favoriteNo + ", favoriteDate=" + favoriteDate + ", memberNo=" + memberNo
				+ ", sitterNo=" + sitterNo + "]";
	}
	
	
	
}
