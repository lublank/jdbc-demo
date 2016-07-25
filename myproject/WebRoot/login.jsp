<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>短消息平台</title>
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
    	return true;
    }
    </script>
</head>
<body>
	<div id="loginTitle" class="png"></div>
	<div id="loginForm" class="userForm png">
		<form action="util/doLogin.jsp" method="post" onsubmit="return checkInput()">
			<div id="error">&nbsp;</div>
			<dl>
				<dt>用户名：</dt>
				<dd><input type="text" name="username" id="username" /></dd>
				<dt>密　码：</dt>
				<dd><input type="password" name="pwd" id="pwd" /></dd>
			</dl>
			<div class="buttons">
				<input class="btn-login png" type="submit" name="submit" value=" " />
				<input class="btn-reg png" type="button" name="register" value=" " onclick="location='register.jsp'" />
			</div>		
		</form>
	</div>
</body>
</html>