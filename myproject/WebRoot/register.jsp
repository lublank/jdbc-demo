<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线短信平台</title>
	<link type="text/css" rel="stylesheet" href="css/sms.css" />
    <script type="text/javascript">
    function checkInput(){
    	var username = document.getElementById("username");
    	if(username.value==""){
    		alert("用户名不能为空！");
    		username.focus();
    		return false;
    	}
    	var pwd = document.getElementById("pwd");
    	if(pwd.value==""){
    		alert("密码不能为空！");
    		pwd.focus();
    		return false;
    	}
    	var email = document.getElementById("email");
    	if(email.value==""){
    		alert("邮箱不能为空！");
    		email.focus();
    		return false;
    	}
    	var affim = document.getElementById("affim");
    	if(affim.value==""){
    		alert("确认密码不能为空！");
    		affim.focus();
    		return false;
    	}
    	if(pwd.value==affim.value){
    		alert("确认密码不正确！");
    		affim.focus();
    		return false;
    	}
    	return true;
    }
    </script>
</head>
<body>
	<div id="regTitle" class="png"></div>
	<div id="regForm" class="userForm png">
		<form action="util/doRegister.jsp" method="post" onsubmit="return checkInput()">
			<dl>
				<dt>用 户 名：</dt>
				<dd><input type="text" name="username" id="username" /></dd>
				<dt>密　　码：</dt>
				<dd><input type="password" name="pwd" id="pwd" /></dd>
				<dt>确认密码：</dt>
				<dd><input type="password" name="affirm" id="affirm" /></dd>
				<dt>邮　　箱：</dt>
				<dd><input type="text" name="email" id="email" /></dd>
			</dl>
			<div class="buttons">
				<input class="btn-reg png" type="submit" name="register" value=" " />
				<input class="btn-reset png" type="reset" name="reset" value=" " />
			</div>
			<div class="goback"><a href="login.jsp" class="png">返回登录页</a></div>
		</form>
	</div>
</body>
</html>