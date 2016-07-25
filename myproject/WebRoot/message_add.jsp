<%@page import="app.blank.biz.impl.UserinfoBizImpl"%>
<%@page import="app.blank.biz.UserinfoBiz"%>
<%@page import="app.blank.entity.Userinfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
	String sendUser = request.getParameter("username")==null?"":request.getParameter("username");;
	UserinfoBiz userBiz = new UserinfoBizImpl();
	List<Userinfo> userList = userBiz.getAll();
%>
<!DOCTYPE html>
<html>
<head>
	<title>发送短消息</title>	    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="css/sms.css" />
	    <script type="text/javascript">
    function checkInput(){
    	var title = document.getElementById("title");
    	if(title.value==""){
    		alert("标题不能为空！");
    		title.focus();
    		return false;
    	}
    	var content = document.getElementById("content");
    	if(content.value==""){
    		alert("内容不能为空！");
    		content.focus();
    		return false;
    	}
    	return true;
    }
    </script>
</head>
<body>
	<form action="util/doAddMsg.jsp" method="post" onsubmit="return checkInput()">
	<div id="main">
		<div class="mainbox">
		<%@ include  file="menu.jsp"%>
			<div class="content">
				<div class="message">
					<div class="tmenu">
						<ul class="clearfix">
							<li>
								发送给：
								<%
									if("".equals(sendUser)){
								%>
								<select name="toUser">
								<%
									for(int i=0; i<userList.size(); i++){
										if(!userList.get(i).getUsername().equals((String)session.getAttribute("username"))){
								%>
				  	 				<option value="<%=userList.get(i).getUsername()%>"><%=userList.get(i).getUsername()%></option>
				  	 		<%}} %>
						  	 	</select>
						  	<%
									}else{
						  		out.print(sendUser);
									out.print("<input type='hidden' name='tuUser' value='"+sendUser+"'/>");
						  	}
								%>
								标题：<input type="text" name="title" id="title"/>
							</li>
						</ul>
					</div>
					<div class="view">
						<textarea name="content" id="content"></textarea>
						<div class="send"><input type="submit" name="submit" value=" " /></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>