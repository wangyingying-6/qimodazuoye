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
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/cn_utf8.js"></script>
<script type="text/javascript" src="js/calendar-setup.js"></script>
<script type="text/javascript">
	function delconfirm(){	
		return confirm("是否删除该记录");
	}
</script>
  </head>
  
  <body background="image/iframe.png">
  <div align="center" style="margin-top: 100px">
    <table border="1" width="800px" height="150px" align="center" background="image/pattern.png" cellspacing="0">
    <tr>
    	<td align="center" style="color: 679E22" bgcolor="FFCC99">评论编号</td>
    	<td align="center" style="color: 00A2E8">客房编号</td>
    	<td align="center" style="color: 679E22" bgcolor="FFCC99">房间类型</td>
    	<td align="center" style="color: 00A2E8">评价内容</td>
    	<td align="center" style="color: 679E22" bgcolor="FFCC99">评价时间</td>
    	<td align="center" style="color: 00A2E8">更改评论</td>
    	<td align="center" style="color: 679E22" bgcolor="FFCC99">删除评论</td>
    </tr>
    <s:iterator value="comments" id="m">
    <tr>
    	<td><s:property value="#m.cmid"/></td>
    	<td><s:property value="#m.rid"/></td>
    	<td><s:property value="#m.sname"/></td>
    	<td><s:property value="#m.cdesc"/></td>
    	<td><s:property value="#m.ctime"/></td>
    	<td><a href="comment/selectcommentbycmid.action?comment.cmid=<s:property value="#m.cmid"/>">更改评论</a></td>
    	<td><a href="comment/deletecomment.action?comment.cmid=<s:property value="#m.cmid"/>" onclick="return delconfirm()">删除评论</a></td>
    </tr>  
    </s:iterator>
    </table>
    <a href="javascript:history.back()">返回</a>
    </div>
  </body>
</html>
