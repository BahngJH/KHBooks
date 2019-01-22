package com.kh.info.model.vo;

public class Info {
	private int cnt;
	private int avg;
	
	public Info() {
	}

	public Info(int cnt, int avg) {
		super();
		this.cnt = cnt;
		this.avg = avg;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	@Override
	public String toString() {
		return "Info [cnt=" + cnt + ", avg=" + avg + "]";
	}
	
}
