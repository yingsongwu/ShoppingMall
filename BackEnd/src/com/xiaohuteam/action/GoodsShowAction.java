package com.xiaohuteam.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.xiaohuteam.dao.GoodsDao;
import com.xiaohuteam.dao.ImageDao;
import com.xiaohuteam.dao.TypeDao;
import com.xiaohuteam.dao.impl.GoodsDaoImpl;
import com.xiaohuteam.dao.impl.ImageDaoImpl;
import com.xiaohuteam.dao.impl.TypeDaoImpl;
import com.xiaohuteam.pojo.Goods;
import com.xiaohuteam.pojo.Type;

public class GoodsShowAction extends ActionSupport implements ModelDriven<Goods>{
	private static final long serialVersionUID = 1L;
	GoodsDao goodsDao=new GoodsDaoImpl();
	ImageDao imageDao=new ImageDaoImpl();
	Map<String, String> typeMap=new HashMap<>();
	List<Goods> goodsList = null;
	int typeNum ;
	public int getTypeNum() {
		return typeNum;
	}

	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}

	public Map<String, String> getTypeMap() {
		return typeMap;
	}

	public void setTypeMap(Map<String, String> typeMap) {
		this.typeMap = typeMap;
	}

	Goods goods=new Goods();
	TypeDao typeDao = new TypeDaoImpl();
	ValueStack stack=ActionContext.getContext().getValueStack();
	public Goods getModel() {
		return goods;
	}
	
	public String product() {
		HttpServletRequest request=ServletActionContext.getRequest();
		//System.out.println(goods.getType());
		List<Goods> goodsL=goodsDao.FindAllgoodsByType(goods.getType());
		List<Goods> goodsList=imageDao.getImageForGoodsList(goodsL);
		//System.out.println(goodsList.get(0).getGoodsName()+" "+goodsList.get(0).getPrice()+" "+goodsList.get(0).getUnit()+"  "+goodsList.get(0).getImageUrl());
		int size=goodsList.size();
		request.setAttribute("goodList", goodsList);
		request.setAttribute("size", size);
		return "product";
	}
	
	public String goodsToType() {
		HttpServletRequest request=ServletActionContext.getRequest();
		// System.out.println(goods.getType());
		List<Goods> goodsL = goodsDao.FindAllgoodsByType(goods.getType());
		List<Goods> goodsList = imageDao.getImageForGoodsList(goodsL);
		//System.out.println(goodsList.get(0).getImageUrl());
		// System.out.println(goodsList.get(0).getGoodsName()+"
		// "+goodsList.get(0).getPrice()+" "+goodsList.get(0).getUnit()+"
		// "+goodsList.get(0).getImageUrl());
		//System.out.println("aaa");
		int size = goodsList.size();
		request.setAttribute("goodList", goodsList);
		request.setAttribute("size", size);
		return "goodsToType";
	}
	
	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

	//获得该类别的所有商品
	public String proinfo() {
		HttpServletRequest request=ServletActionContext.getRequest();
		//System.out.println(goods.getType());
		Goods Jgoods=goodsDao.findGoodsById(goods.getGoodsId());
		//System.out.println(Jgoods);
		List<Goods> goodsL=goodsDao.FindAllgoodsByType(goods.getType());
		List<Goods> goodsList=imageDao.getImageForGoodsList(goodsL);
		Goods goodsH=imageDao.getImageForGoods(Jgoods);
		//System.out.println(goodsList.get(0).getGoodsName()+" "+goodsList.get(0).getPrice()+" "+goodsList.get(0).getUnit()+"  "+goodsList.get(0).getImageUrl());
		int size=goodsList.size();
		//System.out.println(goodsH.getImage2Url());
		request.setAttribute("goodsH", goodsH);
		request.setAttribute("goodList", goodsList);
		request.setAttribute("size", size);
		return "proinfo";
	}
	
	public String proinfo1() {
		HttpServletRequest request=ServletActionContext.getRequest();
		List<Goods> goodsL=goodsDao.FindAllgoodsByType(goods.getType());
		List<Goods> goodsList=imageDao.getImageForGoodsList(goodsL);
		Goods Ngoods=goodsDao.findGoodsByGoodsName(goods.getGoodsName());
		Goods goodsN=imageDao.getImageForGoods(Ngoods);
		int size=goodsList.size();
		request.setAttribute("goodsH", goodsN);
		request.setAttribute("goodList", goodsList);
		request.setAttribute("size", size);
		return "proinfo";
	}
	
	public String list(){
		return "list";
	}
	
	public String type(){
		List<Type> typeList= typeDao.FindAllType();
		for (Type type : typeList) {
			typeMap.put(String.valueOf(type.getTypeId()), type.getTypeName());
		}
		return "type";
	}
	public String listShow(){ 
		goodsList = goodsDao.FindAllgoodsByType(typeNum);
		
		for (Goods goods : goodsList) {
			System.out.println(goods.toString());
		}
		return "listShow";
	}

}
