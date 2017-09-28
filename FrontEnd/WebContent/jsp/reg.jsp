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
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<!-- <script type="text/javascript" src="js/reg.js"></script> -->
</head>
<body style="background: #FFF;">
	<div class="loginLogo">
		<div class="logoMid">
			<h1 class="logo" style="height: 71px; padding-top: 10px;">
				<a href="${pageContext.request.contextPath }/user_index"><img
					src="images/loginLogo.jpg" width="241" height="71" /></a>
			</h1>
			<div class="loginReg">
				还没有会员账号?&nbsp;<a
					href="${pageContext.request.contextPath }/user_Login">登录</a>
			</div>
			<!--loginReg/-->
		</div>
		<!--logoMid/-->
	</div>
	<!--loginLogo/-->
	<div class="loginBox">
		<img src="images/chengnuo.jpg" width="295" height="393"
			class="chengnuo" />
		<form action="${pageContext.request.contextPath }/user_check"
			method="post" class="reg">
			<div class="regList">
				<label><span class="red">*</span> 账户名</label> <input type="text"
					id="logInName" name="logInName"/> <span style="color: #999;">请输入邮箱/用户名/手机号</span>
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="red">*</span> 请设置密码</label> <input
					type="password" id="pass1" />
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="password">*</span> 请确认密码</label> <input
					type="password" id="pass2" name="password"/>
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="red">*</span> 验证码</label> <input type="text"
					class="yanzheng" /><img src="images/yanzheng.jpg" width="103"
					height="38" />
			</div>
			<!--regList/-->
			<div class="xieyi">
				<input type="checkbox" id="regxieyi" /> 我已经阅读并同意<a href="#">《17用户注册协议》</a>
			</div>
			<!--xieyi/-->
			<div class="reg">
				<input type="image" src="images/reg.jpg" width="284" height="34"
					id="submit" onclick="return aaa();" />
			</div>
			<!--reg/-->
		</form>
		<!--reg/-->
		<div class="clears"></div>
	</div>
	<!--loginBox/-->
</body>
<script type="text/javascript">
$("#logInName").blur(a);
function a() {
	var logInName=$("#logInName").val();
	var param={"logInName":logInName};
	$.post("${pageContext.request.contextPath }/user_checklogInName",param,function(returnData){
		if(returnData.TheSameName !=null)
		alert(returnData.TheSameName);
	});
}
function aaa() {
	var name =document.getElementById("logInName").value;
	var pwd1 = document.getElementById("pass1").value;
	var pwd2 = document.getElementById("pass2").value;
	var checkb = document.getElementById("regxieyi").checked;
	
    var namelen = name.length;
	var pwdlen = pwd1.length;
	var flag=false;
    if((namelen < 3) || (namelen > 10)){
            alert("用户名长度在3-10之间，请重新输入！")
		    return flag;
            }
	
	if((pwdlen < 6) || (pwdlen > 14)){
            alert("你输入的密码格式不正确，请重新输入！")
		    return flag;
            }
	
	if((pwd1!==pwd2)||(pwd1<1)){
		alert("两次输入的密码不一样,请重新输入");
		return flag;
		}
	
	if(!checkb){
		alert("你必须同意协议才能注册！")
		return flag;
	}
}</script>
</html>