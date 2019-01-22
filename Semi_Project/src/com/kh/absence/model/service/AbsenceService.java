package com.kh.absence.model.service;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.absence.model.dao.AbsenceDao;
import com.kh.absence.model.vo.Absence;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class AbsenceService {
	
	
	public List<Absence> selectAllAbsence() {
		Connection conn=getConnection();
		List<Absence> list=new AbsenceDao().selectAllAbsence(conn);
		close(conn);
		return list;
	}
	
	public int deleteAbsence(int no) {
		Connection conn=getConnection();
		int result=new AbsenceDao().deleteAbsence(conn,no);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public List<Absence> selectAll(){
		
		Connection conn=getConnection();
		List<Absence> list=new AbsenceDao().selectAll(conn);
		close(conn);
		return list;
		
	}
	public Absence selectNo(int no) {
		Connection conn=getConnection();
		Absence ab=new AbsenceDao().selectNo(conn,no);
		close(conn);
		return ab;
		
	}
	
	
	public int insertAbsence(Absence ab) {
		Connection conn=getConnection();
		int result=new AbsenceDao().insertAbsence(conn,ab);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public int selectCount() {
		Connection conn =getConnection();
		int result=new AbsenceDao().selectCount(conn);
		close(conn);
		return result;
	}
	
	public List<Absence> selectList(int cPage,int numPerPage) {
		Connection conn=getConnection();
		List<Absence> list=new AbsenceDao().selectList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

}
