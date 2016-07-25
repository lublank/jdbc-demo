<%@page import="app.blank.entity.Userinfo"%>
<%@page import="app.blank.biz.UserinfoBiz"%>
<%@page import="app.blank.biz.impl.UserinfoBizImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	Userinfo uinfo = new Userinfo();
	uinfo.setUsername(username);
	uinfo.setPassword(pwd);
	uinfo.setEmail(email);
	
	UserinfoBiz userinfoBiz = new UserinfoBizImpl();
	String message = userinfoBiz.register(uinfo);
	
	if(message.equals("添加成功")){
		out.print("<script>alert('"+message+"');location.href='"+request.getContextPath()+"/login.jsp'</script>");
	}else{
		out.print("<script>alert('"+message+"');location.href='"+request.getContextPath()+"/register.jsp'</script>");
	}
	
%>
