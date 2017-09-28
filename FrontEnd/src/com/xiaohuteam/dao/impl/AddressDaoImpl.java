package com.xiaohuteam.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xiaohuteam.dao.AddressDao;
import com.xiaohuteam.pojo.Address;
import com.xiaohuteam.util.JdbcUtil;

public class AddressDaoImpl implements AddressDao{

	@Override
	public List<Address> findAllAddress() {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM provinces";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Address address=null;
		List<Address> addressList=new ArrayList<>();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				address=new Address();
				address.setProvince(rs.getString("province"));
				addressList.add(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addressList;
	}

	@Override
	public List<Address> findAllCity(String province) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM cities WHERE provinceid=(SELECT provinceid FROM provinces WHERE province=?)";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Address address=null;
		List<Address> addressList=new ArrayList<>();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, province);
			rs=ps.executeQuery();
			while(rs.next()) {
				address=new Address();
				address.setCity(rs.getString("city"));
				addressList.add(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addressList;
	}

	@Override
	public List<Address> findAllAreas(String city) {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM areas WHERE cityid=(SELECT cityid FROM cities WHERE city=?)";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Address address=null;
		List<Address> addressList=new ArrayList<>();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, city);
			rs=ps.executeQuery();
			while(rs.next()) {
				address=new Address();
				address.setAreas(rs.getString("area"));
				addressList.add(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addressList;
	}

}
