package com.kh.reply.model.dao;

import java.io.FileReader;
import java.util.Properties;

import static common.JDBCTemplate.*;

public class ReplyDao {
	
	
	Properties prop=new Properties();
	
	public ReplyDao() {
		String file = ReplyDao.class.getResource("./reply_sql.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
