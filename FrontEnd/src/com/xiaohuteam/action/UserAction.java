package com.xiaohuteam.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xiaohuteam.dao.AccountDao;
import com.xiaohuteam.dao.UserDao;
import com.xiaohuteam.dao.impl.AccountDaoImpl;
import com.xiaohuteam.dao.impl.UserDaoImpl;
import com.xiaohuteam.pojo.Account;
import com.xiaohuteam.pojo.User;
import com.xiaohuteam.util.Md5Util;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	UserDao userDao=new UserDaoImpl();
	AccountDao accountDao=new AccountDaoImpl();
	User user=new User();
	private String newLogInName;
	Map<String, String> errorPasswordMeg=new HashMap<>();
	private String oldPassword;
	private String newPassword;
	private String checkPassword;
	public Map<String, String> getErrorPasswordMeg() {
		return errorPasswordMeg;
	}

	public void setErrorMeg(Map<String, String> errorPasswordMeg) {
		this.errorPasswordMeg = errorPasswordMeg;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getCheckPassword() {
		return checkPassword;
	}

	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}

	public String getNewLogInName() {
		return newLogInName;
	}

	public void setNewLogInName(String newLogInName) {
		this.newLogInName = newLogInName;
	}

	@Override
	public User getModel() {
		return user;
	}
	
	public String vipPwd() {
		if(session.getAttribute("check")==null) {
			return "toUser";
		}else {
		return "vipPwd";
		}
	}
	
	//通过帐户名封装一个User对象
	public String getUserMsg() {
		Account account=(Account) session.getAttribute("account");
		User userMsg=userDao.findUserByLogInName(account.getLogInName());
		session.setAttribute("userMsg", userMsg);
		System.out.println(session.getAttribute("userMsg"));
		return "userL";
	}
	
	//通过帐户名修改该用户的帐户名与其他信息
	public String updateMsgByLogInName() {
		//System.out.println(user.getLogInName()+"  "+user.getRealName()+"  "+user.getPostCode()+"  "+user.getPhoneNum()+"  "+user.getIdCard()+"  "+user.getAddress()+"  "+newLogInName);
		userDao.updateMsgByLogInName(user.getLogInName(),user.getRealName(),user.getPostCode(),user.getPhoneNum(),user.getIdCard(),user.getAddress(),newLogInName);
		Account account =accountDao.FindAccount(newLogInName);
		User userMsg=userDao.findUserByLogInName(account.getLogInName());
		session.setAttribute("account", account);
		//System.out.println(account);
		session.setAttribute("userMsg", userMsg);
		return "userL";
	}
	
	//修改密码
	public String updatePassword() {
		Account account=(Account)session.getAttribute("account");
		String password=Md5Util.md5(Md5Util.md5(oldPassword));
		String updatePassword=Md5Util.md5(Md5Util.md5(newPassword));
		if(password.equals(accountDao.findPassword(account.getLogInName()))) {
			if(userDao.UpdatePassword(account.getLogInName(), updatePassword)) {
			errorPasswordMeg.put("sus", "密码修改成功!");
			//System.out.println(accountDao.findPassword(account.getLogInName()));
			}
		}else {
			errorPasswordMeg.put("ThePassWordIsNotMatch", "密码不匹配！");
		}
		return "updatePassword";
	}

}
