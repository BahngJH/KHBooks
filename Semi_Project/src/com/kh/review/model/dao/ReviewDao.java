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
}
