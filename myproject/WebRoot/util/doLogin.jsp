<%@page import="app.blank.entity.Userinfo"%>
<%@page import="app.blank.biz.UserinfoBiz"%>
<%@page import="app.blank.biz.impl.UserinfoBizImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String pwd = request.getParameter("pwd");
	
	UserinfoBiz userinfoBiz = new UserinfoBizImpl();
	Userinfo admin = userinfoBiz.login(username, pwd);
	if(null == admin){
		out.print("<script>alert('用户名或密码错误！');location.href='"+request.getContextPath()+"/login.jsp'</script>");
	}else{
		session.setAttribute("username", username);
		response.sendRedirect(request.getContextPath() + "/message_list.jsp");
	}
%>
