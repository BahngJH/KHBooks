package com.kh.book.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;

import static common.JDBCTemplate.close;

public class BookDao {
	private Properties prop;
	
	public BookDao() {
		prop = new Properties();
		try {
			String filename = BookDao.class.getResource("./book-query.properties").getPath();
			prop.load(new FileReader(filename));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Book> selectBestseller(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> list = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBestseller"));
			rs = pstmt.executeQuery();
			list = new ArrayList<Book>();
			while(rs.next()) {
				Book b = new Book();
				b.setBookName(rs.getString("bookname"));
				b.setBookId(rs.getInt("bookid"));
				b.setBookImage(rs.getString("bookImage"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public List<Book> selectRecently(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> list = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectRecently"));
			rs = pstmt.executeQuery();
			list = new ArrayList<Book>();
			while(rs.next()) {
				Book b = new Book();
				b.setBookName(rs.getString("bookname"));
				b.setBookId(rs.getInt("bookid"));
				b.setBookImage(rs.getString("bookImage"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	public List<Book> directPay(Connection conn, int bookId){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> list = new ArrayList();
			
		try {
			pstmt = conn.prepareStatement(prop.getProperty("directPay"));
				pstmt.setInt(1, bookId);
				rs = pstmt.executeQuery();				
				while(rs.next()) {
					Book b = new Book();
					b.setBookId(rs.getInt("bookId"));
					b.setBookName(rs.getString("bookname"));				
					b.setBookImage(rs.getString("bookImage"));
					b.setPrice(rs.getInt("price"));
					b.setBookCount(1);
					b.setPublisher(rs.getString("publisher"));
					
					Author a = new Author();
					a.setAuthorName(rs.getString("authorName"));
					b.setAuthor(a);
					
					list.add(b);
				}
			}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	
	public List<Book> payList(Connection conn, List<Integer> ids, int memberNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> list = new ArrayList();
			
		try {
			pstmt = conn.prepareStatement(prop.getProperty("payList"));
			for (int i : ids) {				
				pstmt.setInt(1, i);
				pstmt.setInt(2, memberNum);
				rs = pstmt.executeQuery();				
				
				while(rs.next()) {
					Book b = new Book();
					b.setBookId(rs.getInt("bookId"));
					b.setBookName(rs.getString("bookname"));				
					b.setBookImage(rs.getString("bookImage"));
					b.setPrice(rs.getInt("price"));
					b.setBookCount(rs.getInt("bookCount"));
					b.setPublisher(rs.getString("publisher"));
					
					Author a = new Author();
					a.setAuthorName(rs.getString("authorName"));
					b.setAuthor(a);
					
					list.add(b);
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int insertBook(Connection conn, Book b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			System.out.println(b);
			pstmt = conn.prepareStatement(prop.getProperty("insertBook"));
			pstmt.setString(1, b.getBookName());
			pstmt.setInt(2, b.getPrice());
			pstmt.setString(3, b.getPublisher());
			pstmt.setInt(4, b.getAuthorNum());
			pstmt.setString(5, b.getGenre());
			pstmt.setString(6, b.getIsbn());
			pstmt.setString(7, b.getBookImage());
			pstmt.setDate(8, (Date) b.getBookDate());
			pstmt.setString(9, b.getBookInfo());
			pstmt.setString(10, b.getEditor());
			pstmt.setString(11, b.getTranslator());
			pstmt.setInt(12, b.getPageNum());
			pstmt.setInt(13, 0);
			pstmt.setInt(14, b.getStock());
			pstmt.setString(15, b.getBookContent());
			pstmt.setString(16, b.getToc());
			
			System.out.println(pstmt);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
