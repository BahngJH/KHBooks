package com.kh.conpare.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.kh.info.model.dao.InfoDao;

public class ConpareDao {
	
	private Properties prop=new Properties();
	
	public ConpareDao(){
		try {
			String fileName=InfoDao.class.getResource("./conpare-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
	}
	
}
