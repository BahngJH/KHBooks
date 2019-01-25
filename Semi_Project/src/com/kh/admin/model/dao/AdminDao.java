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

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;
import com.kh.notice.model.vo.Notice;

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
	
	
	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public int deleteNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("deleteNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public List<Book> searchBook(Connection conn,String keyword){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Book> list=new ArrayList();
		String sql=prop.getProperty("searchbook");
		Book b=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
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
	

	 public int updatebook(Connection conn,Book b) {
	      PreparedStatement pstmt=null;
	      int result=0;
	      String sql=prop.getProperty("updatebook");
	      
	      try {
	         
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, b.getBookName());
	         pstmt.setInt(2, b.getPrice());
	         pstmt.setString(3, b.getPublisher());
	         pstmt.setString(4, b.getGenre());
	         pstmt.setString(5, b.getIsbn());
	         pstmt.setInt(6, b.getStock());
	         pstmt.setString(7, b.getBookContent());
	         pstmt.setString(8, b.getToc());
	         pstmt.setString(9, b.getBookInfo());
	         pstmt.setInt(10,b.getBookId());
	         result=pstmt.executeUpdate();
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return result;
	   }
	public int deleteBook(Connection conn,String[] id) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deletebook");
	
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			for(int i=0; i<id.length; i++) {
				
				pstmt.setInt(1, Integer.parseInt(id[i]));
				
				result+=pstmt.executeUpdate();
			}
			System.out.println(result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	public int deleteMember(Connection conn, String[] nums) 
	{
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i = 0; i < nums.length; i++) {
				pstmt.setInt(1, Integer.parseInt(nums[i]));
				result += pstmt.executeUpdate();
			}			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
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
				Author a = new Author();
				a.setAuthorInfo(rs.getString("authorinfo"));
				a.setAuthorName(rs.getString("authorname"));
				b.setAuthor(a);
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
	
	public List<Member> selectMember(Connection conn, String keyword){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchMember");
		List<Member> list=new ArrayList();
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
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

	public int updateAuthor(Connection conn, Author a) {
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = prop.getProperty("updateAuthor");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getAuthorName());
			pstmt.setString(2, a.getAuthorInfo());
			pstmt.setInt(3, a.getauthorNum());
			rs = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rs;
	}


}
