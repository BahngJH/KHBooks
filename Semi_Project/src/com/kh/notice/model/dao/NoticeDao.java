package com.kh.notice.model.dao;

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

import javax.naming.spi.DirStateFactory.Result;

import com.kh.notice.model.vo.Notice;

public class NoticeDao {
	
	public Properties prop=new Properties();
	
	
	public NoticeDao() {
		try {
			String file=NoticeDao.class.getResource("./notice-query.properties").getPath();
			prop.load(new FileReader(file));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Notice selectOne(Connection conn,int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectOne");
		Notice n=null;
		try {
		
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				n=new Notice();
				n.setNoticeNo(rs.getInt("noticenum"));
				n.setNoticeTitle(rs.getString("noticetitle"));
				n.setNoticeContent(rs.getString("noticecontent"));
				n.setNoticeDate(rs.getDate("noticedate"));
				n.setStatus(rs.getString("status"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
			close(rs);
		}
		return n;
		
		
		
	}
	
	
	public int deleteNotice(Connection conn,int no){
		PreparedStatement pstmt =null;
		int result=0;
		
		String sql=prop.getProperty("deleteNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public Notice selectNo(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		Notice n =null;
		String sql=prop.getProperty("selectNo");
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				n=new Notice();
				n.setNoticeNo(rs.getInt("noticenum"));
				n.setNoticeTitle(rs.getString("noticetitle"));
				n.setNoticeContent(rs.getString("noticecontent"));
				n.setNoticeDate(rs.getDate("noticedate"));
				n.setStatus(rs.getString("status"));
				
			}
	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
			close(rs);
		}
		return n;
		
		
	}
	
	
	public List<Notice> selectAllNotice(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList();
		String sql = prop.getProperty("selectNotice");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeNo(rs.getInt("noticenum"));
				notice.setNoticeTitle(rs.getString("noticetitle"));
				notice.setNoticeContent(rs.getString("noticecontent"));
				notice.setNoticeDate(rs.getDate("noticedate"));
				notice.setStatus(rs.getString("status"));
				list.add(notice);
								
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return list;
	
		
	}

}
