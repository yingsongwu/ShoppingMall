package com.xiaohuteam.pojo;

public class Address {
	
	private String province;
	private String city;
	private String areas;
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAreas() {
		return areas;
	}
	public void setAreas(String areas) {
		this.areas = areas;
	}
	@Override
	public String toString() {
		return "Address [province=" + province + ", city=" + city + ", areas=" + areas + "]";
	}

}
