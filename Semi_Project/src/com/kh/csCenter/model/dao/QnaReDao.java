package com.kh.csCenter.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.csCenter.model.vo.Qna;
import com.kh.notice.model.vo.Notice;

public class QnaReDao {
	
	Properties prop = new Properties();

	public QnaReDao() {
		String file = QnaDao.class.getResource("./qnaRe_query.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 문의글 리스트
	public List<Qna> selectAllQna(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		String sql = prop.getProperty("AllQnaList");

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Qna q = new Qna();			
				q.setQnaNum(rs.getInt("qnaNum"));
				q.setQnaWriter(rs.getInt("memberNum"));
				q.setQnaTitle(rs.getString("qnaTitle"));
				q.setQnaContent(rs.getString("qnaContent"));
				q.setQnaDate(rs.getDate("qnaDate"));				
				q.setQnaStatus(rs.getString("qnaStatus"));
				q.setQnaPart(rs.getString("qnaPart"));
				q.setQnaOriFile(rs.getString("qna_original_filename"));
				q.setQnaReFile(rs.getString("qna_renamed_filename"));
				q.setQnaAnswer(rs.getString("qnaAnswer"));
				q.setQnaMail(rs.getString("qnaMail"));
				q.setQnaTel(rs.getString("qnaTel"));			
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("리스트좀 받아옵시다"+list);
		return list;		
	}
	
	//문의글 선택 		
	public Qna selectNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Qna q = null;
		String sql = prop.getProperty("selectNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				q = new Qna();
				q.setQnaNum(rs.getInt("qnaNum"));
				q.setQnaWriter(rs.getInt("memberNum"));
				q.setQnaTitle(rs.getString("qnaTitle"));
				q.setQnaContent(rs.getString("qnaContent"));
				q.setQnaDate(rs.getDate("qnaDate"));				
				q.setQnaStatus(rs.getString("qnaStatus"));
				q.setQnaPart(rs.getString("qnaPart"));
				q.setQnaOriFile(rs.getString("qna_original_filename"));
				q.setQnaReFile(rs.getString("qna_renamed_filename"));
				q.setQnaAnswer(rs.getString("qnaAnswer"));
				q.setQnaMail(rs.getString("qnaMail"));
				q.setQnaTel(rs.getString("qnaTel"));							
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(rs);
		}
		return q;

	}


}
