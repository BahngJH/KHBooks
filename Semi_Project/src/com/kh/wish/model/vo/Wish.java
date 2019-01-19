package com.kh.wish.model.vo;

public class Wish {

	private int wishNo;
	private int memberNum;
	private int bookId;
	private int bookCount;
	
	public Wish() {
	}

	public Wish(int wishNo, int memberNum, int bookId, int bookCount) {
		super();
		this.wishNo = wishNo;
		this.memberNum = memberNum;
		this.bookId = bookId;
		this.bookCount = bookCount;
	}

	public int getWishNo() {
		return wishNo;
	}

	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getBookCount() {
		return bookCount;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

	@Override
	public String toString() {
		return "Wish [wishNo=" + wishNo + ", memberNum=" + memberNum + ", bookId=" + bookId + ", bookCount=" + bookCount
				+ "]";
	}
	
}
