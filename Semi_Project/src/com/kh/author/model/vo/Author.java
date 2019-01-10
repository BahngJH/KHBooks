package com.kh.author.model.vo;

public class Author {
	private int authorId;
	private String authorName;
	private String authorInfo;
	
	public Author() {
		// TODO Auto-generated constructor stub
	}

	public Author(int authorId, String authorName, String authorInfo) {
		super();
		this.authorId = authorId;
		this.authorName = authorName;
		this.authorInfo = authorInfo;
	}

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
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
		return "Author [authorId=" + authorId + ", authorName=" + authorName + ", authorInfo=" + authorInfo + "]";
	}
	
	
}
