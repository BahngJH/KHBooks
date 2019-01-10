package com.kh.author.model.vo;

public class Author {
	private int authorNum;
	private String authorName;
	private String authorInfo;
	
	public Author() {
		// TODO Auto-generated constructor stub
	}

	public Author(int authorNum, String authorName, String authorInfo) {
		super();
		this.authorNum = authorNum;
		this.authorName = authorName;
		this.authorInfo = authorInfo;
	}

	public int getauthorNum() {
		return authorNum;
	}

	public void setauthorNum(int authorNum) {
		this.authorNum = authorNum;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getAuthorInfo() {
		return authorInfo;
	}

	public void setAuthorInfo(String authorInfo) {
		this.authorInfo = authorInfo;
	}

	@Override
	public String toString() {
		return "Author [authorNum=" + authorNum + ", authorName=" + authorName + ", authorInfo=" + authorInfo + "]";
	}
	
	
}
