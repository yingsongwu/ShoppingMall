package com.xiaohuteam.dao;

import java.util.List;

import com.xiaohuteam.pojo.ShoppingCar;

public interface ShoppingCarDao {
	
	//用户注册就将该用户添加至购物车表
	boolean addAccountToCar(String logInName);
	
	//根据帐户名查找该账户下的购物车商品
	List<ShoppingCar> findAllGoodsOnCar(String logInName);

	//删除购物车里的单一商品
	boolean deleteGoods(int cargoodsId);
	
	//删除购物车所有商品
	boolean deleteAllGoods(String logInName);
	
	//修改购物车里某件商品的数量
	boolean updateGoodsNum(int carGoodsId,int newNum);
	
	//添加商品到购物车
	boolean addGoodsToCar(int goodsId,int num,int carId);
}
