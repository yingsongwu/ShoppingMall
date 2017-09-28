package com.xiaohuteam.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xiaohuteam.dao.GoodsDao;
import com.xiaohuteam.dao.TypeDao;
import com.xiaohuteam.dao.impl.GoodsDaoImpl;
import com.xiaohuteam.dao.impl.TypeDaoImpl;
import com.xiaohuteam.pojo.Type;

public class TypeAction extends ActionSupport implements ModelDriven<Type>{

	private static final long serialVersionUID = 1L;
	Type type=new Type();
	TypeDao typeDao=new TypeDaoImpl();
	GoodsDao goodsDao=new GoodsDaoImpl();
	GoodsShowAction goodsShowAction=new GoodsShowAction();
	Map<Type, List<String>> mapDefault=new HashMap<>();
	public Map<Type, List<String>> getMapDefault() {
		return mapDefault;
	}

	public void setMapDefault(Map<Type, List<String>> mapDefault) {
		this.mapDefault = mapDefault;
	}

	@Override
	public Type getModel() {
		return type;
	}
	
	public String product() {
		List<Type> typeList=typeDao.FindAllType();
		Map<Type, List<String>> map=new HashMap<>();
		for (Type type : typeList) {
			List<String> goodsNameList=goodsDao.findGoodsName(type.getTypeId());
			map.put(type, goodsNameList);
		}
		ServletActionContext.getRequest().getSession().setAttribute("show", map);
		//System.out.println(ServletActionContext.getRequest().getAttribute("goodList"));
		return "product";
	}
	
	public String typeToGoods() {
		List<Type> typeList=typeDao.FindAllType();
		Map<Type, List<String>> map=new HashMap<>();
		for (Type type : typeList) {
			List<String> goodsNameList=goodsDao.findGoodsName(type.getTypeId());
			map.put(type, goodsNameList);
			ServletActionContext.getRequest().getSession().setAttribute("show", map);
		}
		return "typeToGoods";
	}
	
	public String ready() {
		List<Type> typeList=typeDao.FindAllType();
		for (Type type : typeList) {
			List<String> goodsNameList=goodsDao.findGoodsName(type.getTypeId());
			mapDefault.put(type,goodsNameList);
		}
		//System.out.println(mapDefault);
		return "ready";
	}
	
	public String proinfo() {
		List<Type> typeList=typeDao.FindAllType();
		Map<Type, List<String>> map=new HashMap<>();
		for (Type type : typeList) {
			List<String> goodsNameList=goodsDao.findGoodsName(type.getTypeId());
			map.put(type, goodsNameList);
			ServletActionContext.getRequest().getSession().setAttribute("show", map);
		}
		//System.out.println(ServletActionContext.getRequest().getAttribute("goodList"));
		return "proinfo";
	}
	
	public String typeToShoppingCar() {
		List<Type> typeList=typeDao.FindAllType();
		Map<Type, List<String>> map=new HashMap<>();
		for (Type type : typeList) {
			List<String> goodsNameList=goodsDao.findGoodsName(type.getTypeId());
			map.put(type, goodsNameList);
			ServletActionContext.getRequest().getSession().setAttribute("show", map);
		}
		return "typeToShoppingCar";
	}
	
	public String typeToShoppingCar1(){
		List<Type> typeList=typeDao.FindAllType();
		Map<Type, List<String>> map=new HashMap<>();
		for (Type type : typeList) {
			List<String> goodsNameList=goodsDao.findGoodsName(type.getTypeId());
			map.put(type, goodsNameList);
			ServletActionContext.getRequest().getSession().setAttribute("show", map);
		}
		return "typeToShoppingCar1";
	}
	
	public String typeToAccount() {
		List<Type> typeList=typeDao.FindAllType();
		Map<Type, List<String>> map=new HashMap<>();
		for (Type type : typeList) {
			List<String> goodsNameList=goodsDao.findGoodsName(type.getTypeId());
			map.put(type, goodsNameList);
			ServletActionContext.getRequest().getSession().setAttribute("show", map);
		}
		return "typeToAccount";
	}

}
