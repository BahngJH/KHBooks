package com.kh.review.model.vo;

import java.util.Date;

import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;

/*
 * 리뷰에 대한 vo
 */

public class Review {
	
	private int memberNum;			// 회원 번호
	private Date writeDate;			// 날짜, 시간 
	private int grade;				// 평점
	private int checkOption;		// 체크옵션 (좋아요, 별로에요 ...)
	private String reviewContext;	// 내용
	private int bookId;				// 도서 번호
	private String status;			// 상태
	private int reviewNum;			// 댓글 번호
	private Book book;				// 북 객체
	private Member member;
	
	public Review() {}
	
	public Review(int memberNum, Date writeDate, int grade, int checkOption, String reviewContext, int bookId,
			String status, int reviewNum) {
		super();
		this.memberNum = memberNum;
		this.writeDate = writeDate;
		this.grade = grade;
		this.checkOption = checkOption;
		this.reviewContext = reviewContext;
		this.bookId = bookId;
		this.status = status;
		this.reviewNum = reviewNum;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getCheckOption() {
		return checkOption;
	}
	public void setCheckOption(int checkOption) {
		this.checkOption = checkOption;
	}
	public String getReviewContext() {
		return reviewContext;
	}
	public void setReviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "Review [memberNum=" + memberNum + ", writeDate=" + writeDate + ", grade=" + grade + ", checkOption="
				+ checkOption + ", reviewContext=" + reviewContext + ", bookId=" + bookId + ", status=" + status
				+ ", reviewNum=" + reviewNum + "]";
	}
	
	
}
