package com.kh.order.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Order;

public class OrderService {

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
	
	public List<Order> sortList(int sort, int no) {
		Connection conn = getConnection();
		List<Order> list = new OrderDao().sortList(conn, sort, no);
		close(conn);
		return list;
	}
}
