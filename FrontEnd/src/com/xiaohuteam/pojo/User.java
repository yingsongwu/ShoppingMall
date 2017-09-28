package com.xiaohuteam.pojo;

public class User {
	
	private int userId;
	private String logInName;
	private String realName;
	private String receiver;
	private String postCode;
	private String phoneNum;
	private String idCard;
	private String address;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getLogInName() {
		return logInName;
	}
	public void setLogInName(String logInName) {
		this.logInName = logInName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", logInName=" + logInName + ", realName=" + realName + ", receiver="
				+ receiver + ", postCode=" + postCode + ", phoneNum=" + phoneNum + ", idCard=" + idCard + ", address="
				+ address + "]";
	}


}
