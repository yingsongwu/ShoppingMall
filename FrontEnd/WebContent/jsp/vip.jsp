<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>17商城</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
 $(function(){
	 $(".vipNav dd:first").show();
	 })
</script>
</head>
<body>
 <div class="mianCont">
  <div class="top">
   <span>您好！欢迎来到17商城 请&nbsp;<a href="${pageContext.request.contextPath }/user_Login">[登录]</a>&nbsp;<a href="${pageContext.request.contextPath }/user_reg">[注册]</a></span>
   <span class="topRight">
    <a href="${pageContext.request.contextPath }/user_checkHasLogIn">我的17</a>&nbsp;| 
    <a href="${pageContext.request.contextPath }/user_checkHasLogInOrder">我的订单</a>&nbsp;| 
    <a href="${pageContext.request.contextPath }/user_checkHasLogIn">会员中心</a>&nbsp;|
    <a href="${pageContext.request.contextPath }/user_contact">联系我们</a>
   </span>
  </div><!--top/-->
  <div class="lsg">
   <h1 class="logo"><a href="${pageContext.request.contextPath }/user_index"><img src="images/logo.png" width="217" height="90" /></a></h1>
   <form action="#" method="get" class="subBox">
    <div class="subBoxDiv">
     <input type="text" class="subLeft" />
     <input type="image" src="images/subimg.png" width="63" height="34" class="sub" />
     <div class="hotWord">
      热门搜索：
      <a href="${pageContext.request.contextPath }/goods_proinfo?type=1&goodsId=1">冷饮杯</a>&nbsp;
      <a href="${pageContext.request.contextPath }/goods_proinfo?type=1&goodsId=2">热饮杯</a> &nbsp;
      <a href="${pageContext.request.contextPath }/goods_proinfo?type=1&goodsId=3">纸杯</a>&nbsp;
      <a href="${pageContext.request.contextPath }/goods_proinfo?type=1&goodsId=1">纸巾</a>  &nbsp;
      <a href="${pageContext.request.contextPath }/goods_proinfo?type=2&goodsId=3">纸巾</a> &nbsp;
      <a href="${pageContext.request.contextPath }/goods_proinfo?type=1&goodsId=1">纸杯</a>&nbsp;
     </div><!--hotWord/-->
    </div><!--subBoxDiv/-->
   </form><!--subBox/-->
   <div class="gouwuche">
    <div class="gouCar">
     <img src="images/gouimg.png" width="19" height="20" style="position:relative;top:6px;" />&nbsp;|&nbsp;
     <strong class="red"><c:choose><c:when test="${sessionScope.account !=null }">${sessionScope.length } </c:when><c:otherwise>0 </c:otherwise></c:choose></strong>&nbsp;件&nbsp;|
     <strong class="red">￥<c:choose><c:when test="${sessionScope.account !=null }">${sessionScope.sum } </c:when><c:otherwise>0.00 </c:otherwise></c:choose></strong> 
     <a href="order.html">去结算</a> <img src="images/youjian.jpg" width="5" height="8" />    
    </div><!--gouCar/-->
    <div class="myChunlv">
     <a href="${pageContext.request.contextPath }/user_checkHasLogIn"><img src="images/mychunlv.jpg" width="112" height="34" /></a>
    </div><!--myChunlv/-->
   </div><!--gouwuche/-->
  </div><!--lsg/-->
  <div class="pnt">
   <div class="pntLeft">
    <h2 class="Title">所有商品分类
     <ul class="InPorNav">
     <c:forEach items="${sessionScope.show }" var="typename">
       <li><a href="${pageContext.request.contextPath }/goods_goodsToType?type=${typename.key.typeId }">${typename.key.typeName }</a>
       <div class="chilInPorNav">
       <c:forEach items="${typename.value }" var="value1">
       <a href="${pageContext.request.contextPath }/goods_proinfo1?goodsName=${value1 }">${value1 }</a>
       </c:forEach>
       </div><!--chilLeftNav/-->
    </c:forEach>
    </ul><!--InPorNav/-->
    </h2>
   </div><!--pntLeft/-->
   <div class="pntRight">
    <ul class="nav">
     <li><a href="${pageContext.request.contextPath }/user_index">商城首页</a></li>
     <li><a href="${pageContext.request.contextPath }/goods_goodsToType?type=1">促销中心</a></li>
     <li><a href="${pageContext.request.contextPath }/user_checkHasLogIn">会员中心</a></li>
     <li><a href="${pageContext.request.contextPath }/user_help">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  <div class="positions">
   当前位置：<a href="${pageContext.request.contextPath }/user_index">首页</a> &gt; <a href="${pageContext.request.contextPath }/user_checkHasLogIn">会员中心</a>
    &gt; <a href="#" class="posCur">我的订单</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="contLeft" id="contLeft">
    <h3 class="leftTitle">会员中心</h3>
    <dl class="helpNav vipNav">
     <dt>我的主页</dt>
      <dd>
       <a href="${pageContext.request.contextPath }/user_checkHasLogIn" class="vipCur">个人中心</a>
       <a href="vipOrder.html">我的订单</a>
      </dd>
     <dt>账户设置</dt>
      <dd>
       <a href="${pageContext.request.contextPath }/user_checkHasLogIn">个人信息</a>
       <a href="${pageContext.request.contextPath }/userMsg_vipPwd">密码修改</a>
       <a href="vipAdress.html">收货地址</a>
      </dd>
      <dt>客户服务</dt>
       <dd>
        <a href="vipExit.html">网站使用条款</a>
        <a href="vipTuihuo.html">网站免责声明</a>
        <a href="message.html">在线留言</a>
       </dd>
      
      
    </dl><!--helpNav/-->
   </div><!--contLeft/-->
   <div class="contRight">
    <h1 class="vipName"><span>用户名：</span>${sessionScope.account.logInName }  <strong class="vipUp">[点击修改/补充个人信息]</strong></h1>
    <table class="vipMy">
     <tr>
      <th>用户名</th>
      <th>邮编</th>
      <th>真实姓名</th>
      <th>联系方式</th>
      <th>证件号码</th>
      <th>地址</th>
     </tr>
     <tr>
      <td>${sessionScope.userMsg.logInName }</td>
      <td>${sessionScope.userMsg.postCode }</td>
      <td>${sessionScope.userMsg.realName }</td>
      <td>${sessionScope.userMsg.phoneNum }</td>
      <td>${sessionScope.userMsg.idCard }</td>
      <td>${sessionScope.userMsg.address }</td>
     </tr>
    </table><!--vipMy/-->
    <div class="address">
    <div class="addList">
     <label><span class="red">* </span>用户名:</label>
     <input type="text" id="logInName"/>
    </div><!--addList-->
     <div class="addList">
     <label><span class="red">* </span>真实姓名:</label>
     <input type="text" id="realName"/>
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>详细地址:</label>
     <input type="text" id="address"/>
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>邮政编码:</label>
     <input type="text" id="postCode"/>
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>证件号码:</label>
     <input type="text" id="idCard"/>
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>手机号码:</label>
     <input type="text" id="phoneNum"/> 或者固定电话 <input type="text" id="fixPhoneNum"/>
    </div><!--addList--> 
    <div class="addList">
     <label><span class="red">* </span>选择地区:</label>
     <select id="pro">
      <option>请选择省</option>
      <c:forEach items="${requestScope.addressList }" var="addressprovince">
      <option>${addressprovince.province }</option>
      </c:forEach>
     </select>
     <select id="city">
     <option>请选择市</option>
     </select>
     <select id="cou">
      <option>请选择地区</option>
     </select>
    </div><!--addList-->
    <div class="addList2">
     <input type="image" src="images/baocun.png" width="79" height="30" onclick="submit();"/>
    </div><!--addList2/-->
   </div><!--address/-->
   </div><!--contRight/-->
   <div class="clears"></div>
  </div><!--cont/-->
  <div class="inHelp">
   <div class="inHLeft">
    <h4>帮助中心</h4>
    <ul class="inHeList">
     <li><a href="${pageContext.request.contextPath }/user_help">购物指南</a></li>
     <li><a href="${pageContext.request.contextPath }/user_help">支付方式</a></li>
     <li><a href="${pageContext.request.contextPath }/user_help">售后服务</a></li>
     <li><a href="${pageContext.request.contextPath }/user_about">企业简介</a></li>
     <div class="clears"></div>
    </ul><!--inHeList/-->
   </div><!--inHLeft/-->
   <div class="inHLeft">
    <h4>会员服务</h4>
    <ul class="inHeList">
     <li><a href="${pageContext.request.contextPath }/user_reg">会员注册</a></li>
     <li><a href="${pageContext.request.contextPath }/user_checkHasLogIn">会员登录</a></li>
     <li><a href="${pageContext.request.contextPath }/user_checkHasLogInOrder">购物车</a></li>
     <li><a href="${pageContext.request.contextPath }/user_checkHasLogInOrder">我的订单</a></li>
     <div class="clears"></div>
    </ul><!--inHeList/-->
   </div><!--inHLeft/-->
   <div class="inHRight">
    <h4>全国统一免费服务热线</h4>
    <div class="telBox">400-0000-0000</div>
    <div class="weibo">
    <wb:follow-button uid="2991975565" type="red_1" width="67" height="24" ></wb:follow-button>
    </div>
   </div><!--inHRight/-->
   <div class="clears"></div>
  </div><!--inHelp/-->
  <div class="footer">
   <p>
   <a href="http://www.baidu.com/">进入17官网</a>&nbsp;|&nbsp;
   <a href="${pageContext.request.contextPath }/user_index">商城首页</a>&nbsp;|&nbsp;
   <a href="${pageContext.request.contextPath }/goods_goodsToType?type=1">促销中心</a>&nbsp;|&nbsp;
   <a href="${pageContext.request.contextPath }/user_checkHasLogInOrder">我的订单</a>&nbsp;|&nbsp;
   <a href="http://www.baidu.com/">新闻动态</a>&nbsp;|&nbsp;
   <a href="${pageContext.request.contextPath }/user_checkHasLogIn">会员中心</a>&nbsp;|&nbsp;
   <a href="${pageContext.request.contextPath }/user_help">帮助中心</a>
   </p>
   <p>
    版权所有：上海17实业有限公司 版权所有  Copyright 2010-2015   沪ICP备00000000号   <a href="http://www.mycodes.net/" target="_blank">源码之家</a>   
   </p>
  </div><!--footer/-->
 </div><!--mianCont/-->
 <a href="#" class="backTop">&nbsp;</a>
