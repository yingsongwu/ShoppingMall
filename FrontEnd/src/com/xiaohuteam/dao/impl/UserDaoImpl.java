package com.xiaohuteam.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xiaohuteam.dao.UserDao;
import com.xiaohuteam.pojo.User;
import com.xiaohuteam.util.JdbcUtil;

public class UserDaoImpl implements UserDao {

	@Override
	public boolean addAccountToUser(String logInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="INSERT INTO USER (logInName) VALUES(?)";
		PreparedStatement ps=null;
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, logInName);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result>0?true:false;
	}

	@Override
	public User findUserByLogInName(String logInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM USER WHERE logInName=?";
		PreparedStatement ps=null;
		User user=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, logInName);
			rs=ps.executeQuery();
			while(rs.next()) {
				user=new User();
				user.setUserId(rs.getInt("userId"));
				user.setLogInName(logInName);
				user.setRealName(rs.getString("realName"));
				user.setReceiver(rs.getString("receiver"));
				user.setPostCode(rs.getString("postCode"));
				user.setPhoneNum(rs.getString("phoneNum"));
				user.setIdCard(rs.getString("idCard"));
				user.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean updateMsgByLogInName(String logInName, String realName, String postCode, String phoneNum, String idCard, String address, String newLogInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="UPDATE USER SET logInName=?,realName=?,postCode=?,phoneNum=?,idCard=?,address=? WHERE logInName=?";
		PreparedStatement ps=null;
		int result=0;
		Connection conn1=JdbcUtil.getConnecting();
		String sql1="UPDATE account SET logInName=? WHERE logInName=?";
		PreparedStatement ps1=null;
		int result1=0;
		Connection conn2=JdbcUtil.getConnecting();
		String sql2="UPDATE car SET logInName=? WHERE logInName=?";
		PreparedStatement ps2=null;
		int result2=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, newLogInName);
			ps.setString(2, realName);
			ps.setString(3, postCode);
			ps.setString(4, phoneNum);
			ps.setString(5, idCard);
			ps.setString(6, address);
			ps.setString(7, logInName);
			conn.setAutoCommit(false);
			result=ps.executeUpdate();
			if(result>0) {
				try {
					ps1=conn1.prepareStatement(sql1);
					ps1.setString(1, newLogInName);
					ps1.setString(2, logInName);
					conn1.setAutoCommit(false);
					result1=ps1.executeUpdate();
					if(result1>0) {
						ps2=conn2.prepareStatement(sql2);
						ps2.setString(1, newLogInName);
						ps2.setString(2, logInName);
						result2=ps2.executeUpdate();
						if(result2>0) {
							conn1.commit();
						}else {
							conn1.rollback();
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				conn.commit();
			}else {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result>0?true:false;
	}

	@Override
	public boolean UpdatePassword(String logInName,String newPassword) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="UPDATE account SET pass=? WHERE logInName=?";
		PreparedStatement ps=null;
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setString(2, logInName);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result>0?true:false;
	}

}
