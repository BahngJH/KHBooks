package com.kh.author.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;

public class AuthorDao {
	Properties prop;
	
	public AuthorDao() {
		prop = new Properties();
		String filename = AuthorDao.class.getResource("./author-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Author selectAuthor(Connection conn, String authorId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Author author = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAuthor"));
			pstmt.setString(1, authorId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				author = new Author();
				author.setAuthorInfo(rs.getString("authorinfo"));
				author.setAuthorName(rs.getString("authorname"));
				author.setauthorNum(rs.getInt("authornum"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return author;
	}

	public List<Book> selectAuthorBook(Connection conn, String authorId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Book> list = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAuthorBook"));
			pstmt.setString(1, authorId);
			rs = pstmt.executeQuery();
			list = new ArrayList<Book>();
			while(rs.next()) {
				Book b=new Book();
				b.setBookName(rs.getString("bookname"));
				b.setPrice(rs.getInt("price"));
				b.setPublisher(rs.getString("publisher"));
				b.setAuthorNum(rs.getInt("authornum"));
				b.setGenre(rs.getString("genre"));
				b.setBookId(rs.getInt("bookid"));
				b.setIsbn(rs.getString("isbn"));
				b.setBookImage(rs.getString("bookImage"));
				b.setBookInfo(rs.getString("bookinfo"));
				b.setEditor(rs.getString("editor"));
				b.setTranslator(rs.getString("translator"));
				b.setPageNum(rs.getInt("pagenum"));
				b.setStock(rs.getInt("stock"));
				b.setSales(rs.getInt("sales"));
				
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

	public Author selectAuthorName(Connection conn, String authorName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Author author = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAuthorName"));
			pstmt.setString(1, authorName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				author = new Author();
				author.setAuthorInfo(rs.getString("authorinfo"));
				author.setAuthorName(rs.getString("authorname"));
				author.setauthorNum(rs.getInt("authornum"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return author;
	}

	public int insertAuthor(Connection conn, String authorName) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertAuthor"));
			pstmt.setString(1, authorName);
			pstmt.setString(2, "");
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
