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
				o.setBookId(rs.getInt("bookId")); 				
				Book b = new Book();
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
