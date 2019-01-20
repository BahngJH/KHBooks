package com.kh.info.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.review.model.vo.Review;
import com.kh.wish.model.vo.Wish;

public class InfoDao {

	private Properties prop=new Properties();
	public InfoDao(){
		try {
			String fileName=InfoDao.class.getResource("./info-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
	}
	
	public Book selectInfoBook(Connection conn,int bookId)
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Book b=null;
		String sql=prop.getProperty("selectInfoBook");
		try
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				b=new Book();
				b.setBookName(rs.getString("bookName"));
				b.setPrice(rs.getInt("price"));
				b.setToc(rs.getString("toc"));
				b.setPublisher(rs.getString("publisher"));
				b.setAuthorNum(rs.getInt("authorNum"));
				b.setGenre(rs.getString("genre"));
				b.setBookId(rs.getInt("bookId"));
				b.setIsbn(rs.getString("isbn"));
				b.setBookImage(rs.getString("bookImage"));
				b.setBookDate(rs.getDate("bookDate"));
				b.setBookInfo(rs.getString("bookInfo"));
				b.setBookContent(rs.getString("bookContent"));
				b.setEditor(rs.getString("editor"));
				b.setTranslator(rs.getString("translator"));
				b.setPageNum(rs.getInt("pageNum"));
				b.setStock(rs.getInt("stock"));
				b.setSales(rs.getInt("sales"));
				Author a = new Author();
				a.setAuthorName(rs.getString("authorName"));
				a.setAuthorInfo(rs.getString("authorInfo"));
				b.setAuthor(a);				
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(rs);
			close(pstmt);
		}
		return b;
	}
	public List<Review> selectInfoReview(Connection conn, int bookId)
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Review> list=new ArrayList();
		String sql=prop.getProperty("selectInfoReview");
		try
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Review r=new Review();
				r.setBookId(rs.getInt("bookId"));
				r.setGrade(rs.getInt("grade"));
				r.setCheckOption(rs.getInt("checkOption"));
				r.setMemberNum(rs.getInt("memberNum"));
				r.setReviewContext(rs.getString("reviewContext"));
				r.setReviewNum(rs.getInt("reviewNum"));
				r.setStatus(rs.getString("status"));
				r.setWriteDate(rs.getDate("writeDate"));
				
				list.add(r);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int insertWish(Connection conn, Wish w)
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertWish");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, w.getWishNo());
			pstmt.setInt(2, w.getMemberNum());
			pstmt.setInt(3, w.getBookId());
			pstmt.setInt(4, w.getBookCount());
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(pstmt);
		}
		return result;
	}
	
	public int insertReview(Connection conn, Review r)
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertReview");
		try
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, r.getMemberNum());
			pstmt.setInt(2, r.getGrade());
			pstmt.setInt(3, r.getBookId());
			pstmt.setInt(4, r.getCheckOption());
			pstmt.setString(5, r.getReviewContext());
			
			result=pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(pstmt);
		}
		return result;
	}
}
