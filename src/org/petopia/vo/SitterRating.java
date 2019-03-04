package org.petopia.vo;

public class SitterRating {
	private int ratingNo;
	private double rating;
	private String ratingDate;
	private int memberNo;
	private int sitterNo;
	private String ratingComment;
	private int sittingNo;
	
	public SitterRating() {}

	public SitterRating(int ratingNo, double rating, String ratingDate, int memberNo, int sitterNo,
			String ratingComment, int sittingNo) {
		super();
		this.ratingNo = ratingNo;
		this.rating = rating;
		this.ratingDate = ratingDate;
		this.memberNo = memberNo;
		this.sitterNo = sitterNo;
		this.ratingComment = ratingComment;
		this.sittingNo = sittingNo;
	}

	public int getRatingNo() {
		return ratingNo;
	}

	public void setRatingNo(int ratingNo) {
		this.ratingNo = ratingNo;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getRatingDate() {
		return ratingDate;
	}

	public void setRatingDate(String ratingDate) {
		this.ratingDate = ratingDate;
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

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

	public int getSittingNo() {
		return sittingNo;
	}

	public void setSittingNo(int sittingNo) {
		this.sittingNo = sittingNo;
	}

	@Override
	public String toString() {
		return "SitterRating [ratingNo=" + ratingNo + ", rating=" + rating + ", ratingDate=" + ratingDate
				+ ", memberNo=" + memberNo + ", sitterNo=" + sitterNo + ", ratingComment=" + ratingComment
				+ ", sittingNo=" + sittingNo + "]";
	}


}
