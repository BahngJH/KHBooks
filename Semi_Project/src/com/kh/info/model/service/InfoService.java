package com.kh.info.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.book.model.vo.Book;
import com.kh.info.model.dao.InfoDao;
import com.kh.mark.model.vo.Mark;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;
import com.kh.wish.model.vo.Wish;

public class InfoService {
	
	public Book selectInfoBook(int bookId)
	{
		Connection conn=getConnection();
		Book b=new InfoDao().selectInfoBook(conn,bookId);
		close(conn);
		return b;
	}
	
	public List<Review> selectInfoReview(int bookId, int cPage, int numPerPage)
	{
		Connection conn=getConnection();
		List<Review> list=new InfoDao().selectInfoReview(conn, bookId, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int selectReviewCount() {
		Connection conn=getConnection();
		int result=new InfoDao().selectReviewCount(conn);
		close(conn);
		return result;
	}
	
	public int insertWish(Wish w)
	{
		Connection conn=getConnection();
		int result=new InfoDao().insertWish(conn,w);
		if(result>0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		System.out.println("장바구니 서비스에선 넘어오나?"+w);
		
		return result;
	}
	
	public int insertReview(Review r)
	{
		Connection conn=getConnection();
		int result=new InfoDao().insertReview(conn,r);
		if(result>0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		System.out.println("리뷰 서비스에선 넘어오나?"+r);
		
		return result;
	}
	
	public int insertMark(Mark j)
	{
		Connection conn=getConnection();
		int result=new InfoDao().insertMark(conn,j);
		if(result>0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		System.out.println("찜 서비스에선 넘어오나?"+j);
		
		return result;
	}
	
	public int deleteReview(int reviewNum) {
		Connection conn=getConnection();
		int result=new InfoDao().deleteReview(conn, reviewNum);
		if(result>0) {
			commit(conn);
		} 
		else {
			rollback(conn);
		}
		close(conn);
		System.out.println("리뷰삭제 서비스에선 넘어오나? "+reviewNum);
		return result;
	}
}
