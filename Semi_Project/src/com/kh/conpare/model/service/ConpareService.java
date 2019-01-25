package com.kh.conpare.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.book.model.vo.Book;
import com.kh.conpare.model.dao.ConpareDao;

public class ConpareService {
	
	public List<Book> selectConpareBook(int bookId)
	{
		Connection conn=getConnection();
		List<Book> bList=new ConpareDao().selectConpareBook(conn, bookId);
		close(conn);
		return bList;
	}
	
}
