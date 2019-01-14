package com.kh.search.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.search.model.dao.SearchDao;
import com.kh.search.model.vo.GenreCount;

import static common.JDBCTemplate.*;

public class SearchService {

	private Connection conn;
	
	public SearchService() {
		conn = getConnection();
	}
	
	public List<Book> selectBook(String key) {
		List<Book> list = new SearchDao().selectBook(conn, key);

		close(conn);
		
		return list;
	}

	public List<Author> selectAuthor(String key) {
		List<Author> list = new SearchDao().selectAuthor(conn, key);
		close(conn);
		return list;
	}

	public List<GenreCount> getGenreCount(String key) {
		List<GenreCount> list = new SearchDao().getGenreCount(conn, key);
		close(conn);
		return list;
	}

}
