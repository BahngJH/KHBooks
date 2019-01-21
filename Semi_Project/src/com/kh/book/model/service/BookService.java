package com.kh.book.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.book.model.dao.BookDao;
import com.kh.book.model.vo.Book;

import static common.JDBCTemplate.*;

public class BookService {
	private Connection conn;
	public BookService() {		
		conn = getConnection();
	}
	
	public List<Book> selectBestseller(){
		List<Book> list = new BookDao().selectBestseller(conn);
		close(conn);
		return list;
	}
}
