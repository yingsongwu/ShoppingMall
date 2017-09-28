<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
     <li class="navCur"><a href="${pageContext.request.contextPath }/user_help">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  <div class="positions">
   当前位置：<a href="${pageContext.request.contextPath }/user_index">首页</a> &gt; <a href="${pageContext.request.contextPath }/car_showGoodsOnCar" class="posCur">购物车</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="carImg"><img src="images/car1.jpg" width="951" height="27" /></div>
   <table class="orderList">
    <tr>
     <th width="20"></th>
     <th width="430">商品</th>
     <th width="135">单价</th>
     <th width="135">数量</th>
     <th width="135">总金额</th>
     <th>操作</th>
    </tr>
    <c:forEach items="${requestScope.shoppingCarList }" var="shoppingCarList">
    <tr>
     <td><input type="checkbox" /></td>
     <td>
      <dl>
       <dt><a href="${pageContext.request.contextPath }/goods_proinfo1?goodsName=${shoppingCarList.goodsCar.goodsName }"><img src="${shoppingCarList.goodsCar.imageUrl }" width="85" height="85" /></a></dt>
       <dd>${shoppingCarList.goodsCar.goodsName }<br /><span class="red"><c:choose><c:when test="${shoppingCarList.goodsCar.store > 0 }">有货： </c:when><c:otherwise>无货： </c:otherwise></c:choose></span>从${shoppingCarList.goodsCar.goodsAddress }出发</dd>
       <div class="clears"></div>
      </dl>
     </td>
     <td><strong class="red">￥${shoppingCarList.goodsCar.price }</strong></td>
     <td>
     <div class="jia_jian">
      <img src="images/jian.jpg" width="21" height="25" class="jian" id="jian${shoppingCarList.carGoodsId }" onclick="jian(${shoppingCarList.carGoodsId });"/>
      <input type="hidden" value="${shoppingCarList.goodsNum }" id="num1${shoppingCarList.carGoodsId }"/>
      <input type="text" class="shuliang" value="${shoppingCarList.goodsNum }" id="num${shoppingCarList.carGoodsId }" onchange="wen(${shoppingCarList.carGoodsId })"/>
      <img src="images/jia.jpg" width="21" height="25" class="jia" id="jia${shoppingCarList.carGoodsId }" onclick="jia(${shoppingCarList.carGoodsId })"/>
     </div>
     </td>
     <td><strong class="red" id="amount">￥${shoppingCarList.amount }</strong></td>
     <td><a href="#" class="green">收藏</a><br /><a href="${pageContext.request.contextPath }/car_deleteGoods?carGoodsId=${shoppingCarList.carGoodsId }" class="green">删除</a></td>
    </tr>
    </c:forEach>
    <%-- <tr>
     <td><input type="checkbox" /></td>
     <td>
      <dl>
       <dt><a href="proinfo.html"><img src="images/pro1.jpg" width="85" height="85" /></a></dt>
       <dd>全球最大的中文搜索引擎、致力于让网民更便捷<br /><span class="red">有货：</span>从上海出发</dd>
       <div class="clears"></div>
      </dl>
     </td>
     <td><strong class="red">￥70.20</strong></td>
     <td>
     <div class="jia_jian">
      <img src="images/jian.jpg" width="21" height="25" class="jian" />
      <input type="text" class="shuliang" value="1" />
      <img src="images/jia.jpg" width="21" height="25" class="jia" />
     </div>
     </td>
     <td><strong class="red">￥70.20</strong></td>
     <td><a href="#" class="green">收藏</a><br /><a href="#" class="green">删除</a></td>
    </tr> --%>
    
    <tr>
     <td colspan="6"><div class="shanchu"><a href="${pageContext.request.contextPath }/car_deleteAllGoods" class="green"><img src="images/lajio.jpg" /> 全部删除</a></div></td>
    </tr>
   </table><!--orderList/-->
   <div class="zongji">
    总计(不含运费)：<strong class="red" id="sum">￥${requestScope.sum }</strong>
   </div><!--zongji/-->
   <div class="jiesuan">
    <a href="${pageContext.request.contextPath }/goods_goodsToType?type=1" class="jie_1">继续购物&gt;&gt;</a>
    <a href="order2.html" class="jie_2">立即结算&gt;&gt;</a>
    <div class="clears"></div>
   </div><!--jiesuan/-->
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
	function jian(carGoodsId) {
		var oldnum=document.getElementById("num"+carGoodsId).value;
		if(oldnum-1>0){
			var newnum=oldnum-1;
			param={"oldnum":oldnum,"newnum":newnum,"carGoodsId":carGoodsId};
			location.href="${pageContext.request.contextPath }/car_addOrDeleteGoods?oldnum="+oldnum+"&newnum="+newnum+"&carGoodsId="+carGoodsId;
			/* $.post("${pageContext.request.contextPath }/car_addOrDeleteGoods",param,function(returnData){
				//alert(returnData);
			}); */
		}else{
			alert("数量不能小于1!");
		}
	}
	function jia(carGoodsId) {
		var oldnum=document.getElementById("num"+carGoodsId).value;
			var newnum=parseInt(oldnum)+1;
			param={"oldnum":oldnum,"newnum":newnum,"carGoodsId":carGoodsId};
			location.href="${pageContext.request.contextPath }/car_addOrDeleteGoods?oldnum="+oldnum+"&newnum="+newnum+"&carGoodsId="+carGoodsId;
			/* $.post("${pageContext.request.contextPath }/car_addOrDeleteGoods",param,function(returnData){
				//alert(returnData);
			}); */
	}
	function wen(carGoodsId) {
		var oldnum=document.getElementById("num1"+carGoodsId).value;
		var newnum=document.getElementById("num"+carGoodsId).value;
		param={"oldnum":oldnum,"newnum":newnum,"carGoodsId":carGoodsId};
		location.href="${pageContext.request.contextPath }/car_addOrDeleteGoods?oldnum="+oldnum+"&newnum="+newnum+"&carGoodsId="+carGoodsId;
	}
	
	
</script>
</html>