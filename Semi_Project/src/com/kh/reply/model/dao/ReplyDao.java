package com.kh.reply.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

}
