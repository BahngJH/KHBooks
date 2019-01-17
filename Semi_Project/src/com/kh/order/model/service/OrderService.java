package com.kh.order.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Order;

public class OrderService {

	public List<Order> selectList(int no) {
		Connection conn = getConnection();
		
		List<Order> list = new OrderDao().selectList(conn, no);
		
		return list;
	}
}
