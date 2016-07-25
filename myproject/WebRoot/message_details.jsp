<%@page import="app.blank.entity.Msg"%>
<%@page import="app.blank.biz.impl.MsgBizImpl"%>
<%@page import="app.blank.biz.MsgBiz"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	if(session.getAttribute("username")==null){
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
	int msgid = Integer.valueOf(request.getParameter("msgid"));
  request.setCharacterEncoding("utf-8");
	MsgBiz msgBiz = new MsgBizImpl();
	Msg msgList = msgBiz.getMsgInfo(msgid);

	if(msgList.getState()!=0){
		msgBiz.changeState(msgid);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>发送短消息</title>
	<link type="text/css" rel="stylesheet" href="css/sms.css" />
</head>
<body>
<div id="main">
	<div class="mainbox">
		<div class="title myMessage png"></div>
		<%@ include  file="menu.jsp"%>
		<div class="content messageList">
			<table>
				<tr><td>标题：</td><td><%=msgList.getTitle() %></td></tr>
				<tr><td>发送者：</td><td><%=msgList.getUsername() %></td></tr>
				<tr><td>发送时间：</td><td><%=msgList.getCreate_date() %></td></tr>
				<tr><td>内容：</td><td><%=msgList.getMsgcontent() %></td></tr>
			</table>
			<a href="message_add.jsp?username=<%=msgList.getUsername() %>"><input type="button" value="回复" /></a>
		</div>
	</div>
</div>
</body>
</html>