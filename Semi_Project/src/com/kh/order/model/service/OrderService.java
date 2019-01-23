package com.kh.order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
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
	//판매숫자 만큼 stock 제거
	public int stockSelect(List<Book> payList)
	{
		Connection conn = getConnection();
		List<Book> stock = new ArrayList();
		List<Book> stockList = new OrderDao().stockSelect(conn, payList);
		for(int i =0;i<stockList.size();i++) {
			if(stockList.get(i).getBookId()==payList.get(i).getBookId())
			{
				Book newStock = new Book();
				
				newStock.setBookId(payList.get(i).getBookId());
				System.out.println("서비스단 newStock의 bookId : "+newStock.getBookId());
				
				newStock.setStock(stockList.get(i).getStock()-payList.get(i).getBookCount());
				System.out.println("서비스단 newStock의 stock : "+newStock.getStock());
				stock.add(newStock);
			}
		}
		int rs = new OrderDao().stockMinus(conn,stock);
		if(rs>0) commit(conn);
		else rollback(conn);
		close(conn);
		return rs;
		
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
	//마일리지 적립
	public int insertMilage(int memberNum, int milage)
	{
		Connection conn = getConnection();
		int rs = new OrderDao().insertMilage(conn, memberNum, milage);
		if(rs>0) commit(conn);
		else rollback(conn);
		close(conn);
		return rs;
	}
}
