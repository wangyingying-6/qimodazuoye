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
	<script type="text/javascript">
	   function hiddenid(){
	       u=document.getElementById("uid");
	       c=document.getElementById("che");
	       if(c.checked){
	             u.value="";
	       } 
	   }
	
	</script>
  </head>
  <body background="image/iframe.png">
  <img src="image/7.png">
  <div align="center">
	  <form action="comment/insertcomment.action" method="post" enctype="multipart/form-data">
		  <table border="0" width="500px" height="300px" align="center" background="image/pattern.png">
			  <tr>
			  	<td style="color: 679E22;font-size: 20px">客房编号</td>
			  	<td><s:textfield name="comment.rid" theme="simple"></s:textfield></td>
			  </tr>
			   <tr>
			  	<td style="color: 00A2E8;font-size: 20px">房间类型</td>
			  	<td><s:select list="types" name="comment.sname" listKey="sname" listValue="sname"></s:select></td>
			  </tr>
			  <tr>
			  	<td style="color: 679E22;font-size: 20px">用户id</td>
			  	<td><input type="text" name="comment.user.userid" id="uid" value="<s:property value="#session.userinfo.userid"/>"/></td>
			  </tr>
			   <tr>
			  	<td style="color: 00A2E8;font-size: 20px">评价内容</td>
			  	<td><s:textarea name="comment.cdesc"></s:textarea></td>
			  </tr> 
			  <tr>
			  	<td style="color: 679E22;font-size: 20px">评论编号</td>
			  	<td><s:textfield name="comment.cmid" theme="simple" readonly="true"></s:textfield></td>
			  </tr>  
			  <tr>
			  	<td style="color: 00A2E8;font-size: 20px"><s:checkbox id="che" name="anonym" value="匿名评论" onclick="hiddenid()">匿名评论</s:checkbox></td>
			  </tr>
			  <tr>
			  	<td><input type="submit" value="添加"/></td>
			  	<td><input type="reset" value="重置"/></td>			  	
			  </tr>
		  </table>
	  </form>
	  <a href="javascript:history.back()">返回</a>
	  <s:fielderror></s:fielderror>
	  </div>
  </body>
</html>
