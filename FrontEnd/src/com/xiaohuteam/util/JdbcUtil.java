package com.xiaohuteam.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JdbcUtil {
	private static String userName;
	private static String pass;
	private static String url;
	private static String driver;
	
	static{
		Properties pro=new Properties();
		try {
			pro.load(new FileInputStream("Z:\\eeworkspace\\Desktop\\FrontEnd\\config\\jdbc.properties"));
			userName=pro.getProperty("user");
			pass=pro.getProperty("pass");
			url=pro.getProperty("url");
			driver=pro.getProperty("driver");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnecting(){
		Connection conn=null;
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, userName, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void closeConn(Connection conn,Statement st,ResultSet res) {
		if(res !=null) {
			try {
				res.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(st !=null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn !=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
