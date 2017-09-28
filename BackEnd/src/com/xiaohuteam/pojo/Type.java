package com.xiaohuteam.pojo;

public class Type {
	
	private int typeId;
	private String typeName;
	private String info;
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "Type [typeId=" + typeId + ", typeName=" + typeName + ", info=" + info + "]";
	}

}
