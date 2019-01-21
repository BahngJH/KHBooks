package com.kh.book.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

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
}
