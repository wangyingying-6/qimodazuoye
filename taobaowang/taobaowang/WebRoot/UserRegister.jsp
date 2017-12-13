<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript">
  	function checkname(){
  		u=document.getElementById("uname");
  		uid=document.getElementById("uid");
  		if(u.value==""){
  			alert("请输入用户名");
  		}else{
  			//提交一个请求
  			location.href="registercheckname.action?user.userid="+uid.value+"&user.username="+u.value;
  		}
  	}
  </script>
  </head>
  
  <body background="image/lg.png">
    <div align="center"><font size="20" >快速注册</font></div>
	<form action="user/userregister.action" method="post">
	<table align="center" style="margin-top: 200px" width="500px" height="300px">
		 		<tr>
		  		<td style="font-size: 20px">用户编号</td>
		  		<td><s:textfield id="uid" name="user.userid" theme="simple" readonly="true"></s:textfield></td>
		  	</tr>
		  	<tr>
		  		<td style="font-size: 20px">用户名</td>
		  		<td><s:textfield id="uname" name="user.username" theme="simple"></s:textfield>
		  		<input type="button" value="检查重名" onclick="checkname()"/>
		  		</td>
		  	</tr>
		  	<tr>
		  		<td style="font-size: 20px">密码</td>
		  		<td><input type="password" name="user.password"/></td>
		  	</tr>
		  	<tr>
		  		<td style="font-size: 20px">确认密码</td>
		  		<td><input type="password" name="conpwd"/></td>
		  	</tr>
		  	<tr>
		  		<td style="font-size: 20px">角色</td>
		  		<td><s:textfield  name="user.role" theme="simple" value="member" readonly="true"></s:textfield></td>
		  	</tr>
		  	<tr>
		  		<td style="font-size: 20px">身份证号</td>
		  		<td><s:textfield  name="user.cardid" theme="simple"></s:textfield></td>
		  	</tr>
		  	<tr>
		  		<td style="font-size: 20px">性别</td>
		  		<td><select name="user.sex">
		  		    <option value="男">男</option>
		  			<option value="女">女</option>
		  		</select></td>
		  	</tr>
		  	<tr>
		  		<td style="font-size: 20px">联系方式</td>
		  			<td><s:textfield  name="user.tele" theme="simple"></s:textfield></td>
		  	</tr>
		  	<tr>
		  	<td><input type="submit" value="确认"/></td>
		  	<td><input type="reset" value="重置"/></td>
		  	</tr>
		  </table>
	</form>
	<s:fielderror></s:fielderror>
  </body>

</html>
