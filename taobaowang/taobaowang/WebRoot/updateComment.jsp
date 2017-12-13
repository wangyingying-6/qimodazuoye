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
    
    <title>My JSP 'insertUser.jsp' starting page</title>
    
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
  <div align="center">
	  <form action="comment/updatecomment.action" method="post" enctype="multipart/form-data">
		  <table border="0" width="500px" height="300px" align="center" style="margin-top: 100px" background="image/pattern.png">
			  <tr>
			  	<td style="color: 679E22;font-size: 20px">评论编号</td>
			  	<td><s:textfield name="comment.cmid" theme="simple" readonly="true"></s:textfield></td>
			  </tr>
			  <tr>
			  	<td style="color: 00A2E8;font-size: 20px">客房编号</td>
			  	<td><s:textfield name="comment.rid" theme="simple" readonly="true"></s:textfield></td>
			  </tr>
			   <tr>
			  	<td style="color: 679E22;font-size: 20px">房间类型</td>
			  	<td><s:select list="types" name="comment.sname" listKey="sname" listValue="sname"></s:select></td>
			  </tr>  
			   <tr>
			  	<td style="color: 00A2E8;font-size: 20px">评价内容</td>
			  	<td><s:textarea name="comment.cdesc"></s:textarea></td>
			  </tr> 
			  <tr>
			  	<td><input type="submit" value="更改评论"/></td>
			  	<td><input type="reset" value="重置"/></td>			  	
			  </tr>
		  </table>
	  </form>
	  <a href="javascript:history.back()">返回</a>
	  <s:fielderror></s:fielderror>
	  </div>
  </body>
</html>
