package com.kh.csCenter.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.csCenter.model.dao.QnaDao;
import com.kh.csCenter.model.vo.Qna;
import com.kh.csCenter.model.vo.QnaRe;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class QnaService {

	public int selectCount() {
		Connection conn = getConnection();
		int result = new QnaDao().selectCount(conn);
		close(conn);
		return result;
	}
	
	//답변수정
	public int updateAnswer(QnaRe qr) {
		Connection conn=getConnection();
		int result=new QnaDao().updateAnswer(conn,qr);
		if(result>0){commit(conn);}
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	
	
	

	// 내가 쓴 문의글
	public int selectMyCount(int memberNum) {
		Connection conn = getConnection();
		int result = new QnaDao().selectMyCount(conn, memberNum);
		close(conn);
		return result;
	}

	// 내가 쓴 문의글 목록 List
	public List<Qna> selecMyQnaList(int memberNum, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Qna> list = new QnaDao().selecMyQnaList(conn, memberNum, cPage, numPerPage);
		close(conn);
		return list;
	}

	// 관리자 답변
	public List<QnaRe> selectMyRe(int memberNum) {
		Connection conn = getConnection();
		List<QnaRe> qrList = new QnaDao().selectMyRe(conn, memberNum);
		close(conn);
		return qrList;
	}

	// 전체 문의글
	public List<Qna> selectList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Qna> list = new QnaDao().selectList(conn, cPage, numPerPage);
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

    //문의글 선택
	public Qna selectNo(int no) {
		Connection conn = getConnection();
		Qna q = new QnaDao().selectNo(conn, no);
		close(conn);
		return q;
	}
	

	// 관리자 답변 등록
	public int qnaAnswerEnroll(QnaRe qr) {
		Connection conn = getConnection();
		int rs = new QnaDao().qnaAnswerEnroll(conn, qr);
		if (rs > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return rs;
	}

}
