package com.kh.order.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.book.model.vo.Book;
import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Order;

public class OrderService {
	
	public int selectOrderCount() {
		Connection conn = getConnection();
		int result = new OrderDao().selectOrderCount(conn);
		close(conn);
		return result;
	}

	public List<Order> selectList(int no, int cPage, int numPerPage) {
		Connection conn = getConnection();
		
		List<Order> list = new OrderDao().selectList(conn, no, cPage, numPerPage);
		
		close(conn);
		
		return list;		
	}
	
	public List<Order> selectList(int no) {
		Connection conn = getConnection();
		
		List<Order> list = new OrderDao().selectList(conn, no);
		
		close(conn);
		
		return list;		
	}
	

	public List<Order> searchOrder(String keyword, int no) {
		Connection conn = getConnection();
		
		List<Order> list = new OrderDao().searchOrder(conn, keyword, no);
		
		close(conn);
		return list;
	}
	
	public List<Order> sortList(int sort, int no, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Order> list = new OrderDao().sortList(conn, sort, no, cPage, numPerPage);
		close(conn);
		return list;
	}
	//구매된 책, 장바구니에서 제거
	public int deleteWishlist(int memberNum, List<Book> payList) {
		Connection conn =getConnection();
		int rs = new OrderDao().deleteWishlist(conn,memberNum,payList);
		if(rs>0) commit(conn);
		else rollback(conn);
		close(conn);
		return rs;
	}
	//구매된 책, 오더리스트에 추가
	public int insertOrderlist(int memberNum, List<Book> payList) {
		Connection conn = getConnection();
		int rs = new OrderDao().insertOrderlist(conn,memberNum,payList);
		if(rs>0) commit(conn);
		else rollback(conn);
		close(conn);
		return rs;
	}
}
