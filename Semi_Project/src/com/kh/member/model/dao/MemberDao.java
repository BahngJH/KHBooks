package com.kh.member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
}
