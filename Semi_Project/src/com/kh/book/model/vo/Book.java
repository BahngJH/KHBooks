package com.kh.book.model.vo;

import java.util.Date;

//책 정보 객체
public class Book {
	private String bookName;
	private int price;
	private String publisher;
	private int authorNum;
	private String genre;
	private int bookId;
	private int isbn;
	private String bookImage;
	private Date bookDate;
	private String bookInfo;
	private String editor;
	private String translator;
	private int pageNum;
	private int stock;
	private int sales;
	
	public Book() {
		super();
	}
	public Book(String bookName, int price, String publisher, int authorNum, String genre, int bookId, int isbn,
			String bookImage, Date bookDate, String bookInfo, String editor, String translator, int pageNum, int stock,
			int sales) {
		super();
		this.bookName = bookName;
		this.price = price;
		this.publisher = publisher;
		this.authorNum = authorNum;
		this.genre = genre;
		this.bookId = bookId;
		this.isbn = isbn;
		this.bookImage = bookImage;
		this.bookDate = bookDate;
		this.bookInfo = bookInfo;
		this.editor = editor;
		this.translator = translator;
		this.pageNum = pageNum;
		this.stock = stock;
		this.sales = sales;
	}
	@Override
	public String toString() {
		return "Book [bookName=" + bookName + ", price=" + price + ", publisher=" + publisher + ", authorNum="
				+ authorNum + ", genre=" + genre + ", bookId=" + bookId + ", inbn=" + isbn + ", bookImage=" + bookImage
				+ ", bookDate=" + bookDate + ", bookInfo=" + bookInfo + ", editor=" + editor + ", translator="
				+ translator + ", pageNum=" + pageNum + ", stock=" + stock + ", sales=" + sales + "]";
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getAuthorNum() {
		return authorNum;
	}
	public void setAuthorNum(int authorNum) {
		this.authorNum = authorNum;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int inbn) {
		this.isbn = inbn;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public Date getBookDate() {
		return bookDate;
	}
	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}
	public String getBookInfo() {
		return bookInfo;
	}
	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	
	
}
