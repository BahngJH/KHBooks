package com.kh.conpare.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;

public class ConpareDao {
	
	private Properties prop=new Properties();
	
	public ConpareDao(){
		try {
			String fileName=ConpareDao.class.getResource("./conpare-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Book> selectConpareBook(Connection conn, String bookName)
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Book> bookList=new ArrayList();
		String sql=prop.getProperty("selectConpareBook");
		try
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+bookName+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Book b=new Book();
				Author a=new Author();
				b.setBookName(rs.getString("bookName"));
				b.setPrice(rs.getInt("price"));
				b.setToc(rs.getString("toc"));
				b.setPublisher(rs.getString("publisher"));
				b.setAuthorNum(rs.getInt("authorNum"));
				b.setGenre(rs.getString("genre"));
				b.setBookId(rs.getInt("bookId"));
				b.setIsbn(rs.getString("isbn"));
				b.setBookImage(rs.getString("bookImage"));
				b.setBookDate(rs.getDate("bookDate"));
				b.setBookInfo(rs.getString("bookInfo"));
				b.setBookContent(rs.getString("bookContent"));
				b.setEditor(rs.getString("editor"));
				b.setTranslator(rs.getString("translator"));
				b.setPageNum(rs.getInt("pageNum"));
				b.setStock(rs.getInt("stock"));
				b.setSales(rs.getInt("sales"));
				a.setauthorNum(rs.getInt("authornum"));
				a.setAuthorName(rs.getString("authorName"));
				a.setAuthorInfo(rs.getString("authorInfo"));
				b.setAuthor(a);
				
				bookList.add(b);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(rs);
			close(pstmt);
		}
		return bookList;
	}
}
