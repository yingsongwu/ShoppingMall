package com.xiaohuteam.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xiaohuteam.dao.AccountDao;
import com.xiaohuteam.dao.impl.AccountDaoImpl;
import com.xiaohuteam.pojo.Account;

public class UserLoginAction extends ActionSupport implements ModelDriven<Account>{

	private static final long serialVersionUID = 1L;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	AccountDao accountDao = new AccountDaoImpl();
	Account account = new Account();
	Map<String, String> errorMsg=new HashMap<>();
	
	public Map<String, String> getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(Map<String, String> errorMsg) {
		this.errorMsg = errorMsg;
	}
	@Override
	public Account getModel() {
		return account;
	}
	public String checkLoginName(){
		boolean isExist = accountDao.IsExistAccount(account.getLogInName());
		if(isExist){
			errorMsg.put("TheSameName", "用户已注册");
		}else{
			//System.out.println("a");
			errorMsg.put("NotFindAccount", "无此用户，请注册");
			//System.out.println(errorMsg.get("NotFindAccount"));
		}
		return "checkLoginName";
	}
	public String login(){
		Account newAccount = accountDao.FindAccount(account.getLogInName());
		if(newAccount==null){
			return "login";
		}else{
			if(newAccount.getPassword().equals(account.getPassword())){
				session.setAttribute("account", account);
				return "index";
			}else{
				return "login";
			}
		}
	}
}
