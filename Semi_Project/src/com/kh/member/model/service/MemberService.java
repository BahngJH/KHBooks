package com.kh.member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.book.model.vo.Book;
import com.kh.csCenter.model.vo.Qna;
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
	//찜목록 삭제하기
	public int markMutiDelete(List<Integer> booksId,int memberNum, int deleteCount)
	{
		Connection conn = getConnection();
		int rs = new MemberDao().markMutiDelete(conn,booksId, memberNum);
		if(rs==deleteCount && rs>0) {
			//모두 삭제
			commit(conn);
		}else if(rs>0 && rs<deleteCount) {
			//일부만 삭제됨
			rollback(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return rs;
	}
	//장바구니 삭제하기
		public int wishlistMutiDelete(List<Integer> booksId,int memberNum, int deleteCount)
		{
			Connection conn = getConnection();
			int rs = new MemberDao().wishlistMutiDelete(conn,booksId, memberNum);
			if(rs==deleteCount && rs>0) {
				//모두 삭제
				commit(conn);
			}else if(rs>0 && rs<deleteCount) {
				//일부만 삭제됨
				rollback(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return rs;
		}
	//페이징에 사용된 토탈 구해오는 메소드
	public int selectMarkCount(int memberNum)
	{
		Connection conn = getConnection();
		int rs = new MemberDao().selectMarkCount(conn,memberNum);
		close(conn);
		return rs;
	}
	//페이징에 사용된 현재 페이지와 numper로 값 가져오기
	public List<Book> markList(int cPage, int numPerPage,int memberNum)
	{
		Connection conn =getConnection();
		List<Book> bookList = new MemberDao().markList(conn, cPage,numPerPage,memberNum);
		close(conn);
		return bookList;
	}
	//찜 목록에서 장바구니로 이동하는 메소드
	public int moveWishlist(List<Integer> list, int memberNum) {
		Connection conn =getConnection();
		int rs = new MemberDao().moveWishlist(conn,list,memberNum);
		if(rs>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return rs;
	}
	//장바구니 목록 불러오는 메소드
	public List<Book> getWishlist(int memberNum)
	{
		Connection conn = getConnection();
		List<Book> booksList  = new MemberDao().getWishlist(conn, memberNum);
		close(conn);
		return booksList;
		
	}
	//장바구니 수량 변화하면 디비에도 적용시키는 메소드
	public int updateBookcount(Book b, int memberNum)
	{
		Connection conn =getConnection();
		int rs = new MemberDao().updateBookcount(conn,b,memberNum);
		if(rs>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return rs;
	}


}
