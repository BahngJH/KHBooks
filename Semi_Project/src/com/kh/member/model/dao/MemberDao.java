package com.kh.member.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import static common.JDBCTemplate.*;
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
	
	public Member memberLogin(Connection conn, String id, String pw) 
	{
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		String sql = prop.getProperty("login");
		Member m =null;
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			System.out.println(id+" "+pw+" "+sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				m =new Member();
				m.setMemberNum(rs.getInt("membernum"));
				m.setMemberId(rs.getString("memberid"));
				m.setMemberPw(rs.getString("memberpw"));
				m.setMemberName(rs.getString("membername"));
				m.setAddress(rs.getString("address"));
				m.setBirth(rs.getDate("birth"));
				m.setPhone(rs.getString("phone"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				m.setGender(rs.getString("gender"));
				m.setIsAdmin(rs.getInt("isadmin"));
				m.setMileage(rs.getInt("mileage"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

}
