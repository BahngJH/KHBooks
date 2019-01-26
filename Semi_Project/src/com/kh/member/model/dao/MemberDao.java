package com.kh.member.model.dao;

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

public class MemberDao {
	
	Properties prop=new Properties();
	
	public MemberDao() {
		String file = MemberDao.class.getResource("./member_sql.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	//회원가입
	public int memberEnroll(Connection conn, Member m)
	{
		PreparedStatement pstmt =null;
		int rs=0;
		String sql = prop.getProperty("memberEnroll");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getBirth());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getGender());
			
			rs = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
	}
	//카카오 자동 로그인
	public int kakaoEnroll(Connection conn, Member m)
	{
		PreparedStatement pstmt =null;
		int rs = 0;
		String sql = prop.getProperty("kakaoEnroll");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getBirth());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getAddress());
			rs = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
		
	}
	
	//로그인
	public Member memberLogin(Connection conn, String id) 
	{
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		String sql = prop.getProperty("login");
		Member m =null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				m =new Member();
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
				m.setRecentLogin(rs.getDate("recentDate"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	//내 정보 변경, 패스워드 포함
	public int updateInfoPw(Connection conn, Member m)
	{
		PreparedStatement pstmt = null;
		int rs =0;
		String sql=prop.getProperty("updateInfoPw");
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getAddress());
			pstmt.setString(3, m.getBirth());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getMemberId());
			
			rs = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
	}
	//내 정보 변경, 패스워드 제외
	public int updateInfo(Connection conn, Member m)
	{
		PreparedStatement pstmt = null;
		int rs =0;
		String sql=prop.getProperty("updateInfo");
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, m.getAddress());
			pstmt.setString(2, m.getBirth());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getMemberId());
			
			rs = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
	}
	
	//아이디 중복 체크
	public String overlapCheck(Connection conn, String id)
	{
		PreparedStatement pstmt =null;
		String sql=prop.getProperty("overlapCheck");
		ResultSet rs =null;
		String checkedId="";
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				checkedId=rs.getString("memberid");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return checkedId;
	}
	
	
	// 회원 탈퇴 DAO
	public int deleteMember(Connection conn, int no) 
	{
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("dao끝");
		return result;
	}
	//비밀번호 찾기 할때의 패스워드 변경 로직
	public int onlyPwUpdate(Connection conn, Member m) 
	{
		PreparedStatement pstmt = null;
		int rs=0;
		String sql = prop.getProperty("onlyPwUpdate");
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberId());
			
			rs = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
	}
	//아이디 찾기 로직
	public String searchId(Connection conn, String name, String email)
	{
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String id ="";
		String sql = prop.getProperty("searchId");
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString("memberid");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return id;
	}
	//찜목록 불러오는 로직
	/*
	 * public List<Book> markList(Connection conn, int memberNum) {
	 * PreparedStatement pstmt = null; ResultSet rs =null; String sql =
	 * prop.getProperty("markList"); List<Book> list =new ArrayList();
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setInt(1, memberNum); rs =
	 * pstmt.executeQuery();
	 * 
	 * while(rs.next()) { Book b = new Book(); Author t = new Author();
	 * t.setauthorNum(rs.getInt("authornum"));
	 * t.setAuthorName(rs.getString("authorname"));
	 * t.setAuthorInfo(rs.getString("authorinfo"));
	 * 
	 * b.setAuthor(t); b.setBookName(rs.getString("bookname"));
	 * b.setPrice(rs.getInt("price")); b.setPublisher(rs.getString("publisher"));
	 * b.setAuthorNum(rs.getInt("authornum")); b.setGenre(rs.getString("genre"));
	 * b.setBookId(rs.getInt("bookid")); b.setIsbn(rs.getString("isbn"));
	 * b.setBookImage(rs.getString("bookImage"));
	 * b.setBookInfo(rs.getString("bookinfo")); b.setEditor(rs.getString("editor"));
	 * b.setTranslator(rs.getString("translator"));
	 * b.setPageNum(rs.getInt("pagenum")); b.setStock(rs.getInt("stock"));
	 * b.setSales(rs.getInt("sales"));
	 * 
	 * list.add(b); }
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally { close(rs); close(pstmt); } return list; }
	 */
	//찜 목록 다중 삭제
	public int markMutiDelete(Connection conn, List<Integer> booksId, int memberNum)
	{
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = prop.getProperty("markMutiDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<booksId.size();i++) {
				pstmt.setInt(1, booksId.get(i));
				pstmt.setInt(2, memberNum);
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
	//장바구니 목록 다중 삭제
		public int wishlistMutiDelete(Connection conn, List<Integer> booksId, int memberNum)
		{
			PreparedStatement pstmt = null;
			int rs = 0;
			String sql = prop.getProperty("wishlistMutiDelete");
			
			try {
				pstmt = conn.prepareStatement(sql);
				for(int i=0;i<booksId.size();i++) {
					pstmt.setInt(1, booksId.get(i));
					pstmt.setInt(2, memberNum);
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
	//찜 목록에서 장바구니로 이동
	public int moveWishlist(Connection conn, List<Integer> list, int memberNum)
	{
		PreparedStatement pstmt =null;
		int rs = 0;
		String sql = prop.getProperty("moveWishlist");
		try {
			pstmt= conn.prepareStatement(sql);
			for(int i=0;i<list.size();i++)
			{
				pstmt.setInt(1, memberNum);
				pstmt.setInt(2, list.get(i));
				rs+=pstmt.executeUpdate();
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
		
	}
	//페이징에 사용될 전체 찜목록 갯수 구함
	public int selectMarkCount(Connection conn, int memberNum)
	{
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		int result =0;
		String sql = prop.getProperty("selectMarkCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	//페이징 자료 가져오기
	public List<Book> markList(Connection conn, int cPage, int numPerPage, int memberNum)
	{
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql =prop.getProperty("markList");
		List<Book> bookList = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
            pstmt.setInt(3, cPage*numPerPage);
            rs = pstmt.executeQuery();
            
            while(rs.next()) 
            {
            	Book b = new Book();
            	Author t = new Author();
				t.setauthorNum(rs.getInt("authornum"));
				t.setAuthorName(rs.getString("authorname"));
				t.setAuthorInfo(rs.getString("authorinfo"));
				
				b.setAuthor(t);
            	b.setBookName(rs.getString("bookname"));
				b.setPrice(rs.getInt("price"));
				b.setPublisher(rs.getString("publisher"));
				b.setAuthorNum(rs.getInt("authornum"));
				b.setGenre(rs.getString("genre"));
				b.setBookId(rs.getInt("bookid"));
				b.setIsbn(rs.getString("isbn"));
				b.setBookImage(rs.getString("bookImage"));
				b.setBookInfo(rs.getString("bookinfo"));
				b.setEditor(rs.getString("editor"));
				b.setTranslator(rs.getString("translator"));
				b.setPageNum(rs.getInt("pagenum"));
				b.setStock(rs.getInt("stock"));
				b.setSales(rs.getInt("sales"));
				
            	bookList.add(b);
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return bookList;
	}
	//장바구니 정보 불러오는 메소드
	public List<Book> getWishlist(Connection conn, int memberNum)
	{
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("getWishlist");
		ResultSet rs = null;
		List bookList = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Book b = new Book();
            	Author t = new Author();
				t.setauthorNum(rs.getInt("authornum"));
				t.setAuthorName(rs.getString("authorname"));
				t.setAuthorInfo(rs.getString("authorinfo"));
				
				b.setAuthor(t);
            	b.setBookName(rs.getString("bookname"));
				b.setPrice(rs.getInt("price"));
				b.setPublisher(rs.getString("publisher"));
				b.setAuthorNum(rs.getInt("authornum"));
				b.setGenre(rs.getString("genre"));
				b.setBookId(rs.getInt("bookid"));
				b.setIsbn(rs.getString("isbn"));
				b.setBookImage(rs.getString("bookImage"));
				b.setBookInfo(rs.getString("bookinfo"));
				b.setEditor(rs.getString("editor"));
				b.setTranslator(rs.getString("translator"));
				b.setPageNum(rs.getInt("pagenum"));
				b.setStock(rs.getInt("stock"));
				b.setSales(rs.getInt("sales"));
				b.setBookCount(rs.getInt("bookcount"));
				
            	bookList.add(b);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return bookList;
	}
	//장바구니 수량 변경 메소드
	public int updateBookcount(Connection conn, Book b,int memberNum)
	{
		PreparedStatement pstmt =null;
		String sql =prop.getProperty("updateBookcount");
		int rs =0;
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBookCount());
			pstmt.setInt(2, memberNum);
			pstmt.setInt(3, b.getBookId());
			
			rs = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rs;
		
		
	}

}
