<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
		<div class="menu">
			<span>当前用户：<a href="message_list.jsp"><%=session.getAttribute("username") %></a></span>
			<span><a href="message_add.jsp">发短消息</a></span>
			<span><a href="util/doLogout.jsp">退出</a></span>
		</div>