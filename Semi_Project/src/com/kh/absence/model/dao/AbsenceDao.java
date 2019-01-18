package com.kh.absence.model.dao;

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
import com.kh.member.model.vo.Member;

public class AbsenceDao {
	
	static Properties prop=new Properties();
	
	public AbsenceDao() {
		try {
			String file=AbsenceDao.class.getResource("./absence-query.properties").getPath();
			prop.load(new FileReader(file));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Absence selectNo(Connection conn, int no) {
		
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectOne");
		Absence ab=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				ab=new Absence();
				ab.setMemberNum(rs.getInt("membernum"));
				ab.setBookName(rs.getString("bookname"));
				ab.setAppDate(rs.getDate("appdate"));
				ab.setAuthor(rs.getString("author"));
				ab.setBookDate(rs.getString("bookdate"));
				ab.setISBN(rs.getString("isbn"));
				ab.setPublisher(rs.getString("publisher"));
				ab.setAppCancel(rs.getBoolean("appnum"));
				ab.setStatus(rs.getString("status"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
			close(rs);
		}
		return ab;
		
	}
	
	
	public List<Absence> selectAll(Connection conn){
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectAll");
		Absence ab=null;
		List<Absence> list=new ArrayList();
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ab=new Absence();		
				ab.setBookName(rs.getString("bookname"));
				ab.setAppDate(rs.getDate("appdate"));
				ab.setStatus(rs.getString("status"));
				ab.setAppNum(rs.getInt("appnum"));
				Member m =new Member();
				m.setMemberId(rs.getString("memberId"));
				ab.setMember(m);
				list.add(ab);
				
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int insertAbsence(Connection conn,Absence ab) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertAbsence");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

}
