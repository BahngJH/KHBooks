package com.kh.mark.model.vo;

public class Mark {
	
	private int bookId;
	private int memberNum;
	
	public Mark() {
	}

	public Mark(int bookId, int memberNum) {
		super();
		this.bookId = bookId;
		this.memberNum = memberNum;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	@Override
	public String toString() {
		return "Mark [bookId=" + bookId + ", memberNum=" + memberNum + "]";
	}
	

}
