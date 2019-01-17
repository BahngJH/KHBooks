package com.kh.absence.model.service;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.absence.model.dao.AbsenceDao;
import com.kh.absence.model.vo.Absence;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class AbsenceService {
	
	
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
	
	
	/*public int insertAbsence(Absence ab) {
		Connection conn=getConnection();
		int result=new AbsenceDao().insertAbsence(conn,ab);
	}
*/
}
