package com.kh.info.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.book.model.vo.Book;
import com.kh.info.model.dao.InfoDao;
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
	
	public List<Review> selectInfoReview(int bookId)
	{
		Connection conn=getConnection();
		List<Review> list=new InfoDao().selectInfoReview(conn, bookId);
		close(conn);
		return list;
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
		
		return result;
	}
}
