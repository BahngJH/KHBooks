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

	public List<Book> selectRecently() {
		List<Book> list = new BookDao().selectRecently(conn);
		close(conn);
		return list;
	}
	
	public List<Book> payList(List<Integer> ids, int memberNum) {
		List<Book> list = new BookDao().payList(conn, ids, memberNum);
		close(conn);
		return list;
	}
	
	public int insertBook(Book book) {
		int result = new BookDao().insertBook(conn, book);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}
