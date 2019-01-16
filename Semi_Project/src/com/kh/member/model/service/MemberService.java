package com.kh.member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.book.model.vo.Book;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	//로그인 메소드
	public Member memberLogin(String id) 
	{
		Connection conn = getConnection();
		Member m = new MemberDao().memberLogin(conn,id);
		close(conn);
		
		return m;
	}
	//회원가입 메소드
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
	//내 정보 변경 메소드, 패스워드 포함
	public int updateInfoPw(Member m)
	{
		Connection conn = getConnection();
		int rs = new MemberDao().updateInfoPw(conn, m);
		if(rs>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return rs;	
	}
	//내 정보 변경 메소드, 패스워드빼고 업데이트
	public int updateInfo(Member m)
	{
		Connection conn = getConnection();
		int rs = new MemberDao().updateInfo(conn, m);
		if(rs>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return rs;	
	}
	//중복체크 메소드
	public String overlapCheck(String id)
	{
		Connection conn=getConnection();
		String checkedId = new MemberDao().overlapCheck(conn,id);
		close(conn);
		return checkedId;
	}
	
	// 회원 탈퇴 메소드
	public int deleteMember(int no) 
	{
		Connection conn = getConnection();
		int result =  new MemberDao().deleteMember(conn, no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		System.out.println("서비스");
		return result;
	}
	//비밀번호 찾을 때 사용되는 패스워드 업데이트
	public int onlyPwUpdate(Member m)
	{
		Connection conn = getConnection();
		int rs = new MemberDao().onlyPwUpdate(conn,m);
		if(rs>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return rs;
	}
	//아이디찾기 메소드
	public String searchId(String name, String email) {
		Connection conn = getConnection();
		String id = new MemberDao().searchId(conn,name,email);
		
		close(conn);
		return id;
	}
	//찜목록 불러오기
	public List<Book> markList(int memberNum)
	{
		Connection conn = getConnection();
		List<Book> list = new MemberDao().markList(conn,memberNum);
		close(conn);
		
		return list;
	}
	
}
