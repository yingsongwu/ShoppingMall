<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台登陆</title>

<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>

<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js"></script>
<script src="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  /* createCode(); */
  //测试提交，对接程序删除即可
  
});
</script>
</head>
<body>

<form action="${pageContext.request.contextPath }/user_login" method="post">
	<dl class="admin_login">
	 	<dt>
	  		<strong>站点后台管理系统</strong>
	  		<em>Management System</em>
	 	</dt>
	 	<dd class="user_icon">
	  		<input type="text" placeholder="账号" class="login_txtbx" name="logInName" id="logInName"/>
	 	</dd>
		<dd class="pwd_icon">
	  		<input type="password" placeholder="密码" class="login_txtbx" name="password"/>
	 	</dd>
	 	<!-- <dd class="val_icon">
		  	<div class="checkcode">
		    	<input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
		    	<canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
		  	</div>
	  		<input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
	 	</dd> -->
	 	<dd>
	  		<input type="submit" value="立即登录" class="submit_btn"/>
		 </dd>
	 	<dd>
	  		<p>© 2015-2016 DeathGhost 版权所有</p>
	  		<p>陕B2-20080224-1</p>
	 	</dd>
	</dl>
</form>
</body>

<script type="text/javascript">
$("#logInName").blur(a);
function a() {
	var logInName=$("#logInName").val();
	var param={"logInName":logInName};
	$.post("${pageContext.request.contextPath }/user_checkLoginName",param,function(returnData){
		if(returnData.NotFindAccount !=null)
		 	alert(returnData.NotFindAccount);
	});
}
</script>

</html>
