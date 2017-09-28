package com.xiaohuteam.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xiaohuteam.dao.AccountDao;
import com.xiaohuteam.pojo.Account;
import com.xiaohuteam.util.JdbcUtil;

public class AccountDaoImpl implements AccountDao{

	@Override
	public boolean IsExistAccount(String LogInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM account WHERE logInName=?";
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
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, account.getLogInName());
			ps.setString(2, account.getPassword());
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
		String sql="SELECT * FROM account WHERE logInName=?";
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

}
