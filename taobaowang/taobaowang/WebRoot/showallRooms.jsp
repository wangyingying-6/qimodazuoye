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
		return confirm("是否删除该记录");
	}
</script>	

  </head>
  
  <body background="image/iframe.png">
  <div align="center" style="margin-top: 100px">
    <table border="1" width="800px" height="250px" background="image/pattern.png" cellspacing="0">
    <tr>
    	<td align="center" style="color: 00A2E8">客房编号</td>
    	<td align="center" style="color: 679E22" bgcolor="FFCC99">类型名称</td>
    	<td align="center" style="color: 00A2E8">客房状态</td>
    	<td align="center" style="color: 679E22" bgcolor="FFCC99">客房价格</td>
    	<td align="center" style="color: 00A2E8">更新</td>
    	<td align="center" style="color: 679E22" bgcolor="FFCC99">删除</td>
    </tr>
    <s:iterator value="rooms" id="r">
    <tr>
    	<td><s:property value="#r.rid"/></td>
    	<td><s:property value="#r.sname"/></td>
    	<td><s:if test="%{#r.rstatus==1}">可用</s:if><s:else>不可用</s:else></td>
    	<td><s:property value="#r.rprice"/></td>
    	<td><a href="room/selectroombyrid.action?room.rid=<s:property value="#r.rid"/>">更新</a></td>
    	<td><a href="room/deleteroom.action?room.rid=<s:property value="#r.rid"/>" onclick="return delconfirm()">删除</a></td>
    </tr>  
    </s:iterator>
    </table>
    <a href="javascript:history.back()">返回</a>
    </div>
  </body>
</html>
