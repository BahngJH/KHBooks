package com.kh.csCenter.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import com.kh.csCenter.model.vo.Qna;
import static common.JDBCTemplate.*;

public class QnaDao {
	Properties prop=new Properties();
	
	public QnaDao(){
		String file=QnaDao.class.getResource("./qna_sql.properties").getPath();
		try {
			prop.load(new FileReader(file));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int qnaEnroll(Connection conn, Qna q) {
		PreparedStatement pstmt=null;
		int rs=0;
		String sql=prop.getProperty("qnaEnroll");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, q.getQnaWriter());
			
			rs=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return rs;
	}
	

}
