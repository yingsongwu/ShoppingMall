package com.xiaohuteam.dao;

import com.xiaohuteam.pojo.Account;

public interface AccountDao {
	
	//通过用户名查找
	boolean IsExistAccount(String LogInName);
	
	//将用户添加到数据库
	boolean AddAccount(Account account);
	
	//通过用户名返回一个account
	Account FindAccount(String logInName);
	
	//通过用户名返回该用户的购物车id
	int findCarId(String logInName);

	//通过用户名放回该用户的密码
	String findPassword(String logInName);
}
