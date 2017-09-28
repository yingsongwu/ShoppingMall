package com.xiaohuteam.dao;

import java.util.List;

import com.xiaohuteam.pojo.Goods;

public interface ImageDao {
	
	//为商品集合选取到对应的图片
	List<Goods> getImageForGoodsList(List<Goods> goodsList);
	
	//为单个商品选取对应的图片
	Goods getImageForGoods(Goods goods);

}
