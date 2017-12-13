<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showalluser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body background="image/iframe.png">
  <div align="center" style="margin-top: 100px">
   <font size="25px" color="#FFC90E">欢迎</font><font size="6px" color="#00A2E8"><s:property value="#session.userinfo.username"/></font><font size="25px" color="#FFC90E">登录</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="comment/preinsertcomment.action?user.userid=<s:property value="#session.userinfo.userid"/>">添加评论</a>&nbsp;&nbsp;&nbsp;<a href="comment/mycomments.action">我的评论</a>
 &nbsp;&nbsp;<a href="user/userlogoff.action">退出</a>
    <table border="1" width="800px" height="350px" background="image/pattern.png" cellspacing="0">
    <tr bgcolor="FFCC99">
    	<td align="center" style="color: 679E22">类型名称</td>
    	<td align="center" style="color: 679E22">评价内容</td>
    	<td align="center" style="color: 679E22">评价时间</td>
    	<td align="center" style="color: 679E22">用户id</td>
    </tr>
    <s:iterator value="comments" id="c">
    <tr>
    	<td><s:property value="#c.sname"/></td>
    	<td><s:property value="#c.cdesc"/></td>
    	<td><s:property value="#c.ctime"/></td>
    	<td><input type="text" value="<s:property value="#c.user.userid"/>" readonly="readonly"/></td>
    </tr>  
    </s:iterator>
    </table>
    <a href="javascript:history.back()">返回</a>
    </div>
  </body>
</html>
