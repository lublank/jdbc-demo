<%@page import="app.blank.biz.impl.MsgBizImpl"%>
<%@page import="app.blank.biz.MsgBiz"%>
<%@page import="app.blank.entity.Msg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String toUser = request.getParameter("toUser");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String username = (String)session.getAttribute("username");
	out.println("编码："+title);
	Msg msg = new Msg();
	msg.setTitle(title);
	msg.setSendto(toUser);
	msg.setMsgcontent(content);
	msg.setUsername(username);
	msg.setState(1);
	
	MsgBiz msgBiz = new MsgBizImpl();
	String message = msgBiz.addMsg(msg);
	
	if(message.equals("发送成功")){
		out.print("<script>alert('"+message+"');location.href='"+request.getContextPath()+"/message_list.jsp'</script>");
	}else{
		out.print("<script>alert('"+message+"');location.href='"+request.getContextPath()+"/message_add.jsp'</script>");
	}
%>
