package com.kh.info.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;

public class InfoDao {

	private Properties prop=new Properties();
	public InfoDao(){
		try {
			String fileName=InfoDao.class.getResource("./info-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
	}
	
	public Book selectInfoBook(Connection conn,int bookId)
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Book b=null;
		String sql=prop.getProperty("selectInfo");
		try
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				b=new Book();
				b.setBookName(rs.getString("bookName"));
				b.setPrice(rs.getInt("price"));
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
				System.out.println(b);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(rs);
			close(pstmt);
		}
		return b;
	}
}
