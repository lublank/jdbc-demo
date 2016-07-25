<%@page import="app.blank.biz.impl.MsgBizImpl"%>
<%@page import="app.blank.biz.MsgBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	int msgid = Integer.valueOf(request.getParameter("msgid"));

	MsgBiz msgBiz = new MsgBizImpl();
	int success = msgBiz.delete(msgid);
	if(success>0){
		out.print("<script>alert('删除成功！');location.href='"+request.getContextPath()+"/message_list.jsp'</script>");
	}else{
		out.print("<script>alert('删除失败！');location.href='"+request.getContextPath()+"/message_list.jsp'</script>");
	}
%>
