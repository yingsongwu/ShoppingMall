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
<script src="js/MagicZoom.js" type="text/javascript"></script>
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
     <strong class="red">￥ <c:choose><c:when test="${sessionScope.account !=null }">${sessionScope.sum } </c:when><c:otherwise>0.00 </c:otherwise></c:choose></strong> 
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
     <li class="navCur"><a href="${pageContext.request.contextPath }/goods_goodsToType?type=1">促销中心</a></li>
     <li><a href="${pageContext.request.contextPath }/user_checkHasLogIn">会员中心</a></li>
     <li><a href="${pageContext.request.contextPath }/user_help">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  <div class="positions">
   当前位置：<a href="${pageContext.request.contextPath }/user_index">首页</a> &gt; <a href="${pageContext.request.contextPath }/goods_goodsToType?type=1" class="posCur">促销商品</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="contLeft">
    <ul class="leftPorNav">
     <c:forEach items="${requestScope.show }" var="typename">
       <li><a href="${pageContext.request.contextPath }/goods_goodsToType?type=${typename.key.typeId }">${typename.key.typeName }</a>
       <div class="chilInPorNav">
       <c:forEach items="${typename.value }" var="value1">
       <a href="${pageContext.request.contextPath }/goods_proinfo1?goodsName=${value1 }">${value1 }</a>
       </c:forEach>
       </div><!--chilLeftNav/-->
    </c:forEach>
    </ul><!--InPorNav/-->
   </div><!--contLeft/-->
   <div class="contRight" style="border:0;">
   <div class="proBox">
   <div id="tsShopContainer">
	<div id="tsImgS"><a href="${requestScope.goodsH.imageUrl }" title="Images" class="MagicZoom" id="MagicZoom"><img width="300" height="300" src="${requestScope.goodsH.imageUrl }" /></a></div>
	<div id="tsPicContainer">
		<div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
		<div id="tsImgSCon">
			<ul>
				<li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg"><img height="42" width="42" src="${requestScope.goodsH.imageUrl }" tsImgS="${requestScope.goodsH.imageUrl }" /></li>
				<c:if test="${!empty(requestScope.goodsH.image2Url) }"><li onclick="showPic(1)" rel="MagicZoom"><img height="42" width="42" src="${requestScope.goodsH.image2Url }" tsImgS="${requestScope.goodsH.image2Url }" /></li></c:if>
				<c:if test="${!empty(requestScope.goodsH.image3Url) }"><li onclick="showPic(2)" rel="MagicZoom"><img height="42" width="42" src="${requestScope.goodsH.image3Url }" tsImgS="${requestScope.goodsH.image3Url }" /></li></c:if>
				<c:if test="${!empty(requestScope.goodsH.image4Url) }"><li onclick="showPic(3)" rel="MagicZoom"><img height="42" width="42" src="${requestScope.goodsH.image4Url }" tsImgS="${requestScope.goodsH.image4Url }" /></li></c:if>
				<c:if test="${!empty(requestScope.goodsH.image5Url) }"><li onclick="showPic(4)" rel="MagicZoom"><img height="42" width="42" src="${requestScope.goodsH.image5Url }" tsImgS="${requestScope.goodsH.image5Url }" /></li></c:if>
			</ul>
		</div>
		<div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
	</div>
	<img class="MagicZoomLoading" width="16" height="16" src="images/loading.gif" alt="Loading..." />
    <script src="js/ShopShow.js"></script>
    </div><!--tsShopContainer/-->
    <div class="proBoxRight">
     <h3 class="proTitle">商品名称：${requestScope.goodsH.goodsName }</h3>
     <div>商品编号： ${requestScope.goodsH.goodsId } </div>
     <div>现价：<strong class="red">¥${requestScope.goodsH.price }</strong> </div>
     <div>单位：${requestScope.goodsH.unit } </div>
     <div>库存：<strong class="red"><c:choose><c:when test="${requestScope.goodsH.store > 0 }">[有货] </c:when><c:otherwise>[无货] </c:otherwise></c:choose></strong> 从${requestScope.goodsH.goodsAddress }发货</div>
     <!-- <ul class="rongliang">
      <li>100ml</li>
      <li>200ml</li>
      <li>300ml</li>
      <li>400ml</li>
      <li>500ml</li>
      <div class="clears"></div>
     </ul>rongliang/ -->
     <div class="shuliang2">
      数量： <input type="text" value="1" id="num"/>
     </div><!--shuliang2/-->
     <div class="gc">
      <img src="images/goumai.png" width="117"  height="36" onclick="shoppingCar(${requestScope.goodsH.goodsId});"/></a>&nbsp;&nbsp;
      <img src="images/shoucang.png" width="117" height="36" onclick="shoppingCar(${requestScope.goodsH.goodsId});"/></a>
     </div><!--gc/-->    
    </div><!--proRight/-->
    <div class="clears"></div>
    </div><!--proBox/-->
    <ul class="fangyuan">
      <li>商品描述</li>
      <li>商品参数</li>
      <li>商品评论</li>
      <li>商品晒图</li>
      <div class="clears"></div>
    </ul><!--fangyuan/-->
    <div class="fangList">
    <div class="fangPar">
    ${requestScope.goodsH.info }<br>
       <!--   乐购超市旁，未来地铁14号线沿线地段，规划中上海四大商业附中心—真如商业副中心，婚房精装电梯两房。让您一步到位<br />
    很荣幸栗见能借此机会给您问好，为您介绍此房.<br />
    超稀缺地铁双南两房，全明户型，满五唯一，业主急需资金周转特急卖。<br />
    Information of Vernal Garden 满庭芳花园 <br />
    Location:<br />
    Located close to Gubei Carrefour and the Hongqiao Airport, 15 mins drive to international schools and downtown area.<br />
    Description:<br />
    It offers a full range of accommodations including freestanding houses, semi-detached houses and condominiums. The units are very spacious, well decorated and fully furnished. Resident can enjoy a complete range of onsite <br />recreational facilities. <br />
    Facilities:<br />
    Indoor swimming door, gym, sauna, spa, squash, cafe, childrens playground, restaurant, convenience store, snooker, basketball court. <br />
    Tv Channel:<br />
    HBO，TVB，BBC，DISCOVERY，CINEMAX， -->
    </div><!--fangPar/-->
    <c:if test="${!empty(requestScope.goodsH.imageUrl) }"><img src="${requestScope.goodsH.imageUrl }" width="756" height="310" /></c:if>
    <c:if test="${!empty(requestScope.goodsH.image2Url) }"><img src="${requestScope.goodsH.image2Url }" width="756" height="310" /></c:if>
    <c:if test="${!empty(requestScope.goodsH.image3Url) }"><img src="${requestScope.goodsH.image3Url }" width="756" height="310" /></c:if>
    <c:if test="${!empty(requestScope.goodsH.image4Url) }"><img src="${requestScope.goodsH.image4Url }" width="756" height="310" /></c:if>
    <c:if test="${!empty(requestScope.goodsH.image5Url) }"><img src="${requestScope.goodsH.image5Url }" width="756" height="310" /></c:if>
    </div><!--fangList/-->
    <div class="fangList">
     <h3 class="proTitle">商品名称：${requestScope.goodsH.goodsName }</h3>
     商品编号： ${requestScope.goodsH.goodsId }
     现价：<strong class="red">¥${requestScope.goodsH.price }</strong> 
     单位：${requestScope.goodsH.unit } 
    </div><!--fangList/-->
    <div class="fangList">
     商品评论
    </div><!--fangList/-->
    <div class="fangList">
    <c:if test="${!empty(requestScope.goodsH.imageUrl) }"><img src="${requestScope.goodsH.imageUrl }" width="132" height="129" /></c:if>
    <c:if test="${!empty(requestScope.goodsH.image2Url) }"><img src="${requestScope.goodsH.image2Url }" width="132" height="129" /></c:if>
    <c:if test="${!empty(requestScope.goodsH.image3Url) }"><img src="${requestScope.goodsH.image3Url }" width="132" height="129" /></c:if>
    <c:if test="${!empty(requestScope.goodsH.image4Url) }"><img src="${requestScope.goodsH.image4Url }" width="132" height="129" /></c:if>
    <c:if test="${!empty(requestScope.goodsH.image5Url) }"><img src="${requestScope.goodsH.image5Url }" width="132" height="129" /></c:if>
    </div><!--fangList/-->
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
function shoppingCar(goodsId) {
	var goodsNum=document.getElementById("num").value;
	location.href="${pageContext.request.contextPath }/user_checkHasLogInOrder?goodsId="+goodsId+"&goodsNum="+goodsNum;
}
</script>
</html>