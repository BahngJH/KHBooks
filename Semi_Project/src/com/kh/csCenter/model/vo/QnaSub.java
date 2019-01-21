package com.kh.csCenter.model.vo;

import java.util.Date;

public class QnaSub {
	private int memberNum;
	private int reNum;
	private String subContent;
	private int subNum;
	private Date subDate;
	private String subState;
	
	public QnaSub() {
		super();
	}
	
	public QnaSub(int memberNum, int reNum, String subContent, int subNum, Date subDate, String subState) {
		super();
		this.memberNum = memberNum;
		this.reNum = reNum;
		this.subContent = subContent;
		this.subNum = subNum;
		this.subDate = subDate;
		this.subState = subState;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getReNum() {
		return reNum;
	}

	public void setReNum(int reNum) {
		this.reNum = reNum;
	}

	public String getSubContent() {
		return subContent;
	}

	public void setSubContent(String subContent) {
		this.subContent = subContent;
	}

	public int getSubNum() {
		return subNum;
	}

	public void setSubNum(int subNum) {
		this.subNum = subNum;
	}

	public Date getSubDate() {
		return subDate;
	}

	public void setSubDate(Date subDate) {
		this.subDate = subDate;
	}

	public String getSubState() {
		return subState;
	}

	public void setSubState(String subState) {
		this.subState = subState;
	}

	@Override
	public String toString() {
		return "QnaSub [memberNum=" + memberNum + ", reNum=" + reNum + ", subContent=" + subContent + ", subNum="
				+ subNum + ", subDate=" + subDate + ", subState=" + subState + "]";
	}
	

	
}
