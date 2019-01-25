package com.kh.search.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.search.model.vo.GenreCount;

import static common.JDBCTemplate.close;

public class SearchDao {

	private Properties prop;
	
	public SearchDao() {
		prop = new Properties();
		
		try {
			String filename = SearchDao.class.getResource("./search-query.properties").getPath();
			prop.load(new FileReader(filename));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//책 정보 미리보기
	public List<Book> selectBook(Connection conn, String key){
		List<Book> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBookPreview"));
			pstmt.setString(1, key + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book b = new Book();
				/* 작가 정보 */
				Author t = new Author();
				t.setAuthorName(rs.getString("authorname"));
				t.setAuthorInfo(rs.getString("authorinfo"));
				t.setauthorNum(rs.getInt("authornum"));
				/*책 정보*/
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
				b.setBookDate(rs.getDate("bookDate"));
				
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	//검색 정보 책 리스트
	public List<Book> selectBook(Connection conn, String key, int cPage, int numPerPage, String genre, String order) {
		List<Book> list=new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//리뷰 기준에만 사용함
		String query="";
		try {
			String orderby = "";
			switch(order) {
			case "default":
				orderby = "NULL";
				break;
			case "popularity":
				/*인기순*/
				orderby += "SALES DESC";
				break;
			case "recent":
				/*최근순*/
				orderby += "BOOKDATE DESC";
				break;
			case "grade":
				/*평점순*/
				orderby += "G DESC nulls last";
				break;
			case "review":
				/*리뷰 많은 순*/
				query="LEFT JOIN (SELECT BOOKID, COUNT(BOOKID) C FROM REVIEW GROUP BY BOOKID) USING(BOOKID)";
				orderby += "C DESC nulls last";
				break;
			case "price":
				/*가격 낮은 순*/
				orderby += "PRICE ASC";
				break;
			}
			String sql = prop.getProperty("searchBookS") + query + prop.getProperty("searchBookM") +orderby + prop.getProperty("searchBookE");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			pstmt.setString(2, "%"+key+"%");
			pstmt.setString(3, "%"+key+"%");
			pstmt.setString(4, "%"+(genre.equals("all")?"":genre)+"%");
			pstmt.setInt(5, (cPage-1) * numPerPage+1);
			pstmt.setInt(6, cPage * numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book b = new Book();
				/* 작가 정보 */
				Author t = new Author();
				t.setAuthorName(rs.getString("authorname"));
				t.setAuthorInfo(rs.getString("authorinfo"));
				t.setauthorNum(rs.getInt("authornum"));
				/*책 정보*/
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
				b.setGrade(rs.getInt("g"));
				
				list.add(b);
			}
		}catch(SQLException e){
			e.printStackTrace();		
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	//카테고리 책 리스트
	public List<Book> selectBook(Connection conn, int cPage, int numPerPage, String genre, String order) {
		List<Book> list=new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query="";
		try {
			String orderby = "";
			switch(order) {
			case "default":
				orderby = "NULL";
				break;
			case "popularity":
				/*인기순*/
				orderby += "SALES DESC";
				break;
			case "recent":
				/*최근순*/
				orderby += "BOOKDATE DESC";
				break;
			case "grade":
				/*평점순*/
				orderby += "G DESC nulls last";
				break;
			case "review":
				/*리뷰 많은 순*/
				query="LEFT JOIN (SELECT BOOKID, COUNT(BOOKID) C FROM REVIEW GROUP BY BOOKID) USING(BOOKID)";
				orderby += "C DESC nulls last";
				break;
			case "price":
				/*가격 낮은 순*/
				orderby += "PRICE ASC";
				break;
			}
			String sql = prop.getProperty("searchGenreBookS") + query + prop.getProperty("searchGenreBookM") +orderby + prop.getProperty("searchGenreBookE");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, genre);
			pstmt.setInt(2, (cPage-1) * numPerPage+1);
			pstmt.setInt(3, cPage * numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book b = new Book();
				/* 작가 정보 */
				Author t = new Author();
				t.setAuthorName(rs.getString("authorname"));
				t.setAuthorInfo(rs.getString("authorinfo"));
				t.setauthorNum(rs.getInt("authornum"));
				/*책 정보*/
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
				b.setGrade(rs.getInt("g"));
				
				list.add(b);
			}
		}catch(SQLException e){
			e.printStackTrace();		
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	
	//작가 정보 리스트 가져오기
	public List<Author> selectAuthor(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Author> list = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchAuthor"));
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			list = new ArrayList<Author>();
			
			while(rs.next()) {
				Author a = new Author();
				a.setAuthorInfo(rs.getString("authorinfo"));
				a.setAuthorName(rs.getString("authorname"));
				a.setauthorNum(rs.getInt("authornum"));
				list.add(a);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	//책 검색시 해당 카테고리 내의 책 ㄱ수
	public List<GenreCount> getGenreCount(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GenreCount> list = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getGenreCount"));
			pstmt.setString(1, "%"+key+"%");
			pstmt.setString(2, "%"+key+"%");
			pstmt.setString(3, "%"+key+"%");
			rs = pstmt.executeQuery();
			list = new ArrayList<GenreCount>();
			
			while(rs.next()) {
				GenreCount c = new GenreCount();
				c.setCnt(rs.getInt("cnt"));
				c.setGenre(rs.getString("genre"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	//검색 전체 책 수 (페이징)
	public int getBookCount(Connection conn, String key, String genre) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getBookCount"));
			pstmt.setString(1, "%"+key+"%");
			pstmt.setString(2, "%"+key+"%");
			pstmt.setString(3, "%"+key+"%");
			pstmt.setString(4, "%"+(genre.equals("all")?"":genre)+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("CNT");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

	//카테고리 전체 책 수 (페이징)
	public int getBookCount(Connection conn, String genre) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getGenreBookCount"));
			pstmt.setString(1, genre);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("CNT");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

}
