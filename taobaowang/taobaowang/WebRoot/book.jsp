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
	<link rel="stylesheet" type="text/css" media="all" href="css/login.css"/>
<script type="text/javascript">
	function delconfirm(){	
		return confirm("是否移除该商品");
	}
</script>	

  </head>
  
  <body id="book">
  <s:if test="#session.userinfo==null">
 	 <a href="/MyWeb/userlogin.jsp">请登录</a>
  </s:if>
  <s:else>
   欢迎<s:property value="#session.userinfo.username"/>登录&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;<a href="">退出</a>
 <a href="javascript:history.back()">返回</a>
  </s:else>
  <a href="order/account.action?myorder.totalprice=<s:property value="totalPrice()"/>">结账</a>
    <table border="1" width="1500px" align="center" style="margin-top: 200px" id="biaoge5">
    <tr>
    	<td bgcolor="#FFCC99" align="center">预定编号</td>
    	<td bgcolor="#FFCC99" align="center">用户编号</td>
    	<td bgcolor="#FFCC99" align="center">客房编号</td>
    	<td bgcolor="#FFCC99" align="center">房间价格</td>
    	<td bgcolor="#FFCC99" align="center">入住时间</td>
    	<td bgcolor="#FFCC99" align="center">退房时间</td>
    	<td bgcolor="#FFCC99" align="center">移除预定订单</td>
    	<td bgcolor="#FFCC99" align="center">更新预定订单</td>
    </tr>
    <s:iterator value="books" id="b">
    <tr>
    	<td align="center"><s:property value="#b.bid"/></td>
    	<td align="center"><s:property value="#b.user.userid"/></td>
    	<td align="center"><s:property value="#b.room.rid"/></td>
    	<td align="center"><s:property value="#b.room.rprice"/></td>
    	<td align="center"><s:property value="#b.starttime"/></td>
    	<td align="center"><s:property value="#b.endtime"/></td>
    	<td align="center"><a href="<%=basePath%>book/removeroomfrombook.action?book.room.rid=<s:property value="#b.room.rid"/>&book.user.userid=<s:property value="#b.user.userid"/>" onclick="return delconfirm()">移除预定订单</a></td>
    	<td align="center"><a href="<%=basePath%>book/selectBookByRidandUserid.action?book.room.rid=<s:property value="#b.room.rid"/>">更新预定订单</a></td>
    </tr>  
    </s:iterator>
    </table>
   	商品总价为:<s:property value="totalPrice()"/>元<br/>
    
  </body>
</html>
