package com.kh.search.model.vo;

public class GenreCount {
	private String genre;
	private int cnt;
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public GenreCount() {
		// TODO Auto-generated constructor stub
	}
	
	public GenreCount(String genre, int cnt) {
		super();
		this.genre = genre;
		this.cnt = cnt;
	}
	
	

}
