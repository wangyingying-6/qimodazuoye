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
	<link rel="stylesheet" type="text/css" href="css/login.css">
  </head>
  
  <body id="orderdetail">
  <s:if test="#session.userinfo==null">
 	 <a href="/MyHotel/userLogin.jsp">请登录</a>
  </s:if>
  <s:else>
   欢迎<s:property value="#session.userinfo.username"/>登录
 &nbsp;&nbsp;<a href="">退出</a>
  </s:else>
    <table border="1" width="1000px" align="center" style="margin-top: 200px;" id="biaoge8">
    <tr>
    	<td align="center">订单项编号</td>
    	<td align="center">房间编号</td>
    	<td align="center">房间单价</td>
    	<td align="center">类型名称</td>
    </tr>
    <s:iterator value="details" id="p">
    <tr>
    	<td align="center"><s:property value="#p.odid"/></td>
    	<td align="center"><s:property value="#p.room.rid"/></td>
    	<td align="center"><s:property value="#p.room.rprice"/></td>
    	<td align="center"><s:property value="#p.room.sname"/></td>
    	 
    </tr>  
    </s:iterator>
    </table>
  </body>
</html>
