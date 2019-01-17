package com.kh.csCenter.model.vo;

import java.util.Date;

public class Qna {
	private int qnaNum;
	private String qnaPart;
	private int qnaWriter;
	private String qnaAnswer;
	private String qnaMail;
	private String qnaTel;
	private String qnaTitle;
	private String qnaContent;
	private String qnaOriFile;
	private String qnaReFile;
	private Date qnaDate;
	private int qnaReadCount;
	private String qnaStatus;

	public Qna() {
		super();
	}

	public Qna(int qnaNum, String qnaPart, int qnaWriter, String qnaAnswer, String qnaMail, String qnaTel,
			String qnaTitle, String qnaContent, String qnaOriFile, String qnaReFile, Date qnaDate, int qnaReadCount,
			String qnaStatus) {
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
		this.qnaReadCount = qnaReadCount;
		this.qnaStatus = qnaStatus;
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

	public int getQnaReadCount() {
		return qnaReadCount;
	}

	public void setQnaReadCount(int qnaReadCount) {
		this.qnaReadCount = qnaReadCount;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	@Override
	public String toString() {
		return "Qna [qnaNum=" + qnaNum + ", qnaPart=" + qnaPart + ", qnaWriter=" + qnaWriter + ", qnaAnswer="
				+ qnaAnswer + ", qnaMail=" + qnaMail + ", qnaTel=" + qnaTel + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaOriFile=" + qnaOriFile + ", qnaReFile=" + qnaReFile + ", qnaDate=" + qnaDate
				+ ", qnaReadCount=" + qnaReadCount + ", qnaStatus=" + qnaStatus + "]";
	}

}
