package com.xiaohuteam.dao;

import com.xiaohuteam.pojo.User;

public interface UserDao {
	
	//将注册的账户存入个人信息表中
	boolean addAccountToUser(String logInName);
	
	//通过登录名获取该用户的所有信息
	User findUserByLogInName(String logInName);

	//通过登录名修改用户的所有信息
	boolean updateMsgByLogInName(String logInName, String realName, String postCode, String phoneNum, String idCard, String address, String newLogInName);

	//通过登录名修改用户的密码
	boolean UpdatePassword(String logInName,String newPassword);
}
