package common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	public static Connection getConnection() {
		Connection conn=null;
		Properties prop = new Properties();
		String filename = JDBCTemplate.class.getResource("./driver.properties").getPath();
		
		try {
			prop.load(new FileReader(filename));
			Class.forName(prop.getProperty("driver"));
			conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("pw"));
			conn.setAutoCommit(false);
		}catch(IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			if(!conn.isClosed() && conn!=null) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(!stmt.isClosed() && stmt!=null) {
				stmt.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(!rs.isClosed() && rs!=null) {
				rs.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(!conn.isClosed() && conn!=null) {
				conn.commit();
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(!conn.isClosed() && conn!=null) {
				conn.rollback();
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
