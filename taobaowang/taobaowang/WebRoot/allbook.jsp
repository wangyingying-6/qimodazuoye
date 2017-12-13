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
<script type="text/javascript">
	function delconfirm(){	
		return confirm("是否移除该商品");
	}
</script>	

  </head>
  
  <body>
  <s:if test="#session.userinfo==null">
 	 <a href="/MyHotel/userLogin.jsp">请登录</a>
  </s:if>
  <s:else>
   欢迎<s:property value="#session.userinfo.username"/>登录&nbsp;&nbsp;&nbsp;</a>
 &nbsp;&nbsp;<a href="">退出</a>
  </s:else>
    <s:debug></s:debug>
    <table border="1" width="1500px">
    <tr>
    	<td>预定编号</td>
    	<td>用户编号</td>
    	<td>客房编号</td>
    	<td>订单状态</td>
    	<td>入住时间</td>
    	<td>退房时间</td>
    	<td>移除预定订单</td>
    </tr>
    <s:iterator value="allbooks" id="d">
    <tr>
    	<td><s:property value="#d.bid"/></td>
    	<td><s:property value="#d.user.userid"/></td>
    	<td><s:property value="#d.room.rid"/></td>
    	<td><s:property value="#d.bstatus"/></td>
    	<td><s:property value="#d.starttime"/></td>
    	<td><s:property value="#d.endtime"/></td>
    	<td><a href="<%=basePath%>book/removeroomfrombook.action?book.room.rid=<s:property value="#d.room.rid"/>&book.user.userid=<s:property value="#d.user.userid"/>" onclick="return delconfirm()">移除预定订单</a></td>
    </tr>  
    </s:iterator>
    </table>
    商品总价为：<s:property value="totalPrice()"/>元 &nbsp;<br/>
    <a href="/MyWeb/index.jsp">返回</a>
    
  </body>
</html>