</body>
<script type="text/javascript">
function change() {
	var value=this.value;
	var city=document.getElementById("city");
	city.length=0;
	var option=document.createElement("option");
	var text=document.createTextNode("请选择市");
	option.appendChild(text);
	city.appendChild(option);
	var param={"province":value};
	$.post("${pageContext.request.contextPath }/address_getCityByProvince",param,function(returnData){
		for(var key in returnData){
			var option=document.createElement("option");
			var text=document.createTextNode(returnData[key].city);
			option.appendChild(text);
			city.appendChild(option);
			city.onchange=change1;
		}
	});
}
function change1() {
	var value=this.value;
	var cou=document.getElementById("cou");
	cou.length=0;
	var option=document.createElement("option");
	var text=document.createTextNode("请选择地区");
	option.appendChild(text);
	city.appendChild(option);
	var param={"city":value};
	$.post("${pageContext.request.contextPath }/address_getAreasByCity",param,function(returnData){
		for(var key in returnData){
			var option=document.createElement("option");
			var text=document.createTextNode(returnData[key].areas);
			option.appendChild(text);
			cou.appendChild(option);
		}
	});
}
var pro=document.getElementById("pro");
pro.onchange=change;

$("#logInName").blur(a);
	function a() {
		var logInName=document.getElementById("logInName").value;
		alert(logInName);
	var param={"logInName":logInName};
	$.post("${pageContext.request.contextPath }/user_checklogInName",param,function(returnData){
		if(returnData.TheSameName !=null)
		 alert(returnData.TheSameName);
	});
}
	function submit() {
		var newLogInName=document.getElementById("logInName").value;
		var address=$("#address").val();
		var postCode=$("#postCode").val();
		var idCard=$("#idCard").val();
		var phoneNum=$("#phoneNum").val();
		var fixPhoneNum=$("#fixPhoneNum").val();
		var realName=$("#realName").val();
		var bigAddress =$("#pro").find("option:selected").text()+$("#city").find("option:selected").text()+$("#cou").find("option:selected").text();
		var abc=bigAddress+address;
		location.href="${pageContext.request.contextPath }/userMsg_updateMsgByLogInName?newLogInName="+newLogInName+"&address="+abc+"&postCode="+postCode+"&idCard="+
				idCard+"&phoneNum="+phoneNum+"&realName="+realName+"&logInName=${sessionScope.account.logInName}";
		/* var addressL=document.getElementById("pro").value;
		alert(addressL); */
	}

</script>
</html>