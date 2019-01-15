package com.kh.search.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.search.model.vo.GenreCount;

import static common.JDBCTemplate.close;

public class SearchDao {

	private Properties prop;
	
	public SearchDao() {
		prop = new Properties();
		
		try {
			String filename = SearchDao.class.getResource("./search-query.properties").getPath();
			prop.load(new FileReader(filename));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<Book> selectBook(Connection conn, String key, int cPage, int numPerPage) {
		List<Book> list=new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchBook"));
			pstmt.setString(1, "%"+key+"%");
			pstmt.setString(2, "%"+key+"%");
			pstmt.setString(3, "%"+key+"%");
			pstmt.setInt(4, (cPage-1) * numPerPage+1);
			pstmt.setInt(5, cPage * numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book b = new Book();
				/* 작가 정보 */
				Author t = new Author();
				t.setAuthorName(rs.getString("authorname"));
				t.setAuthorInfo(rs.getString("authorinfo"));
				t.setauthorNum(rs.getInt("authornum"));
				/*책 정보*/
				b.setAuthor(t);
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
		}catch(SQLException e){
			e.printStackTrace();		
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	
	public List<Author> selectAuthor(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Author> list = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchAuthor"));
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			list = new ArrayList<Author>();
			
			while(rs.next()) {
				Author a = new Author();
				a.setAuthorInfo(rs.getString("authorinfo"));
				a.setAuthorName(rs.getString("authorname"));
				a.setauthorNum(rs.getInt("authornum"));
				list.add(a);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public List<GenreCount> getGenreCount(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GenreCount> list = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getGenreCount"));
			pstmt.setString(1, "%"+key+"%");
			pstmt.setString(2, "%"+key+"%");
			pstmt.setString(3, "%"+key+"%");
			rs = pstmt.executeQuery();
			list = new ArrayList<GenreCount>();
			
			while(rs.next()) {
				GenreCount c = new GenreCount();
				c.setCnt(rs.getInt("cnt"));
				c.setGenre(rs.getString("genre"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int getBookCount(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getBookCount"));
			pstmt.setString(1, "%"+key+"%");
			pstmt.setString(2, "%"+key+"%");
			pstmt.setString(3, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("CNT");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

}
