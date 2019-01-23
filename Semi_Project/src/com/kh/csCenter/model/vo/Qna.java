package com.kh.csCenter.model.vo;

import java.util.Date;

public class Qna {
	private int qnaNum;// 문의 번호 default
	private String qnaPart;// 상담분류
	private int qnaWriter;// 회원번호 memberNum
	private String qnaAnswer;// 메일 답변 여부
	private String qnaMail;// 문의자 메일
	private String qnaTel;// 문의자 전화번호
	private String qnaTitle;// 문의 제목
	private String qnaContent;// 문의 내용
	private String qnaOriFile;// 이전파일
	private String qnaReFile;// 새로운 파일
	private Date qnaDate;// 조회수>>읽음여부 판단
	private String qnaStatus;// 삭제여부
	private String reContent;// 관리자 답변 내용
	private int reNum;// 답글 번호
	private String reCheck;//답변상태


	public Qna() {
		super();
	}


	public Qna(int qnaNum, String qnaPart, int qnaWriter, String qnaAnswer, String qnaMail, String qnaTel,
			String qnaTitle, String qnaContent, String qnaOriFile, String qnaReFile, Date qnaDate, String qnaStatus,
			String reContent, int reNum, String reCheck) {
		super();
		this.qnaNum = qnaNum;
		this.qnaPart = qnaPart;
		this.qnaWriter = qnaWriter;
		this.qnaAnswer = qnaAnswer;
		this.qnaMail = qnaMail;
		this.qnaTel = qnaTel;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaOriFile = qnaOriFile;
		this.qnaReFile = qnaReFile;
		this.qnaDate = qnaDate;
		this.qnaStatus = qnaStatus;
		this.reContent = reContent;
		this.reNum = reNum;
		this.reCheck = reCheck;
	}


	public int getQnaNum() {
		return qnaNum;
	}


	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}


	public String getQnaPart() {
		return qnaPart;
	}


	public void setQnaPart(String qnaPart) {
		this.qnaPart = qnaPart;
	}


	public int getQnaWriter() {
		return qnaWriter;
	}


	public void setQnaWriter(int qnaWriter) {
		this.qnaWriter = qnaWriter;
	}


	public String getQnaAnswer() {
		return qnaAnswer;
	}


	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}


	public String getQnaMail() {
		return qnaMail;
	}


	public void setQnaMail(String qnaMail) {
		this.qnaMail = qnaMail;
	}


	public String getQnaTel() {
		return qnaTel;
	}


	public void setQnaTel(String qnaTel) {
		this.qnaTel = qnaTel;
	}


	public String getQnaTitle() {
		return qnaTitle;
	}


	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}


	public String getQnaContent() {
		return qnaContent;
	}


	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}


	public String getQnaOriFile() {
		return qnaOriFile;
	}


	public void setQnaOriFile(String qnaOriFile) {
		this.qnaOriFile = qnaOriFile;
	}


	public String getQnaReFile() {
		return qnaReFile;
	}


	public void setQnaReFile(String qnaReFile) {
		this.qnaReFile = qnaReFile;
	}


	public Date getQnaDate() {
		return qnaDate;
	}


	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}


	public String getQnaStatus() {
		return qnaStatus;
	}


	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}


	public String getReContent() {
		return reContent;
	}


	public void setReContent(String reContent) {
		this.reContent = reContent;
	}


	public int getReNum() {
		return reNum;
	}


	public void setReNum(int reNum) {
		this.reNum = reNum;
	}


	public String getReCheck() {
		return reCheck;
	}


	public void setReCheck(String reCheck) {
		this.reCheck = reCheck;
	}


	@Override
	public String toString() {
		return "Qna [qnaNum=" + qnaNum + ", qnaPart=" + qnaPart + ", qnaWriter=" + qnaWriter + ", qnaAnswer="
				+ qnaAnswer + ", qnaMail=" + qnaMail + ", qnaTel=" + qnaTel + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaOriFile=" + qnaOriFile + ", qnaReFile=" + qnaReFile + ", qnaDate=" + qnaDate
				+ ", qnaStatus=" + qnaStatus + ", reContent=" + reContent + ", reNum=" + reNum + ", reCheck=" + reCheck
				+ "]";
	}

	
}
