package com.kh.review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

public class ReviewService {
	
	// 리뷰 list 반환
	public List<Review> selectList(int memberNum) {
		Connection conn = getConnection();
		List<Review> list = new ReviewDao().selectList(conn, memberNum);
		
		close(conn);
		return list;
	}
}
