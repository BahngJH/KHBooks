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
	
	public int selectOrderCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectOrderCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch(SQLException e)
		{
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Order> selectList(Connection conn, int no, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList();
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
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
	//적립하기
	public int insertMilage(Connection conn, int memberNum, int milage)
	{
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertMilage");
		int rs =0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, milage);
			pstmt.setInt(2, memberNum);
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
		
	}

	//구매된 장바구니 데이터 지우기
	public int deleteWishlist(Connection conn, int memberNum, List<Book> payList) {
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("deleteWishlist");
		int rs = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<payList.size();i++)
			{
				pstmt.setInt(1, memberNum);
				pstmt.setInt(2, payList.get(i).getBookId());
				rs += pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
	}
	//구매된 책 orderlist에 추가
	public int insertOrderlist(Connection conn, int memberNum, List<Book> payList) {
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertOrderlist");
		int rs = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<payList.size();i++) {
				pstmt.setInt(1, memberNum);
				pstmt.setInt(2, payList.get(i).getBookId());
				pstmt.setInt(3, payList.get(i).getBookCount());
				rs += pstmt.executeUpdate();
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
		
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
	
	public List<Order> sortList(Connection conn, int sort, int no, int cPage, int numPerPage) {
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
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
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
