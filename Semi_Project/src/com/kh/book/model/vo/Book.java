package com.kh.book.model.vo;

import java.util.Date;

import com.kh.author.model.vo.Author;
import com.kh.member.model.vo.Member;

//책 정보 객체
public class Book {
	private String bookName;
	private int price;
	private String publisher;
	private int authorNum;
	private String genre;
	private int bookId;
	private String isbn;
	private String bookImage;
	private Date bookDate;
	private String bookInfo;
	private String bookContent;
	private String editor;
	private String translator;
	private int pageNum;
	//홈페이지(가게)에 보유중인 재고량
	private int stock;
	private String toc;
	private int sales;
	private Author author;
	private Member member;
	//장바구니에 담은 수량
	private int bookCount;
	private int grade;

	
	public Book() {
		super();
	}
	
	public Book(String bookName, int price, String publisher, int authorNum, String genre, int bookId, String isbn,
			String bookImage, Date bookDate, String bookInfo, String bookContent, String editor, String translator, int pageNum, int stock,
			int sales, String toc) {
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
		this.bookContent = bookContent;
		this.toc = toc;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + authorNum;
		result = prime * result + ((bookDate == null) ? 0 : bookDate.hashCode());
		result = prime * result + bookId;
		result = prime * result + ((bookImage == null) ? 0 : bookImage.hashCode());
		result = prime * result + ((bookInfo == null) ? 0 : bookInfo.hashCode());
		result = prime * result + ((bookContent == null) ? 0 : bookContent.hashCode());
		result = prime * result + ((bookName == null) ? 0 : bookName.hashCode());
		result = prime * result + ((editor == null) ? 0 : editor.hashCode());
		result = prime * result + ((genre == null) ? 0 : genre.hashCode());
		result = prime * result + ((isbn == null) ? 0 : isbn.hashCode());
		result = prime * result + pageNum;
		result = prime * result + price;
		result = prime * result + ((publisher == null) ? 0 : publisher.hashCode());
		result = prime * result + sales;
		result = prime * result + stock;
		result = prime * result + ((translator == null) ? 0 : translator.hashCode());
		result = prime * result + ((toc == null) ? 0 : toc.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (member == null) {
			if (other.member != null)
				return false;
		} else if (!member.equals(other.member))
		if (author == null) {
			if (other.author != null)
				return false;
		} else if (!author.equals(other.author))
			return false;
		if (authorNum != other.authorNum)
			return false;
		if (bookDate == null) {
			if (other.bookDate != null)
				return false;
		} else if (!bookDate.equals(other.bookDate))
			return false;
		if (bookId != other.bookId)
			return false;
		if (bookImage == null) {
			if (other.bookImage != null)
				return false;
		} else if (!bookImage.equals(other.bookImage))
			return false;
		if (bookInfo == null) {
			if (other.bookInfo != null)
				return false;
		} else if (!bookInfo.equals(other.bookInfo))
			return false;
		if (bookContent == null) {
			if (other.bookContent != null)
				return false;
		} else if (!bookContent.equals(other.bookContent))
			return false;
		if (bookName == null) {
			if (other.bookName != null)
				return false;
		} else if (!bookName.equals(other.bookName))
			return false;
		if (toc == null) {
			if (other.toc != null)
				return false;
		} else if (!toc.equals(other.toc))
			return false;
		if (editor == null) {
			if (other.editor != null)
				return false;
		} else if (!editor.equals(other.editor))
			return false;
		if (genre == null) {
			if (other.genre != null)
				return false;
		} else if (!genre.equals(other.genre))
			return false;
		if (isbn == null) {
			if (other.isbn != null)
				return false;
		} else if (!isbn.equals(other.isbn))
			return false;
		if (pageNum != other.pageNum)
			return false;
		if (price != other.price)
			return false;
		if (publisher == null) {
			if (other.publisher != null)
				return false;
		} else if (!publisher.equals(other.publisher))
			return false;
		if (sales != other.sales)
			return false;
		if (stock != other.stock)
			return false;
		if (translator == null) {
			if (other.translator != null)
				return false;
		} else if (!translator.equals(other.translator))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Book [bookName=" + bookName + ", price=" + price + ", publisher=" + publisher + ", authorNum="
				+ authorNum + ", genre=" + genre + ", bookId=" + bookId + ", isbn=" + isbn + ", bookImage=" + bookImage
				+ ", bookDate=" + bookDate + ", bookInfo=" + bookInfo + ", editor=" + editor + ", translator="
				+ translator + ", pageNum=" + pageNum + ", stock=" + stock + ", sales=" + sales + ", author=" + author
				+ ", bookContent=" + bookContent +", toc=" + toc + ", member=" + member +"]";
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
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
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
	public String getBookContent() {
		return bookContent;
	}
	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
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
	public String getToc() {
		return toc;
	}
	public void setToc(String toc) {
		this.toc = toc;
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
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getBookCount()
	{
		return bookCount;
	}
	public void setBookCount(int bookCount) 
	{
		this.bookCount = bookCount;
	}
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
