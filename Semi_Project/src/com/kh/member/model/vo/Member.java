package com.kh.member.model.vo;

import java.sql.Date;

import com.kh.review.model.vo.Review;

public class Member {
	
	private Date enrollDate;
	private int isAdmin;
	private int mileage;
	private int memberNum;
	//아래부터 실제 데이터 삽입
	private String memberId;
	private String memberPw;
	private String memberName;
	private String address;
	private String birth;
	private String phone;
	private String email;
	private String gender;
	private Review review;
	private Date recentLogin;
	
	public Member() {}

	public Member(int memberNum, String memberId, String memberPw, String memberName, String address, String birth,
			String phone, String email, Date enrollDate, String gender, int isAdmin, int mileage) {
		this.memberNum = memberNum;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.address = address;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.gender = gender;
		this.isAdmin = isAdmin;
		this.mileage = mileage;
	}

	public Review getReview() {
		return review;
	}
	public void setReview(Review review)
	{
		this.review = review;
	}
	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	public Date getRecentLogin() {
		return recentLogin;
	}

	public void setRecentLogin(Date recentLogin) {
		this.recentLogin = recentLogin;
	}

	@Override
	public String toString() {
		return "Member [memberNum=" + memberNum + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", address=" + address + ", birth=" + birth + ", phone=" + phone + ", email=" + email
				+ ", enrollDate=" + enrollDate + ", gender=" + gender + ", isAdmin=" + isAdmin + ", mileage=" + mileage
				+ "]";
	}
	
	
	
	
}