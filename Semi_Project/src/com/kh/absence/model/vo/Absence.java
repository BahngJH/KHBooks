package com.kh.absence.model.vo;

import java.util.Date;

public class Absence {
	private int memberNum;//신청자 회원번호 
	private String bookName;//책제목 O
	private Date appDate;//신청날짜
	private String author;//저자 O
	private Date bookDate;//발행연도O
	private String ISBN;//isbnO
	private String publisher;//출판사 O
	private boolean appCancel;//취소여부 false/true
	private String status;//상태 Y,F
	private int appNum; //신청번호
	
	public Absence() {
		
	}

	public Absence(int memberNum, String bookName, Date appDate, String author, Date bookDate, String iSBN,
			String publisher, boolean appCancel, String status, int appNum) {
		
		this.memberNum = memberNum;
		this.bookName = bookName;
		this.appDate = appDate;
		this.author = author;
		this.bookDate = bookDate;
		ISBN = iSBN;
		this.publisher = publisher;
		this.appCancel = appCancel;
		this.status = status;
		this.appNum = appNum;
	}

	
	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public Date getAppDate() {
		return appDate;
	}

	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public boolean isAppCancel() {
		return appCancel;
	}

	public void setAppCancel(boolean appCancel) {
		this.appCancel = appCancel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAppNum() {
		return appNum;
	}

	public void setAppNum(int appNum) {
		this.appNum = appNum;
	}

	@Override
	public String toString() {
		return "Absence [memberNum=" + memberNum + ", bookName=" + bookName + ", appDate=" + appDate + ", author="
				+ author + ", bookDate=" + bookDate + ", ISBN=" + ISBN + ", publisher=" + publisher + ", appCancel="
				+ appCancel + ", status=" + status + ", appNum=" + appNum + "]";
	}
	
	
	
	
	
	
}
