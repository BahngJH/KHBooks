package com.kh.csCenter.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.csCenter.model.dao.QnaDao;
import com.kh.csCenter.model.vo.Qna;

public class QnaService {
	
	public int selectCount() {
		Connection conn = getConnection();
		int result = new QnaDao().selectCount(conn);
		close(conn);
		return result;
	}
	
	public List<Qna> selectAllQna(){
		Connection conn=getConnection();
		List<Qna> list=new QnaDao().selectAllQna(conn);
		close(conn);
		return list;
	}
	
	
	
	
	public List<Qna> selectList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Qna> list=new QnaDao().selectList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	
	

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
