package com.kh.review.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.review.model.vo.Review;

public class ReviewDao {
	
	Properties prop=new Properties();
	
	public ReviewDao() {
		String file = ReviewDao.class.getResource("./review_sql.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	// 리뷰 list 반환
	public List<Review> selectList(Connection conn, int memberNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList();
		Review r = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				r = new Review();
				r.setMemberNum(rs.getInt("memberNum"));
				r.setWriteDate(rs.getDate("writeDate"));
				r.setGrade(rs.getInt("grade"));
				r.setReviewContext(rs.getString("reviewContext"));
				r.setBookId(rs.getInt("bookId"));
				r.setReviewNum(rs.getInt("reviewNum"));
				r.setStatus(rs.getString("status"));
				r.setCheckOption(rs.getInt("checkOption"));
				r.setReviewTitle(rs.getString("reviewTitle"));
				list.add(r);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	// 리뷰 삭제
	public int deleteReview(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 리뷰 선택 삭제
	public int deleteSelectReview(Connection conn, List<Integer> nums) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteReview");				/* 삭제 쿼리를 그대로 사용함 (반복해서 쓰기 때문) */
		int[] arr = nums.stream().mapToInt(i -> i).toArray();		/* 리스트 값을 배열로 변환함 (preparedstatement객체에 setting 안되기 때문) */
	
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < nums.size(); i++) {					
				pstmt.setInt(1, arr[i]);
				result += pstmt.executeUpdate();					/* 배열의 값을 하나씩 setting하여 쿼리를 실행, 성공할 때 마다 result에 값을 더함*/
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 리뷰 수정
	public int updateReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		Review review = null;
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getReviewContext());
			pstmt.setInt(3, r.getGrade());
			pstmt.setInt(4, r.getReviewNum());
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
