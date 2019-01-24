package com.kh.admin.model.service;


import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.absence.model.dao.AbsenceDao;
import com.kh.admin.model.dao.AdminDao;
import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;

public class AdminService {
	

	public List<Book> searchBook(String keyword){
		Connection conn=getConnection();
		List<Book> list=new AdminDao().searchBook(conn,keyword);
		close(conn);
		return list;
		
	}
	public int updatebook(Book b) {
		Connection conn=getConnection();
		
		int result=new AdminDao().updatebook(conn,b);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		return result;
		
	}

	// 멤버 삭제 서비스
	public int deleteMember(String[] nums) 
	{
		Connection conn = getConnection();
		
		int result = new AdminDao().deleteMember(conn, nums);
		if(result == nums.length) 
			commit(conn);
		else
			rollback(conn);
		
		return result;		
	}	
	

	
	public  int deleteBook(String[] id) {
		Connection conn=getConnection();
	
		int result=new AdminDao().deleteBook(conn,id);
		if(result ==id.length) {commit(conn);}
		else {rollback(conn);}
		return result;

	}
	
	public List<Member> selectMember(int cPage,int numPerPage){
		Connection conn =getConnection();
		List<Member> list=new AdminDao().selectMember(conn,cPage,numPerPage);
		close(conn);
		return list;
		
	}
	
	public List<Member> selectMember(String keyword){
		Connection conn =getConnection();
		List<Member> list=new AdminDao().selectMember(conn, keyword);
		close(conn);
		return list;
		
	}	
	
	public List<Book> selectBook(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Book> list=new AdminDao().selectBook(conn,cPage,numPerPage);
		close(conn);
		return list;
		
	}
	public int selectCount() {
		Connection conn =getConnection();
		int result=new AdminDao().selectCount(conn);
		close(conn);
		return result;
	}
	
	public int selectBookCount() {
		Connection conn =getConnection();
		int result=new AdminDao().selectBookCount(conn);
		close(conn);
		return result;
	}
	

}
