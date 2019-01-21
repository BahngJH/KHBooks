package com.kh.order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

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
}
