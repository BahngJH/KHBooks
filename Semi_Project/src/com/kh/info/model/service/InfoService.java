package com.kh.info.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

import java.sql.Connection;

import com.kh.book.model.vo.Book;
import com.kh.info.model.dao.InfoDao;

public class InfoService {
	
	public Book selectInfoBook(int bookId)
	{
		Connection conn=getConnection();
		Book b=new InfoDao().selectInfoBook(conn,bookId);
		close(conn);
		return b;
	}
}
