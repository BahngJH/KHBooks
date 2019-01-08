package com.kh.search.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.book.model.vo.Book;
import com.kh.search.model.dao.SearchDao;

import static common.JDBCTemplate.getConnection;

public class SearchService {

	private Connection conn;
	
	public SearchService() {
		conn = getConnection();
	}
	
	public List<Book> selectBook(String key) {
		List<Book> list = new SearchDao().selectBook(conn, key);

		return list;
	}

}
