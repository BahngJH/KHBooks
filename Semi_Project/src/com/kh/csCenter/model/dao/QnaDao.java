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

	// 문의글 리스트
	public List<Qna> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Qna q = new Qna();
				q.setQnaNum(rs.getInt("qnaNum"));
				q.setQnaPart(rs.getString("qnaPart"));
				q.setQnaTitle(rs.getString("qnaTitle"));
				q.setQnaDate(rs.getDate("qnaDate"));
				q.setQnaReadCount(rs.getInt("qnaReadCount"));
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

	public QnaDao() {
		String file = QnaDao.class.getResource("./qna_sql.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 1:1 문의글 등록 Dao
	public int qnaEnroll(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = prop.getProperty("qnaEnroll");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQnaWriter());
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
