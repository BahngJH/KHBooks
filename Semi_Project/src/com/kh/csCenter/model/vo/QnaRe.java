package com.kh.csCenter.model.vo;

import java.util.Date;

public class QnaRe {
	private int reNum;// 답변글 번호
	private int adminNum;// 회원번호(관리자) memberNum
	private int qnaNum;// 문의글 번호
	private String reCheck;// 사용자 메일 수신 동의 여부
	private String reMail;// 메일전송여부
	private String reContent;// 답변내용
	private String reStatus;// 글상태
	private Date reDate;// 답변 날짜>>읽음여부 판단

	public QnaRe() {
		super();
	}

	public QnaRe(int reNum, int adminNum, int qnaNum, String reCheck, String reMail, String reContent, String reStatus,
			Date reDate) {
		super();
		this.reNum = reNum;
		this.adminNum = adminNum;
		this.qnaNum = qnaNum;
		this.reCheck = reCheck;
		this.reMail = reMail;
		this.reContent = reContent;
		this.reStatus = reStatus;
		this.reDate = reDate;
	}

	public int getReNum() {
		return reNum;
	}

	public void setReNum(int reNum) {
		this.reNum = reNum;
	}

	public int getAdminNum() {
		return adminNum;
	}

	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public String getReCheck() {
		return reCheck;
	}

	public void setReCheck(String reCheck) {
		this.reCheck = reCheck;
	}

	public String getReMail() {
		return reMail;
	}

	public void setReMail(String reMail) {
		this.reMail = reMail;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public String getReStatus() {
		return reStatus;
	}

	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}

	public Date getReDate() {
		return reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}

	@Override
	public String toString() {
		return "QnaRe [reNum=" + reNum + ", adminNum=" + adminNum + ", qnaNum=" + qnaNum + ", reCheck=" + reCheck
				+ ", reMail=" + reMail + ", reContent=" + reContent + ", reStatus=" + reStatus + ", reDate=" + reDate
				+ "]";
	}

}
