package com.xiaohuteam.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.sun.org.apache.xpath.internal.VariableStack;
import com.xiaohuteam.dao.AccountDao;
import com.xiaohuteam.dao.ShoppingCarDao;
import com.xiaohuteam.dao.UserDao;
import com.xiaohuteam.dao.impl.AccountDaoImpl;
import com.xiaohuteam.dao.impl.ShoppingCarDaoImpl;
import com.xiaohuteam.dao.impl.UserDaoImpl;
import com.xiaohuteam.pojo.Account;
import com.xiaohuteam.pojo.Goods;
import com.xiaohuteam.util.Md5Util;

public class UserLoginAction extends ActionSupport implements ModelDriven<Account>{
	
	private static final long serialVersionUID = 1L;
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	AccountDao selectFromDb=new AccountDaoImpl();
	ShoppingCarDao shoppingCarDao=new ShoppingCarDaoImpl();
	UserDao userDao=new UserDaoImpl();
	Map<String, String> errorMeg=new HashMap<>();
	ValueStack stack=ActionContext.getContext().getValueStack();
	Account account=new Account();
	private int goodsId;
	private int goodsNum;

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public int getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}

	@Override
	public Account getModel() {
		return account;
	}
	
	public Map<String, String> getErrorMeg() {
		return errorMeg;
	}


	public void setErrorMeg(Map<String, String> errorMeg) {
		this.errorMeg = errorMeg;
	}


	public String Login() throws Exception {
		return "login";
	}
	
	public String about() {
		return "about";
	}
	
	public String reg() {
		return "reg";
	}
	
	public String index() {
		return "index";
	}
	//错误信息
	public String checklogInName() {
		boolean isExist=selectFromDb.IsExistAccount(account.getLogInName());
		if(isExist) {
			errorMeg.put("TheSameName", "用户已注册！");
			return "checklogInName";
		}else {
			errorMeg.put("NotFindAccount", "无此用户，请注册！");
			return "checklogInName";
		}
		
	}
	
	
	//检查是否注册成功
	public String check() {
		boolean IsSuccess=selectFromDb.AddAccount(account);
		if(IsSuccess) {
			shoppingCarDao.addAccountToCar(account.getLogInName());
			userDao.addAccountToUser(account.getLogInName());
			return "check";
		}else {
			return "reg";
		}
	}
	
	public String contact() {
		return "contact";
	}
	
	public String help() {
		return "help";
	}
	
	//获取所有信息
	public String vip() {
		if(session.getAttribute("account") != null) {
			return "getMsgOnCar";
		}
		Account newAccount=selectFromDb.FindAccount(account.getLogInName());
		if(newAccount==null) {
			return "login";
		}
		//System.out.println(account.getPassword());
		String password1=Md5Util.md5(account.getPassword());
		String password2=Md5Util.md5(password1);
		//System.out.println(password2);
		if(newAccount.getLogInName().equals(account.getLogInName()) && newAccount.getPassword().equals(password2)) {
			session.setAttribute("account", account);
			stack.set("account", account);
			return "getMsgOnCar";
		}else {
			return "login";
		}
	}

	//检查当前会话是否存在用户
	public String checkHasLogIn() {
		if(session.getAttribute("account")!=null) {
			boolean flag=true;
			session.setAttribute("check", flag);
			return "vip";
		}else {
			return "login";
		}
	}
	
	public String checkHasLogInOrder() {
		session.setAttribute("goodsId", goodsId);
		session.setAttribute("goodsNum", goodsNum);
		//System.out.println(session.getAttribute("goodsId"));
		//System.out.println(session.getAttribute("goodsNum"));
		if(session.getAttribute("account")!=null) {
			//判断是否按了收藏按钮
			if((int)session.getAttribute("goodsId")==0&&(int)session.getAttribute("goodsNum")==0) {
				return "userToShoppingCar";
			}else {
				//System.out.println(session.getAttribute("goodsId"));
				//System.out.println(session.getAttribute("goodsNum"));
				return "userToShoppingCar1";
			}
		}else {
			//System.out.println("aaa");
			return "loginOrder";
		}
	}
	
	public String order() {
		Account newAccount=selectFromDb.FindAccount(account.getLogInName());
		if(newAccount==null) {
			return "loginOrder";
		}
		String password1=Md5Util.md5(account.getPassword());
		String password2=Md5Util.md5(password1);
		if(newAccount.getLogInName().equals(account.getLogInName()) && newAccount.getPassword().equals(password2) ) {
			if(session.getAttribute("account")!=null) {
				//判断是否按了收藏按钮
				if((int)session.getAttribute("goodsId")==0&&(int)session.getAttribute("goodsNum")==0) {
					return "userToShoppingCar";
				}else {
					System.out.println(session.getAttribute("goodsId"));
					System.out.println(session.getAttribute("goodsNum"));
					return "userToShoppingCar1";
				}
			}
			session.setAttribute("account", account);
			//判断是否按了收藏按钮
			if((int)session.getAttribute("goodsId")==0&&(int)session.getAttribute("goodsNum")==0) {
				return "userToShoppingCar";
			}else {
				System.out.println(session.getAttribute("goodsId"));
				System.out.println(session.getAttribute("goodsNum"));
				return "userToShoppingCar1";
			}
		}else {
			return "loginOrder";
		}
	}

}
