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
	//내가 쓴 문의글 List Service
	public List<Qna> selecMyQnaList(int memberNum){
		Connection conn=getConnection();
		List<Qna> list=new QnaDao().selecMyQnaList(conn, memberNum);
		close(conn);
		return list;
	
	}
	//전체 문의글 (사용자 사용)Service
	public List<Qna> selectAllQna(){
		Connection conn=getConnection();
		List<Qna> list=new QnaDao().selectAllQna(conn);
		close(conn);
		return list;
	}
		
	
	//페이징 Service
	public List<Qna> selectList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Qna> list=new QnaDao().selectList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	
	// 문의글 등록 Service
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
