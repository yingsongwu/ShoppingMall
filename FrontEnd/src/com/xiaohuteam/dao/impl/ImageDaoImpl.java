package com.xiaohuteam.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.xiaohuteam.dao.ImageDao;
import com.xiaohuteam.pojo.Goods;
import com.xiaohuteam.util.JdbcUtil;

public class ImageDaoImpl implements ImageDao{

	@Override
	public List<Goods> getImageForGoodsList(List<Goods> goodsList) {
		for (Goods goods : goodsList) {
			Connection conn=JdbcUtil.getConnecting();
			String sql="SELECT * FROM images WHERE goodsId=? AND del=0";
			PreparedStatement ps=null;
			ResultSet rs=null;
			try {
				ps=conn.prepareStatement(sql);
				ps.setInt(1, goods.getGoodsId());
				rs=ps.executeQuery();
				while(rs.next()) {
					goods.setImageUrl(rs.getString("image1Url"));
					goods.setImage2Url(rs.getString("image2Url"));
					goods.setImage3Url(rs.getString("image3Url"));
					goods.setImage4Url(rs.getString("image4Url"));
					goods.setImage5Url(rs.getString("image5Url"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return goodsList;
	}

	@Override
	public Goods getImageForGoods(Goods goods) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM images WHERE goodsId=? AND del=0";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, goods.getGoodsId());
			rs=ps.executeQuery();
			while(rs.next()) {
				goods.setImageUrl(rs.getString("image1Url"));
				goods.setImage2Url(rs.getString("image2Url"));
				goods.setImage3Url(rs.getString("image3Url"));
				goods.setImage4Url(rs.getString("image4Url"));
				goods.setImage5Url(rs.getString("image5Url"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goods;
	}

}
