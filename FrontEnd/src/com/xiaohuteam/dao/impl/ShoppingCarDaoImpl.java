package com.xiaohuteam.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.xiaohuteam.dao.ShoppingCarDao;
import com.xiaohuteam.pojo.Goods;
import com.xiaohuteam.pojo.ShoppingCar;
import com.xiaohuteam.util.JdbcUtil;

public class ShoppingCarDaoImpl implements ShoppingCarDao{

	DecimalFormat df = new DecimalFormat("#.00");
	@Override
	public List<ShoppingCar> findAllGoodsOnCar(String logInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT images.*,e2.* FROM images,(SELECT goods.*,e1.cargoodsId,e1.num,e1.carId FROM goods,(SELECT * FROM cargoods WHERE carId = (SELECT carId FROM car WHERE logInName=?)) e1 WHERE goods.goodsId=e1.goodsId AND goods.del=0) e2 WHERE images.goodsId=e2.goodsId AND images.del=0;";
		PreparedStatement ps=null;
		ResultSet rs=null;
		ShoppingCar shoppingCar=null;
		Goods goods=null;
		List<ShoppingCar> shoppingCarList=new ArrayList<>();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, logInName);
			rs=ps.executeQuery();
			while(rs.next()) {
				shoppingCar = new ShoppingCar();
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
				goods.setImageUrl(rs.getString("image1Url"));
				goods.setImage2Url(rs.getString("image2Url"));
				goods.setImage3Url(rs.getString("image3Url"));
				goods.setImage4Url(rs.getString("image4Url"));
				goods.setImage5Url(rs.getString("image5Url"));
				goods.setGoodsAddress(rs.getString("goodsAddress"));
				shoppingCar.setCarGoodsId(rs.getInt("cargoodsId"));
				shoppingCar.setGoodsCar(goods);
				shoppingCar.setGoodsNum(rs.getInt("num"));
				shoppingCar.setLogInName(logInName);
				shoppingCar.setCarId(rs.getInt("carId"));
				shoppingCar.setAmount(Double.valueOf(df.format((shoppingCar.getGoodsNum())*(goods.getPrice()))));
				shoppingCarList.add(shoppingCar);
				//System.out.println(shoppingCar);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return shoppingCarList;
	}

	@Override
	public boolean deleteGoods(int cargoodsId) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="DELETE FROM cargoods WHERE cargoodsId=?";
		PreparedStatement ps=null;
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cargoodsId);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, null);
		}
		return result>0?true:false;
	}

	@Override
	public boolean deleteAllGoods(String logInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="DELETE FROM cargoods WHERE carId=(SELECT carId FROM car WHERE logInName=?)";
		PreparedStatement ps=null;
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, logInName);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, null);
		}
		return result>0?true:false;
	}

	@Override
	public boolean updateGoodsNum(int carGoodsId,int newNum) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="UPDATE cargoods SET num=? WHERE cargoodsId=?";
		PreparedStatement ps=null;
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, newNum);
			ps.setInt(2, carGoodsId);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, null);
		}
		return result>0?true:false;
	}

	@Override
	public boolean addGoodsToCar(int goodsId, int num, int carId) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="INSERT INTO cargoods (goodsId,num,carId) VALUES (?,?,?)";
		PreparedStatement ps=null;
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, goodsId);
			ps.setInt(2, num);
			ps.setInt(3,carId);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, null);
		}
		return result>0?true:false;
	}

	@Override
	public boolean addAccountToCar(String logInName) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="INSERT INTO car (logInName) VALUES(?)";
		PreparedStatement ps=null;
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, logInName);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, null);
		}
		return result>0?true:false;
	}

}
