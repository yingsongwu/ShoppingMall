package com.xiaohuteam.pojo;

import java.util.List;

public class ShoppingCar {
	
	private String logInName;
	private int carGoodsId;
	private int carId;
	private Goods goodsCar;
	private int goodsNum;
	private double amount;
	public String getLogInName() {
		return logInName;
	}
	public void setLogInName(String logInName) {
		this.logInName = logInName;
	}
	public int getCarGoodsId() {
		return carGoodsId;
	}
	public void setCarGoodsId(int carGoodsId) {
		this.carGoodsId = carGoodsId;
	}
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public Goods getGoodsCar() {
		return goodsCar;
	}
	public void setGoodsCar(Goods goodsCar) {
		this.goodsCar = goodsCar;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "ShoppingCar [logInName=" + logInName + ", carGoodsId=" + carGoodsId + ", carId=" + carId + ", goodsCar="
				+ goodsCar + ", goodsNum=" + goodsNum + ", amount=" + amount + "]";
	}

}
