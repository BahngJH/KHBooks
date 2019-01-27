package com.kh.reply.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.reply.model.dao.ReplyDao;
import com.kh.reply.model.vo.Reply;

public class ReplyService {

	// 사용자 댓글 등록
	public int enrollReply(Reply r) {
		Connection conn = getConnection();
		int rs = new ReplyDao().enrollReply(conn, r);
		if (rs > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return rs;
	}

	// 댓글 목록 불러오기
	public List<Reply> selectReplyList(int no) {
		Connection conn = getConnection();
		List<Reply> list = new ReplyDao().selectReplyList(conn, no);
		close(conn);
		return list;
	}
	
	//댓글 삭제
	public int deleteReply(int reNo) {
		Connection conn =getConnection();
		int result = new ReplyDao().deleteReply(conn,reNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	//댓글 수정
	public int updateReply(int reNo) {
		Connection conn =getConnection();
		int result = new ReplyDao().deleteReply(conn,reNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
			
}