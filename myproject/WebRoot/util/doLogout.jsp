<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  //注销删除session并跳转登录页面
	//session.setAttribute("username", null);
	session.invalidate();
	
	response.sendRedirect(request.getContextPath() + "/login.jsp");
	
%>
