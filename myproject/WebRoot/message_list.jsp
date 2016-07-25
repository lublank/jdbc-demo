<%@page import="app.blank.entity.Msg"%>
<%@page import="java.util.List"%>
<%@page import="app.blank.biz.impl.MsgBizImpl"%>
<%@page import="app.blank.biz.MsgBiz"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	if(session.getAttribute("username")==null){
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
  request.setCharacterEncoding("utf-8");
	MsgBiz msgBiz = new MsgBizImpl();
	List<Msg> msgList = msgBiz.msgList((String)session.getAttribute("username"));

%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>    
	<title>短消息列表</title>	    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="no-cache" />
	<link type="text/css" rel="stylesheet" href="css/sms.css" />
</head>
<body>
<div id="main">
	<div class="mainbox">
		<div class="title myMessage png"></div>
		<%@ include  file="menu.jsp"%>
		<div class="content messageList">
			<ul>
			<%
			for(int i=0; i<msgList.size(); i++){
				String check = msgList.get(i).getState()==1?"unReaded":"";
			
			%>
	 			<li class="<%=check %>">
	  	 			<em><%=msgList.get(i).getCreate_date() %></em>
	  	 			<em><a href="message_add.jsp?username=<%=msgList.get(i).getUsername() %>">回信</a></em>
					<em><a href="util/doDelete.jsp?msgid=<%=msgList.get(i).getMsgid() %>">删除</a></em>
					<p>
					<strong><a href="message_details.jsp?msgid=<%=msgList.get(i).getMsgid() %>"><%=msgList.get(i).getTitle() %></a></strong>
					<%=msgList.get(i).getMsgcontent() %>
				</li>
			<%
			}
			%>
		  	 </ul>
		</div>
	</div>
</div>
</body>
</html>