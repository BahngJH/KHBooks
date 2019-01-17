package com.kh.order.model.vo;

import java.util.Date;

import com.kh.book.model.vo.Book;

public class Order {
	private int memberNum;
	private int orderNum;
	private int bookId;
	private int bookCount;
	private Date orderDate;
	private char status;
	private Book book;
	
	public Order() {}

	public Order(int memberNum, int orderNum, int bookId, int bookCount, Date orderDate, char status) {
		super();
		this.memberNum = memberNum;
		this.orderNum = orderNum;
		this.bookId = bookId;
		this.bookCount = bookCount;
		this.orderDate = orderDate;
		this.status = status;
	}
	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
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

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Order [memberNum=" + memberNum + ", orderNum=" + orderNum + ", bookId=" + bookId + ", bookCount="
				+ bookCount + ", orderDate=" + orderDate + ", status=" + status + "]";
	}
	
}
