<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>17商城</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
</head>
<body style=" background:#FFF;">
 <div class="loginLogo">
  <div class="logoMid">
   <h1 class="logo" style="height:71px;padding-top:10px;"><a href="${pageContext.request.contextPath }/user_index"><img src="images/loginLogo.jpg" width="241" height="71" /></a></h1>
   <div class="loginReg">
    还没有会员账号?&nbsp;<a href="${pageContext.request.contextPath }/user_reg">免费注册</a>
   </div><!--loginReg/-->
  </div><!--logoMid/-->
 </div><!--loginLogo/-->
 <div class="loginBox">
  <div class="loginLeft">
   <img src="images/logoinimg.jpg" width="716" height="376" />
  </div><!--loginLeft/-->
  <form action="${pageContext.request.contextPath }/user_vip" method="post" class="loginRight">
   <h2>会员登录</h2>
   <h3>用户名</h3>
   <input type="text" class="name" name="logInName" id="logInName"/>
   <h3>密码</h3>
   <input type="password" class="pwd" name="password"/>
   <div class="zhuangtai">
    <input type="checkbox" checked="checked" /> 下次自动登录
   </div><!--zhuangtai/-->
   <div class="subs">
    <input type="image" src="images/sub.jpg" class="submit" />
   </div>
  </form><!--loginRight/-->
  <div class="clears"></div>
 </div><!--loginBox/-->
</body>
<script type="text/javascript">
$("#logInName").blur(a);
function a() {
	var logInName=$("#logInName").val();
	var param={"logInName":logInName};
	$.post("${pageContext.request.contextPath }/user_checklogInName",param,function(returnData){
		if(returnData.NotFindAccount !=null)
		 alert(returnData.NotFindAccount);
	});
}
</script>
</html>