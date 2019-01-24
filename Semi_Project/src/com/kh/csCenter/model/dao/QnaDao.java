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
import com.kh.csCenter.model.vo.QnaRe;
import com.kh.member.model.vo.Member;
import com.kh.notice.model.vo.Notice;

import static common.JDBCTemplate.*;

public class QnaDao {
	Properties prop = new Properties();

	public QnaDao() {
		String file = QnaDao.class.getResource("./qna_query.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 답변수정
	public int updateAnswer(Connection conn, QnaRe qr) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateAnswer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qr.getReNum());
			pstmt.setInt(2, qr.getAdminNum());		
			pstmt.setString(3, qr.getReMail());
			pstmt.setString(4, qr.getReContent());
			pstmt.setInt(5, qr.getQnaNum());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	// 마이페이지 문의글 리스트
	public List<Qna> selectList(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("mySelectList");
		List<Qna> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Qna q = new Qna();
				q.setQnaTitle(rs.getString("qnaTitle"));
				q.setQnaNum(rs.getInt("qnaNum"));
				q.setQnaDate(rs.getDate("qnaDate"));
				q.setStatus(rs.getString("qnaStatus"));
				q.setReCheck(rs.getString("recheck"));
				
				list.add(q);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
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

	// 내가 쓴 문의글 갯수
	public int selectMyCount(Connection conn, int memberNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectMyCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
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

	// 내가 쓴 글목록 list 페이징
	public List<Qna> selecMyQnaList(Connection conn, int memberNum, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		String sql = prop.getProperty("selectMyList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
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
				q.setReContent(rs.getString("reContent"));
				q.setReCheck(rs.getString("reCheck"));

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

	// 관리자 답변
	public List<QnaRe> selectMyRe(Connection conn, int memberNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaRe> qrList = new ArrayList();
		String sql = prop.getProperty("selectRe");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaRe qr = new QnaRe();
				qr.setReNum(rs.getInt("reNum"));
				qr.setAdminNum(rs.getInt("memberNum"));
				qr.setQnaNum(rs.getInt("qnaNum"));
				qr.setReMail(rs.getString("reMail"));
				qr.setReContent(rs.getString("reContent"));
				qr.setReStatus(rs.getString("reStatus"));
				qr.setReDate(rs.getDate("reDate"));
				qrList.add(qr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(qrList);
		return qrList;
	}

	// 전체 문의글 리스트 페이징(관리자)
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
				q.setReCheck(rs.getString("reCheck"));
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("list : " + list);
		return list;

	}

	// 문의글 선택(관리자)
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
				q.setReContent(rs.getString("reContent"));
				q.setReNum(rs.getInt("reNum"));
				q.setReCheck(rs.getString("reCheck"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(rs);
		}
		return q;
	}

	// 1:1 답변 등록
	public int qnaAnswerEnroll(Connection conn, QnaRe qr) {
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = prop.getProperty("enrollAnswer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qr.getAdminNum());
			pstmt.setString(2, qr.getReMail());
			pstmt.setInt(3, qr.getQnaNum());
			pstmt.setString(4,qr.getReContent());
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rs;
	}
	
	//답변 등록 상태 업데이트
	public int updateReCheck(Connection conn, Qna q){
		PreparedStatement pstmt = null;
		int rs1 = 0;
		String sql = prop.getProperty("updateReCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getReCheck());
			pstmt.setInt(2, q.getQnaNum());

			rs1 = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("recheck 수정 됐나요?"+rs1);
		return rs1;
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
