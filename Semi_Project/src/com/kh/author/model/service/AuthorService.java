package com.kh.author.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Properties;

import com.kh.author.model.dao.AuthorDao;
import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;

import static common.JDBCTemplate.*;

public class AuthorService {
	Connection conn;
	
	public AuthorService() {
		conn = getConnection();
	}

	public Author selectAuthor(String authorId) {
		Author author = new AuthorDao().selectAuthor(conn, authorId);
		close(conn);
		return author;
	}

	public Author selectAuthorName(String authorName) {
		Author author = new AuthorDao().selectAuthorName(conn, authorName);
		close(conn);
		return author;
	}

	
	public List<Book> selectAuthorBook(String authorId) {
		List<Book> list = new AuthorDao().selectAuthorBook(conn,authorId);
		close(conn);
		return list;
	}

	public int insertAuthor(String authorName) {
		int result = new AuthorDao().insertAuthor(conn, authorName);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	
}
