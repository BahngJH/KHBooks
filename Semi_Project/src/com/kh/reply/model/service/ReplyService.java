package com.kh.reply.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.reply.model.dao.ReplyDao;
import com.kh.reply.model.vo.Reply;




public class ReplyService {
	
	//사용자 댓글 등록
	// 관리자 답변 등록
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

}
