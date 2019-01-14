package com.kh.member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	public Member memberLogin(String id, String pw) 
	{
		Connection conn = getConnection();
		Member m = new MemberDao().memberLogin(conn,id,pw);
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
	
}
