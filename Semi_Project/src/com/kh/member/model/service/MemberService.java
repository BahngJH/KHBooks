package com.kh.member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	public Member memberLogin(String id) 
	{
		Connection conn = getConnection();
		Member m = new MemberDao().memberLogin(conn,id);
		close(conn);
		
		return m;
	}
	
	public int memberEnroll(Member m) 
	{
		Connection conn= getConnection();
		int rs = new MemberDao().memberEnroll(conn,m);
		if(rs>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return rs;
	}
	
	public int updateInfoPw(Member m)
	{
		Connection conn = getConnection();
		int rs = new MemberDao().updateInfoPw(conn, m);
		if(rs>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return rs;	
	}
	public int updateInfo(Member m)
	{
		Connection conn = getConnection();
		int rs = new MemberDao().updateInfo(conn, m);
		if(rs>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return rs;	
	}
	public String overlapCheck(String id)
	{
		Connection conn=getConnection();
		String checkedId = new MemberDao().overlapCheck(conn,id);
		close(conn);
		return checkedId;
	}
	
}
