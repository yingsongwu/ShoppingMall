package com.xiaohuteam.pojo;

public class Account {
	
	private String logInName;
	private String password;
	public String getLogInName() {
		return logInName;
	}
	public void setLogInName(String logInName) {
		//System.out.println(logInName);
		this.logInName = logInName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		//System.out.println(password);
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "Account [logInName=" + logInName + ", password=" + password + "]";
	}

}
