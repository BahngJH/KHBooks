package com.kh.csCenter.model.vo;

import java.util.Date;

public class Qna {
	private int qnaNum;
	private String qnaTitle;
	private String qnaPart;
	private String qnaWriter;
	private String qnaContent;
	private String qnaOriFile;
	private String qnaReFile;
	private Date qnaDate;
	private int readCount;

	public Qna() {
		super();
	}

	public Qna(int qnaNum, String qnaTitle, String qnaPart, String qnaWriter, String qnaContent, String qnaOriFile,
			String qnaReFile, Date qnaDate, int readCount) {
		super();
		this.qnaNum = qnaNum;
		this.qnaTitle = qnaTitle;
		this.qnaPart = qnaPart;
		this.qnaWriter = qnaWriter;
		this.qnaContent = qnaContent;
		this.qnaOriFile = qnaOriFile;
		this.qnaReFile = qnaReFile;
		this.qnaDate = qnaDate;
		this.readCount = readCount;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaPart() {
		return qnaPart;
	}

	public void setQnaPart(String qnaPart) {
		this.qnaPart = qnaPart;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
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

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "Qna [qnaNum=" + qnaNum + ", qnaTitle=" + qnaTitle + ", qnaPart=" + qnaPart + ", qnaWriter=" + qnaWriter
				+ ", qnaContent=" + qnaContent + ", qnaOriFile=" + qnaOriFile + ", qnaReFile=" + qnaReFile
				+ ", qnaDate=" + qnaDate + ", readCount=" + readCount + "]";
	}
}
