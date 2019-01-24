package com.kh.reply.model.vo;

import java.util.Date;

public class Reply {

	private int orderReCoNum; // 댓글 번호
	private int memberNum; // 회원 번호
	private int orderBookNum; // 주문 게시글 번호
	private String orderReContent; // 내용
	private String status; // 상태
	private Date orderReDate; // 날짜, 시간
	private String memberId;//회원아이디
	
	

	public Reply() {
		super();
	}


	public Reply(int orderReCoNum, int memberNum, int orderBookNum, String orderReContent, String status,
			Date orderReDate, String memberId) {
		super();
		this.orderReCoNum = orderReCoNum;
		this.memberNum = memberNum;
		this.orderBookNum = orderBookNum;
		this.orderReContent = orderReContent;
		this.status = status;
		this.orderReDate = orderReDate;
		this.memberId = memberId;
	}


	public int getOrderReCoNum() {
		return orderReCoNum;
	}


	public void setOrderReCoNum(int orderReCoNum) {
		this.orderReCoNum = orderReCoNum;
	}


	public int getMemberNum() {
		return memberNum;
	}


	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}


	public int getOrderBookNum() {
		return orderBookNum;
	}


	public void setOrderBookNum(int orderBookNum) {
		this.orderBookNum = orderBookNum;
	}


	public String getOrderReContent() {
		return orderReContent;
	}


	public void setOrderReContent(String orderReContent) {
		this.orderReContent = orderReContent;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getOrderReDate() {
		return orderReDate;
	}


	public void setOrderReDate(Date orderReDate) {
		this.orderReDate = orderReDate;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "Reply [orderReCoNum=" + orderReCoNum + ", memberNum=" + memberNum + ", orderBookNum=" + orderBookNum
				+ ", orderReContent=" + orderReContent + ", status=" + status + ", orderReDate=" + orderReDate
				+ ", memberId=" + memberId + "]";
	}

	

}
