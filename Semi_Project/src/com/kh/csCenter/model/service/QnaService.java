package com.kh.csCenter.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.csCenter.model.dao.QnaDao;
import com.kh.csCenter.model.vo.Qna;

public class QnaService {

	public int qnaEnroll(Qna q) {
		Connection conn = getConnection();
		int rs = new QnaDao().qnaEnroll(conn, q);
		if (rs > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return rs;

	}

}