package com.kh.admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.absence.model.vo.Absence;
import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;

public class AdminDao {
	
	public Properties prop = new Properties();

	public  AdminDao()  {
		try {
			String file = AdminDao.class.getResource("./admin-query.properties").getPath();
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public List<Book> selectBook(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectbooklist");
		List<Book> list=new ArrayList();
		
		Book b=null;
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				b=new Book();
				b.setBookName(rs.getString("bookname"));
				b.setPrice(rs.getInt("price"));
				b.setPublisher(rs.getString("publisher"));
				b.setAuthorNum(rs.getInt("authornum"));
				b.setGenre(rs.getString("genre"));
				b.setBookId(rs.getInt("bookid"));
				b.setIsbn(rs.getString("isbn"));
				b.setBookImage(rs.getString("bookImage"));
				b.setBookDate(rs.getDate("bookdate"));
				b.setBookInfo(rs.getString("bookinfo"));
				b.setEditor(rs.getString("editor"));
				b.setTranslator(rs.getString("translator"));
				b.setPageNum(rs.getInt("pagenum"));
				b.setSales(rs.getInt("sales"));
				b.setStock(rs.getInt("stock"));
				b.setBookContent(rs.getString("bookcontent"));
				b.setToc(rs.getString("toc"));
				list.add(b);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	
	
	public List<Member> selectMember(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectList");
		List<Member> list=new ArrayList();
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				m=new Member();
				
				m.setMemberNum(rs.getInt("membernum"));
				m.setMemberId(rs.getString("memberid"));
				m.setMemberPw(rs.getString("memberpw"));
				m.setMemberName(rs.getString("membername"));
				m.setAddress(rs.getString("address"));
				m.setBirth(rs.getString("birth"));
				m.setPhone(rs.getString("phone"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setGender(rs.getString("gender"));
				m.setIsAdmin(rs.getInt("isadmin"));
				m.setMileage(rs.getInt("mileage"));
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		} 
		return list;
		
	}
	
	public int selectCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("cnt");
				System.out.println(result);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
		
	}
	public int selectBookCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectBookCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("cnt");
				System.out.println(result);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
		
	}
	


}
