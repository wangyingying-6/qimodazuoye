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
  <script type="text/javascript">
  	function checkname(){
  		u=document.getElementById("uname");
  		uid=document.getElementById("uid");
  		if(u.value==""){
  			alert("请输入用户名");
  		}else{
  			//提交一个请求
  			location.href="checkname.action?user.userid="+uid.value+"&user.username="+u.value;
  		}
  	}
  	function check(){
  	     
  	       p1=document.getElementById("pwd");
  	       p2=document.getElementById("cpwd");

  	      
  	        if(p1.value!=p2.value){
  	        alert("两次密码必须一致！");
  	          return false;
  	       }
  	}
  </script>
  <body background="image/iframe.png">
  <div align="center">
	  <form action="user/insertuser.action" method="post">
		  <table border="1" width="500px" height="370px" align="center" style="margin-top: 100px" background="image/pattern.png" cellspacing="0">
		  	<tr>
		  		<td style="color: 679E22;font-size: 20px" bgcolor="FFCC99">用户编号</td>
		  		<td><s:textfield id="uid" name="user.userid" theme="simple" readonly="true"></s:textfield></td>
		  	</tr>
		  	<tr>
		  		<td style="color: 00A2E8;font-size: 20px">用户名</td>
		  		<td><s:textfield id="uname" name="user.username" theme="simple" ></s:textfield>
		  		<input type="button" value="检查重名" onclick="checkname()"/>
		  		</td>
		  	</tr>
		  	<tr>
		  		<td style="color: 679E22;font-size: 20px" bgcolor="FFCC99">密码</td>
		  		<td><input type="password" name="user.password" id="pwd"/></td>
		  	</tr>
		  	<tr>
		  		<td style="color: 00A2E8;font-size: 20px">确认密码</td>
		  		<td><input type="password" name="conpwd" id="cpwd"/></td>
		  	</tr>
		  	<tr>
		  		<td style="color: 679E22;font-size: 20px" bgcolor="FFCC99">角色</td>
		  		<td><select name="user.role">
		  		    <option value="admin">管理员</option>
		  			<option value="vip">VIP</option>
		  			<option value="member" selected>普通顾客</option>
		  		</select></td>
		  	</tr>
		  	<tr>
		  		<td style="color: 00A2E8;font-size: 20px">身份证号</td>
		  		<td><s:textfield  name="user.cardid" theme="simple"></s:textfield></td>
		  	</tr>
		  	<tr>
		  		<td style="color: 679E22;font-size: 20px" bgcolor="FFCC99">性别</td>
		  		<td><select name="user.sex">
		  		    <option value="男">男</option>
		  			<option value="女">女</option>
		  		</select></td>
		  	</tr>
		  	<tr>
		  		<td style="color: 00A2E8;font-size: 20px">联系方式</td>
		  		<td><s:textfield  name="user.tele" theme="simple"></s:textfield></td>
		  	</tr>
		  	<tr>
		  	<td><input type="submit" value="添加"/ onclick="return check()"></td>
		  	<td><input type="reset" value="重置"/></td>
		  	</tr>
		  </table>
	  </form>
	  <s:fielderror></s:fielderror>
	   <a href="javascript:history.back()">返回</a>
	   </div>
  </body>
</html>
