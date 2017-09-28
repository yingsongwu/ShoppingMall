package com.xiaohuteam.dao;

import java.util.List;

import com.xiaohuteam.pojo.Address;

public interface AddressDao {

	//封装所有的省份
	List<Address> findAllAddress();
	
	//通过省份获得城市
	List<Address> findAllCity(String province);

	List<Address> findAllAreas(String city);
}
