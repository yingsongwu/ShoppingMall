package com.xiaohuteam.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.xiaohuteam.dao.AddressDao;
import com.xiaohuteam.dao.impl.AddressDaoImpl;
import com.xiaohuteam.pojo.Address;

public class AddressAction extends ActionSupport implements ModelDriven<Address>{

	HttpServletRequest request=ServletActionContext.getRequest();
	ValueStack stack=ActionContext.getContext().getValueStack();
	AddressDao addressDao=new AddressDaoImpl();
	Address address=new Address();
	private List<Address> addressCityList=new ArrayList<>();
	private List<Address> addressAreasList=new ArrayList<>();
	
	public List<Address> getAddressAreasList() {
		return addressAreasList;
	}

	public void setAddressAreasList(List<Address> addressAreasList) {
		this.addressAreasList = addressAreasList;
	}

	public List<Address> getAddressCityList() {
		return addressCityList;
	}

	public void setAddressCityList(List<Address> addressCityList) {
		this.addressCityList = addressCityList;
	}

	@Override
	public Address getModel() {
		return address;
	}
	
	public String userA() {
		List<Address> addressList=addressDao.findAllAddress();
		request.setAttribute("addressList", addressList);
		//System.out.println(addressList.get(0));
		return "userA";
	}
	
	public String getCityByProvince() {
		addressCityList=addressDao.findAllCity(address.getProvince());
		stack.set("addressCityList", addressCityList);
		/*request.setAttribute("addressCityList", addressCityList);*/
		return "city";
	}
	
	public String getAreasByCity() {
		addressAreasList=addressDao.findAllAreas(address.getCity());
		stack.set("addressAreasList", addressAreasList);
		return "areas";
	}

}
