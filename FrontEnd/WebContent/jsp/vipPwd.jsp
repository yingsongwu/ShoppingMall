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
	 $(".vipNav dd:eq(1)").show();
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
     <strong class="red">￥  <c:choose><c:when test="${sessionScope.account !=null }">${sessionScope.sum } </c:when><c:otherwise>0.00 </c:otherwise></c:choose></strong> 
     <a href="${pageContext.request.contextPath }/user_checkHasLogInOrder">去结算</a> <img src="images/youjian.jpg" width="5" height="8" />    
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
       <a href="${pageContext.request.contextPath }/user_checkHasLogIn">个人中心</a>
       <a href="vipOrder.html">我的订单</a>
      </dd>
     <dt>账户设置</dt>
      <dd>
       <a href="${pageContext.request.contextPath }/user_checkHasLogIn">个人信息</a>
       <a href="${pageContext.request.contextPath }/userMsg_vipPwd" class="vipCur">密码修改</a>
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
   <h2 class="oredrName">
    修改密码
    </h2>
    <div class="address" style="display:block">
    <div class="addList">
     <label>原密码:</label>
     <input type="password" id="oldPassword"/>
    </div><!--addList-->
    <div class="addList">
     <label>新密码:</label>
     <input type="password" class="vipPwd1" id="newPassword"/>
    </div><!--addList-->
    <div class="addList">
     <label>确认密码:</label>
     <input type="password" class="vipPwd2" id="checkPassword"/>
    </div><!--addList-->
    <div class="addList2">
     <input type="image" src="images/baocun.png" width="79" height="30"  onclick="submit();"/>
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
$("#checkPassword").blur(a);
$("#newPassword").blur(b);
function b(){
	var newPassword=document.getElementById("newPassword").value;
	var pwdlen=newPassword.length;
	if((pwdlen < 6) || (pwdlen > 14)){
        alert("你输入的密码格式不正确，请重新输入！")
        }
}
function a(){
	var newPassword=document.getElementById("newPassword").value;
	var checkPassword=document.getElementById("checkPassword").value;
	if(newPassword!=checkPassword){
		alert("两次输入的密码不一致");
	}
}
function submit() {
	var oldPassword=document.getElementById("oldPassword").value;
	var newPassword=document.getElementById("newPassword").value;
	var checkPassword=document.getElementById("checkPassword").value;
	param={"oldPassword":oldPassword,"newPassword":newPassword,"checkPassword":checkPassword};
	$.post("${pageContext.request.contextPath }/userMsg_updatePassword",param,function(returnData){
		if(returnData.ThePassWordIsNotMatch!=null){
			alert(returnData.ThePassWordIsNotMatch);
		}else{
			alert(returnData.sus);
		}
	});
}

</script>
</html>