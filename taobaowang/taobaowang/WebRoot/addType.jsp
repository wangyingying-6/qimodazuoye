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
<style type="text/css">
.errorMessage{list-style-type:none;color: red;}
</style>
 
  </head>
  <body background="image/iframe.png">
	 <form action="type/addtype.action" method="post" enctype="multipart/form-data">
		  <table border="1" width="400">
			  <tr>
			  	<td>类型编号</td>
			  	<td><s:textfield name="type.sid" theme="simple" readonly="true"></s:textfield></td>
			  </tr>
			   <tr>
			  	<td>类型名</td>
			  	<td><s:textfield  name="type.sname" id="sn" ></s:textfield></td>
			  </tr>  
			   <tr>
			  	<td>房间数量</td>
			  	<td> <s:textfield  name="type.totalnum" id="rn"></s:textfield></td>
			  </tr>
			  <tr>
			  	<td>房间描述</td>
			  	<td><s:textarea name="type.sdesc" cols="20" rows="5" id="rd"></s:textarea>
			  	</td>			  	
			  </tr>
			   <tr>
			  	<td>商品图片</td>
			  	<td><s:file name="type.uploadImage" ></s:file></td>
			  </tr> 
			  <tr>
			  	<td><input type="submit" value="更新" onclick="return check()"/></td>
			  	<td><input type="reset" value="重置"/></td>			  	
			  </tr>
		  </table>
	  </form>
	  <a href="javascript:history.back()">返回</a>
	  <s:fielderror></s:fielderror>
  </body>
</html>
