package com.kh.csCenter.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.csCenter.model.vo.Qna;
import static common.JDBCTemplate.*;

public class QnaDao {
	Properties prop = new Properties();

	public QnaDao() {
		String file = QnaDao.class.getResource("./qna-query.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int selectCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	// 내가 쓴 문의글 리스트 Dao
	public List<Qna> selecMyQnaList(Connection conn, int memberNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		String sql = prop.getProperty("selectMyQnaList");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
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
		System.out.println(list);
		return list;

	}

	// 문의글 리스트
	public List<Qna> selectAllQna(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		String sql = prop.getProperty("selectQna");

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Qna q = new Qna();
				q.setQnaNum(rs.getInt("qnaNum"));
				q.setQnaPart(rs.getString("qnaPart"));
				q.setQnaTitle(rs.getString("qnaTitle"));
				q.setQnaDate(rs.getDate("qnaDate"));				
				q.setQnaStatus(rs.getString("qnaStatus"));
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

	// 문의글 리스트 페이징
	public List<Qna> selectList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Qna q = new Qna();
				q.setQnaNum(rs.getInt("qnaNum"));
				q.setQnaPart(rs.getString("qnaPart"));
				q.setQnaTitle(rs.getString("qnaTitle"));
				q.setQnaDate(rs.getDate("qnaDate"));				
				q.setQnaStatus(rs.getString("Status"));
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

	// 1:1 문의글 등록 Dao
	public int qnaEnroll(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int rs = 0;
		System.out.println(q);
		String sql = prop.getProperty("qnaEnroll");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q.getQnaWriter());
			pstmt.setString(2, q.getQnaTitle());
			pstmt.setString(3, q.getQnaContent());
			pstmt.setString(4, q.getQnaPart());
			pstmt.setString(5, q.getQnaOriFile());
			pstmt.setString(6, q.getQnaReFile());
			pstmt.setString(7, q.getQnaAnswer());
			pstmt.setString(8, q.getQnaMail());
			pstmt.setString(9, q.getQnaTel());
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rs;
	}

}
