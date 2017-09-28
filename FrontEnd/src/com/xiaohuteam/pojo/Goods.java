package com.xiaohuteam.pojo;

public class Goods {
	
	private int goodsId;
	private String goodsName;
	private double price;
	private String unit;
	private int store;
	private double PCSalePrice;
	private int type;
	private int commoditySales;
	private String info;
	private String shelfTime;
	private double originalPrice;
	private String imageUrl;
	private String image2Url;
	private String image3Url;
	private String image4Url;
	private String image5Url;
	private String goodsAddress;
	public String getGoodsAddress() {
		return goodsAddress;
	}
	public void setGoodsAddress(String goodsAddress) {
		this.goodsAddress = goodsAddress;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getImage2Url() {
		return image2Url;
	}
	public void setImage2Url(String image2Url) {
		this.image2Url = image2Url;
	}
	public String getImage3Url() {
		return image3Url;
	}
	public void setImage3Url(String image3Url) {
		this.image3Url = image3Url;
	}
	public String getImage4Url() {
		return image4Url;
	}
	public void setImage4Url(String image4Url) {
		this.image4Url = image4Url;
	}
	public String getImage5Url() {
		return image5Url;
	}
	public void setImage5Url(String image5Url) {
		this.image5Url = image5Url;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getStore() {
		return store;
	}
	public void setStore(int store) {
		this.store = store;
	}
	public double getPCSalePrice() {
		return PCSalePrice;
	}
	public void setPCSalePrice(double pCSalePrice) {
		PCSalePrice = pCSalePrice;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getCommoditySales() {
		return commoditySales;
	}
	public void setCommoditySales(int commoditySales) {
		this.commoditySales = commoditySales;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getShelfTime() {
		return shelfTime;
	}
	public void setShelfTime(String shelfTime) {
		this.shelfTime = shelfTime;
	}
	public double getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(double originalPrice) {
		this.originalPrice = originalPrice;
	}
	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", goodsName=" + goodsName + ", price=" + price + ", unit=" + unit
				+ ", store=" + store + ", PCSalePrice=" + PCSalePrice + ", type=" + type + ", commoditySales="
				+ commoditySales + ", info=" + info + ", shelfTime=" + shelfTime + ", originalPrice=" + originalPrice
				+ ", imageUrl=" + imageUrl + ", image2Url=" + image2Url + ", image3Url=" + image3Url + ", image4Url="
				+ image4Url + ", image5Url=" + image5Url + ", goodsAddress=" + goodsAddress + "]";
	}
	
	
	
	

}
