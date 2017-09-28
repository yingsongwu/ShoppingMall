package com.xiaohuteam.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xiaohuteam.dao.GoodsDao;
import com.xiaohuteam.pojo.Goods;
import com.xiaohuteam.util.JdbcUtil;

public class GoodsDaoImpl implements GoodsDao {

	@Override
	public List<Goods> FindAllgoodsByType(int type) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM goods WHERE type=? AND del=0";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Goods goods=null;
		List<Goods> goodsList=new ArrayList<>();
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, type);
			rs=ps.executeQuery();
			while(rs.next()) {
				goods=new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getDouble("price"));
				goods.setUnit(rs.getString("unit"));
				goods.setStore(rs.getInt("store"));
				goods.setPCSalePrice(rs.getDouble("PCSalePrice"));
				goods.setType(rs.getInt("type"));
				goods.setCommoditySales(rs.getInt("commoditySales"));
				goods.setInfo(rs.getString("info"));
				goods.setShelfTime(rs.getString("shelfTime"));
				goods.setOriginalPrice(rs.getDouble("originalPrice"));
				goods.setGoodsAddress(rs.getString("goodsAddress"));
				goodsList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return goodsList;
	}

	@Override
	public List<String> findGoodsName(int type) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT goodsName FROM goods WHERE type=? AND del=0";
		PreparedStatement ps=null;
		ResultSet rs=null;
		String str=null;
		List<String> goodsNameList=new ArrayList<>();
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, type);
			rs=ps.executeQuery();
			while(rs.next()) {
				str=new String();
				str=rs.getString("goodsName");
				goodsNameList.add(str);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return goodsNameList;
	}

	@Override
	public Goods findGoodsById(int goodsId) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM goods WHERE goodsId=? AND del=0";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Goods goods=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, goodsId);
			rs=ps.executeQuery();
			while(rs.next()) {
				goods=new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getDouble("price"));
				goods.setUnit(rs.getString("unit"));
				goods.setStore(rs.getInt("store"));
				goods.setPCSalePrice(rs.getDouble("PCSalePrice"));
				goods.setType(rs.getInt("type"));
				goods.setCommoditySales(rs.getInt("commoditySales"));
				goods.setInfo(rs.getString("info"));
				goods.setShelfTime(rs.getString("shelfTime"));
				goods.setOriginalPrice(rs.getDouble("originalPrice"));
				goods.setGoodsAddress(rs.getString("goodsAddress"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return goods;
	}

	@Override
	public Goods findGoodsByGoodsName(String goodsName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM goods WHERE goodsName=? AND del=0";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Goods goods=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, goodsName);
			rs=ps.executeQuery();
			while(rs.next()) {
				goods=new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getDouble("price"));
				goods.setUnit(rs.getString("unit"));
				goods.setStore(rs.getInt("store"));
				goods.setPCSalePrice(rs.getDouble("PCSalePrice"));
				goods.setType(rs.getInt("type"));
				goods.setCommoditySales(rs.getInt("commoditySales"));
				goods.setInfo(rs.getString("info"));
				goods.setShelfTime(rs.getString("shelfTime"));
				goods.setOriginalPrice(rs.getDouble("originalPrice"));
				goods.setGoodsAddress(rs.getString("goodsAddress"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return goods;
	}

}
