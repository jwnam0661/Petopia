package org.petopia.vo;

public class Member {
	private int memberNo;
	private String memberID;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String address1;
	private String address2;
	private double lat;
	private double lng;
	private double bound_northeast_lat;
	private double bound_northeast_lng;
	private double bound_southwest_lat;
	private double bound_southwest_lng;
	
	public Member() {
	}

	public Member(int memberNo, String memberID, String password, String name, String email, String phone,
			String address1, String address2, double lat, double lng, double bound_northeast_lat,
			double bound_northeast_lng, double bound_southwest_lat, double bound_southwest_lng) {
		super();
		this.memberNo = memberNo;
		this.memberID = memberID;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address1 = address1;
		this.address2 = address2;
		this.lat = lat;
		this.lng = lng;
		this.bound_northeast_lat = bound_northeast_lat;
		this.bound_northeast_lng = bound_northeast_lng;
		this.bound_southwest_lat = bound_southwest_lat;
		this.bound_southwest_lng = bound_southwest_lng;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public double getBound_northeast_lat() {
		return bound_northeast_lat;
	}

	public void setBound_northeast_lat(double bound_northeast_lat) {
		this.bound_northeast_lat = bound_northeast_lat;
	}

	public double getBound_northeast_lng() {
		return bound_northeast_lng;
	}

	public void setBound_northeast_lng(double bound_northeast_lng) {
		this.bound_northeast_lng = bound_northeast_lng;
	}

	public double getBound_southwest_lat() {
		return bound_southwest_lat;
	}

	public void setBound_southwest_lat(double bound_southwest_lat) {
		this.bound_southwest_lat = bound_southwest_lat;
	}

	public double getBound_southwest_lng() {
		return bound_southwest_lng;
	}

	public void setBound_southwest_lng(double bound_southwest_lng) {
		this.bound_southwest_lng = bound_southwest_lng;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberID=" + memberID + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", phone=" + phone + ", address1=" + address1 + ", address2=" + address2
				+ ", lat=" + lat + ", lng=" + lng + ", bound_northeast_lat=" + bound_northeast_lat
				+ ", bound_northeast_lng=" + bound_northeast_lng + ", bound_southwest_lat=" + bound_southwest_lat
				+ ", bound_southwest_lng=" + bound_southwest_lng + "]";
	}

		
}
