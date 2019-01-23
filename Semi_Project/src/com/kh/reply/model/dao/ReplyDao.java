package com.kh.reply.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.csCenter.model.vo.Qna;
import com.kh.reply.model.vo.Reply;

import static common.JDBCTemplate.*;

public class ReplyDao {
		
	Properties prop=new Properties();	
	public ReplyDao() {
		String file = ReplyDao.class.getResource("./reply_sql.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	//주문도서 댓글 등록	
	public int enrollReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int rs = 0;
		System.out.println(r);
		String sql = prop.getProperty("enrollReply");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getMemberNum());
			pstmt.setInt(2, r.getOrderBookNum());
			pstmt.setString(3, r.getOrderReContent());		
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rs;
	}
	
	//주문도서 댓글 목록	
	public List<Reply> selectReplyList(Connection conn, int no)
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Reply> list=new ArrayList();
		String sql=prop.getProperty("selectReplyList");
		try {
			pstmt=conn.prepareStatement(sql);			
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				Reply r=new Reply();
				r.setOrderReCoNum(rs.getInt("orderReCoNum"));
				r.setMemberNum(rs.getInt("memberNum"));
				r.setOrderBookNum(rs.getInt("orderBookNum"));
				r.setOrderReContent(rs.getString("orderReContent"));
				r.setStatus(rs.getString("status"));
				r.setOrderReDate(rs.getDate("orderReDate"));
				//r.setMemberId(rs.getString("memberId"));
	
				list.add(r);
			}			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	

}
