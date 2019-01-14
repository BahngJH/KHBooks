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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((authorInfo == null) ? 0 : authorInfo.hashCode());
		result = prime * result + ((authorName == null) ? 0 : authorName.hashCode());
		result = prime * result + authorNum;
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
		Author other = (Author) obj;
		if (authorInfo == null) {
			if (other.authorInfo != null)
				return false;
		} else if (!authorInfo.equals(other.authorInfo))
			return false;
		if (authorName == null) {
			if (other.authorName != null)
				return false;
		} else if (!authorName.equals(other.authorName))
			return false;
		if (authorNum != other.authorNum)
			return false;
		return true;
	}
	
	
}
