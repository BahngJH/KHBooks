package com.kh.notice.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;
import static common.JDBCTemplate.close;

public class NoticeService {
	
	public List<Notice> selectAllNotice(){
		
		Connection conn=getConnection();
		List<Notice> list=new NoticeDao().selectAllNotice(conn);
		close(conn);
		return list;
	}
	
	

}
