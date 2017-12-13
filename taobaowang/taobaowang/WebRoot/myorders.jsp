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
   <link rel="stylesheet" type="text/css" media="all" href="css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
   <script type="text/javascript" src="js/calendar.js"></script>
   <script type="text/javascript" src="js/cn_utf8.js"></script>
   <script type="text/javascript" src="js/calendar-setup.js"></script>
  </head>
  
  <body id="myorders">
    <a href="javascript:history.back()">返回</a>
    <table border="1" width="1000px" align="center" style="margin-top: 200px;" id="biaoge7">
    <tr>
    	<td align="center">订单编号</td>
    	<td  align="center">订单总金额</td>
    	<td  align="center">用户姓名</td>
    	<td  align="center">积分</td>
    	<td  align="center">下单时间</td>
    	<td align="center">订单状态</td>
    	<td align="center">确认订单</td>
    	
    </tr>
    <s:iterator value="myorders" id="p">
    <tr>
    	<td align="center"><s:property value="#p.oid"/></td>
    	<td align="center"><s:property value="#p.totalprice"/></td>
    	<td align="center"><s:property value="session.userinfo.username"/></td>
    
    	<td align="center"><s:property value="#p.user.credit"/></td>
    	<td align="center"><s:property value="#p.otime"/></td>
    	<s:if test="#p.ostatus==1">
    		<td align="center">新订单</td>
    		<td>&nbsp;</td>
    	</s:if>
    	<s:else>
    		<td align="center">已处理</td>
    		<td>&nbsp;</td>
    	</s:else>
    </tr>	
    </s:iterator>
    </table>

    
   
  </body>
</html>
