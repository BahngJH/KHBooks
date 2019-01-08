package com.kh.search.model.dao;

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
	
	public List<Book> selectBook(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> list=null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty(key));
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Book>();
			
			while(rs.next()) {
				Book b = new Book();
				b.setBookDate(rs.getDate(""));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
