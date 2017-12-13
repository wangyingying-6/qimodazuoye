
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
    
    <title>My JSP 'showallRoomsforguest.jsp' starting page</title>
    
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
		return confirm("是否删除该记录");
	}
</script>	

  </head>
  
  <body id="showallroomsforguest">
   <a href="javascript:history.back()">返回</a>
  <div id="top">
   <s:if test="#session.userinfo==null">
 	 <a href="/MyHotel/userLogin.jsp">请登录</a> &nbsp;<a href="/MyHotel/UserRegister.jsp">请注册</a>
  </s:if>
  <s:else>
  <table border="1" id="table" bordercolor="#FF9900">
   	<tr>
   	<td align="center">欢迎<s:property value="#session.userinfo.username"/>登录 </td>
   	 <td align="center"><a href="book/getallbooks.action">我的预定</a></td>
   	 <td align="center"><a href="order/myorders.action">我的订单</a></td>
 	 <td align="center"><a href="">退出</a></td>

   </tr>
  </table>
    </s:else>
  </div>
    <table border="1" width="1000px" style="margin-top: 200px" align="center" bordercolor="#FF9900">
    <tr bgcolor="#FFCC99">
    	<td align="center">客房编号</td>
    	<td align="center">类型名称</td>
    	<td align="center">客房状态</td>
    	<td align="center">客房价格</td>
    	<td align="center">预定</td>
    </tr>
    <s:iterator value="rooms" id="r">
    <tr>
    	<td align="center"><s:property value="#r.rid"/></td>
    	<td align="center"><s:property value="#r.sname"/></td>
    	<td align="center"><s:if test="%{#r.rstatus==1}">可用</s:if><s:else>不可用</s:else></td>
    	<td align="center"><s:property value="#r.rprice"/></td>
    	<td align="center"><a href="book/preinsertbook.action?book.room.rid=<s:property value="#r.rid"/>">预定</a></td>
    </tr>  
    </s:iterator>
    </table>
   
  </body>
</html>
