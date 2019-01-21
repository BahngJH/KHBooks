package com.kh.order.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.order.model.vo.Order;

public class OrderDao {

Properties prop=new Properties();
	
	public OrderDao() {
		String file = OrderDao.class.getResource("./order_sql.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public List<Order> selectList(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList();
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setBookCount(rs.getInt("bookCount"));
				o.setOrderDate(rs.getDate("orderDate"));
				o.setOrderNum(rs.getInt("orderNum"));
				o.setStatus(rs.getString("status"));
				Book b = new Book();
				b.setBookId(rs.getInt("bookId")); 				
				b.setBookName(rs.getString("bookName"));
				b.setPrice(rs.getInt("price"));
				b.setGenre(rs.getString("genre"));
				b.setBookImage(rs.getString("bookImage"));
				Author a = new Author();
				a.setAuthorName(rs.getString("authorName"));
				b.setAuthor(a);
				o.setBook(b);
				list.add(o);				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	
	public List<Order> searchOrder(Connection conn, String keyword, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList();
		String sql = prop.getProperty("searchOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setInt(3, no);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Order o = new Order();
				o.setOrderDate(rs.getDate("orderDate"));
				o.setBookCount(rs.getInt("bookCount"));
				o.setStatus(rs.getString("status"));
				Book b = new Book();
				b.setBookId(rs.getInt("bookId")); 				
				b.setBookName(rs.getString("bookName"));
				b.setPrice(rs.getInt("price"));
				b.setGenre(rs.getString("genre"));
				b.setBookImage(rs.getString("bookImage"));
				Author a = new Author();
				a.setAuthorName(rs.getString("authorName"));
				b.setAuthor(a);
				o.setBook(b);
				list.add(o);				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Order> sortList(Connection conn, int sort, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList();
		String sql = "";
		
		
		switch(sort) {
		case 1: sql = prop.getProperty("sortList1"); break;
		case 2: sql = prop.getProperty("sortList2");; break;
		case 3: sql = prop.getProperty("sortList3");; break;
		default: break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setBookCount(rs.getInt("bookCount"));
				o.setOrderDate(rs.getDate("orderDate"));
				o.setOrderNum(rs.getInt("orderNum"));
				o.setStatus(rs.getString("status"));
				Book b = new Book();
				b.setBookId(rs.getInt("bookId")); 				
				b.setBookName(rs.getString("bookName"));
				b.setPrice(rs.getInt("price"));
				b.setGenre(rs.getString("genre"));
				b.setBookImage(rs.getString("bookImage"));
				Author a = new Author();
				a.setAuthorName(rs.getString("authorName"));
				b.setAuthor(a);
				o.setBook(b);
				list.add(o);				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
