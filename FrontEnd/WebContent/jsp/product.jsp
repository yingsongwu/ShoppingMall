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
   当前位置：<a href="${pageContext.request.contextPath }/user_index">首页</a> &gt; <a href="${pageContext.request.contextPath }/goods_product" class="posCur">促销商品</a>
  </div><!--positions/-->
  <div class="cont">
  <div class="jilu">
    总计 <span>${requestScope.size }</span> 个记录
   </div><!--jilu/-->
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
   <div class="contRight">
    <div class="frProList">
    <c:forEach items="${requestScope.goodList }" var="goods">
    <dl>
      <dt><a href="${pageContext.request.contextPath }/goods_proinfo?type=${goods.type }&goodsId=${goods.goodsId}"><img src="${goods.imageUrl }" width="132" height="129" /></a></dt>
      <dd>${goods.goodsName }</dd>
      <dd class="cheng">￥${goods.price }/<s:property value="#goods.unit"/> <span>￥${goods.originalPrice }</span></dd>
     </dl>
    </c:forEach>
      <div class="clears"></div>
     </div><!--frProList-->
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
</html>