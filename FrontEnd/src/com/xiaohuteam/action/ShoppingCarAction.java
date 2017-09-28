package com.xiaohuteam.action;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xiaohuteam.dao.AccountDao;
import com.xiaohuteam.dao.ShoppingCarDao;
import com.xiaohuteam.dao.impl.AccountDaoImpl;
import com.xiaohuteam.dao.impl.ShoppingCarDaoImpl;
import com.xiaohuteam.pojo.Account;
import com.xiaohuteam.pojo.Goods;
import com.xiaohuteam.pojo.ShoppingCar;

public class ShoppingCarAction extends ActionSupport implements ModelDriven<ShoppingCar>{

	private int oldnum;
	private int newnum;
	DecimalFormat df = new DecimalFormat("#.00");
	ShoppingCarDao shoppingCarDao=new ShoppingCarDaoImpl();
	AccountDao accountDao=new AccountDaoImpl();
	Account account = (Account) ServletActionContext.getRequest().getSession().getAttribute("account");
	private Integer goodsId=(Integer) ServletActionContext.getRequest().getSession().getAttribute("goodsId");
	private Integer goodsNum=(Integer) ServletActionContext.getRequest().getSession().getAttribute("goodsNum");
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	ShoppingCar shoppingCar=new ShoppingCar();
	private double sum;
	
	public int getOldnum() {
		return oldnum;
	}

	public void setOldnum(int oldnum) {
		this.oldnum = oldnum;
	}

	public int getNewnum() {
		return newnum;
	}

	public void setNewnum(int newnum) {
		this.newnum = newnum;
	}

	@Override
	public ShoppingCar getModel() {
		return shoppingCar;
	}
	
	//封装该账号下的购物车的所有商品属性
	public String showGoodsOnCar() {
		//System.out.println(account.getLogInName());
		List<ShoppingCar> shoppingCarList=shoppingCarDao.findAllGoodsOnCar(account.getLogInName());
		for (ShoppingCar shoppingCar : shoppingCarList) {
			sum+=shoppingCar.getAmount();
		}
		HttpServletRequest request=ServletActionContext.getRequest();
		int length=shoppingCarList.size();
		request.setAttribute("shoppingCarList", shoppingCarList);
		request.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("length", length);
		return "showGoodsOnCar";
	}
	
	//删除购物车的商品
	public String deleteGoods() {
		//System.out.println(shoppingCar.getCarGoodsId());
		shoppingCarDao.deleteGoods(shoppingCar.getCarGoodsId());
		List<ShoppingCar> shoppingCarList=shoppingCarDao.findAllGoodsOnCar(account.getLogInName());
		for (ShoppingCar shoppingCar : shoppingCarList) {
			sum+=shoppingCar.getAmount();
		}
		HttpServletRequest request=ServletActionContext.getRequest();
		int length=shoppingCarList.size();
		request.setAttribute("shoppingCarList", shoppingCarList);
		request.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("length", length);
		return "showGoodsOnCar";
	}

	//删除购物车的所有商品
	public String deleteAllGoods() {
		shoppingCarDao.deleteAllGoods(account.getLogInName());
		List<ShoppingCar> shoppingCarList=shoppingCarDao.findAllGoodsOnCar(account.getLogInName());
		for (ShoppingCar shoppingCar : shoppingCarList) {
			sum+=shoppingCar.getAmount();
		}
		HttpServletRequest request=ServletActionContext.getRequest();
		int length=shoppingCarList.size();
		request.setAttribute("shoppingCarList", shoppingCarList);
		request.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("length", length);
		return "showGoodsOnCar";
	}
	
	//动态添加商品数量和减少商品数量
	public String addOrDeleteGoods() {
		//System.out.println("oldnum:"+oldnum+"   "+"newnum:"+newnum);
		//System.out.println(shoppingCar.getCarGoodsId());
		shoppingCarDao.updateGoodsNum(shoppingCar.getCarGoodsId(), newnum);
		List<ShoppingCar> shoppingCarList=shoppingCarDao.findAllGoodsOnCar(account.getLogInName());
		for (ShoppingCar shoppingCar : shoppingCarList) {
			sum+=shoppingCar.getAmount();
		}
		HttpServletRequest request=ServletActionContext.getRequest();
		int length=shoppingCarList.size();
		request.setAttribute("shoppingCarList", shoppingCarList);
		request.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("length", length);
		return "showGoodsOnCar";
	}
	
	//添加购物车商品
	public String addGoodsOnCar() {
		int carId=accountDao.findCarId(account.getLogInName());
		System.out.println(goodsId+" "+ goodsNum+"  "+carId);
		shoppingCarDao.addGoodsToCar(goodsId, goodsNum, carId);
		List<ShoppingCar> shoppingCarList=shoppingCarDao.findAllGoodsOnCar(account.getLogInName());
		for (ShoppingCar shoppingCar : shoppingCarList) {
			sum+=shoppingCar.getAmount();
		}
		HttpServletRequest request=ServletActionContext.getRequest();
		int length=shoppingCarList.size();
		request.setAttribute("shoppingCarList", shoppingCarList);
		request.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("length", length);
		return "showGoodsOnCar";
	}
	
	public String setMsgToLogIn() {
		List<ShoppingCar> shoppingCarList=shoppingCarDao.findAllGoodsOnCar(account.getLogInName());
		for (ShoppingCar shoppingCar : shoppingCarList) {
			sum+=shoppingCar.getAmount();
		}
		HttpServletRequest request=ServletActionContext.getRequest();
		int length=shoppingCarList.size();
		request.setAttribute("shoppingCarList", shoppingCarList);
		request.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("sum", Double.valueOf(df.format(sum)));
		session.setAttribute("length", length);
		return "user";
	}

}
