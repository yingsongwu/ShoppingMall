package com.xiaohuteam.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xiaohuteam.dao.TypeDao;
import com.xiaohuteam.pojo.Type;
import com.xiaohuteam.util.JdbcUtil;

public class TypeDaoImpl implements TypeDao{

	@Override
	public List<Type> FindAllType() {
		Connection conn=JdbcUtil.getConnecting();
		String sql="SELECT * FROM goodstype";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Type type=null;
		List<Type> typeList=new ArrayList<>();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				type=new Type();
				type.setTypeId(rs.getInt("typeId"));
				type.setTypeName(rs.getString("typeName"));
				type.setInfo(rs.getString("typeInfo"));
				typeList.add(type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.closeConn(conn, ps, rs);
		}
		return typeList;
	}

}
