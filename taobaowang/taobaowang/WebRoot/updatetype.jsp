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
	<link rel="stylesheet" type="text/css" media="all" href="css/login.css"/>
<style type="text/css">
.errorMessage{list-style-type:none;color: red;}
</style>
  </head>
  <body id="updatetype">
  <a href="javascript:history.back()">返回</a>
	  <form action="type/updatetype.action" method="post" enctype="multipart/form-data">
		  <table border="1" width="400" align="center" style="margin-top: 200px" id="biaoge3">
			  <tr>
			  	<td bgcolor="#FFCC99">类型编号</td>
			  	<td bgcolor="#F8E6C0"><s:textfield name="type.sid" theme="simple" readonly="true"></s:textfield></td>
			  </tr>
			   <tr>
			  	<td bgcolor="#FFCC99">类型名</td>
			  	<td bgcolor="#F8E6C0"><s:textfield  name="type.sname" ></s:textfield></td>
			  </tr>  
			   <tr>
			  	<td bgcolor="#FFCC99">房间数量</td>
			  	<td bgcolor="#F8E6C0"><s:textfield  name="type.totalnum" ></s:textfield> </td>
			  </tr>
			   <tr>
			  	<td bgcolor="#FFCC99">商品描述</td>
			  	<td bgcolor="#F8E6C0"><s:textarea name="type.sdesc" cols="20" rows="5" ></s:textarea>
			  	</td>			  	
			  </tr>
			   <tr>
			  	<td bgcolor="#FFCC99">商品图片</td>
			  	<td bgcolor="#F8E6C0"><s:file name="type.uploadImage" ></s:file></td>
			  </tr> 
			  
			  <tr>
			  	<td bgcolor="#FFCC99"><input type="submit" value="更新"/></td>
			  	<td bgcolor="#F8E6C0"><input type="reset" value="重置"/></td>			  	
			  </tr>
		  </table>
	  </form>
	  
	  <s:fielderror></s:fielderror>
  </body>
</html>
