package com.xiaohuteam.dao;

import java.util.List;

import com.xiaohuteam.pojo.Goods;

public interface GoodsDao {
	
	//通过类别查找该类别的所有商品
	List<Goods> FindAllgoodsByType(int type);
	
	//通过类别查找返回对应类别商品的名字
	List<String> findGoodsName(int type);
	
	//通过商品Id查找返回商品信息
	Goods findGoodsById(int goodsId);
	
	//通过商品名字返回商品信息
	Goods findGoodsByGoodsName(String goodsName);

}
