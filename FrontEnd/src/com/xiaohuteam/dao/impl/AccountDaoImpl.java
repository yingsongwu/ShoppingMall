package com.xiaohuteam.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xiaohuteam.dao.AccountDao;
import com.xiaohuteam.pojo.Account;
import com.xiaohuteam.util.JdbcUtil;
import com.xiaohuteam.util.Md5Util;

public class AccountDaoImpl implements AccountDao{

	@Override
	public boolean IsExistAccount(String LogInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM account WHERE logInName=? AND del=0";
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, LogInName);
			rs=ps.executeQuery();
			flag=rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return flag;
	}

	@Override
	public boolean AddAccount(Account account) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="INSERT INTO account(logInName,pass) VALUE(?,?)";
		PreparedStatement ps=null;
		String password1=Md5Util.md5(account.getPassword());
		String password2=Md5Util.md5(password1);
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, account.getLogInName());
			ps.setString(2, password2);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, null);
		}
		return result>0?true:false;
	}

	@Override
	public Account FindAccount(String logInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM account WHERE logInName=? AND del=0";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Account account=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, logInName);
			rs=ps.executeQuery();
			while(rs.next()) {
				account=new Account();
				account.setLogInName(logInName);
				account.setPassword(rs.getString("pass"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return account;
	}

	@Override
	public int findCarId(String logInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT carId FROM car WHERE logInName=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		int carId=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, logInName);
			rs=ps.executeQuery();
			if(rs.next()) {
				carId=rs.getInt("carId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return carId;
	}

	@Override
	public String findPassword(String logInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT pass FROM account WHERE logInName=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		String password=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, logInName);
			rs=ps.executeQuery();
			if(rs.next()) {
				password=new String();
				password=rs.getString("pass");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return password;
	}

}
