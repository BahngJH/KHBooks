package com.kh.review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
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
	
	// 리뷰 삭제
	public int deleteReview(int no) {
		Connection conn = getConnection();
		int result = new ReviewDao().deleteReview(conn, no);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}		
		return result;
	}
	
	// 리뷰 선택 삭제
	public int deleteSelectReview(List<Integer> nums) {
		Connection conn = getConnection();
		int result = new ReviewDao().deleteSelectReview(conn, nums);
		if(result > nums.size() - 1) {		/*선택 값이 여러개일 수 있기 때문에 조건을  0이 아닌 size로 함*/
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
