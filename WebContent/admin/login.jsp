<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>后台登陆</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="admin/css/login.css" type="text/css"></link>
  <script type="text/javascript">
  	function loginyz(){
  		var adminUsername =document.getElementById("adminUsername");
  		var adminPassword =document.getElementById("adminPassword");
  		var yzm =document.getElementById("yzm");
  		if(adminUsername.value.length<=0){
  			alert("请输入用户名！");
  			return false;
  		}
  		if(adminPassword.value.length<=0){
  			alert("请输入密码！");
  			return false;
  		}
   		if(yzm.value.length<=0){
  			alert("请输入验证码！");
  			return false;
  		}else if(yzm.value!="AIKL"&&yzm.value!="aikl"){
  			alert("验证码错误！");
  			return false;
  		}else{
  			return true;
  		}
  	}
  </script>
  </head>
  <body>
   <div class="login">
	<form action="servlet/Admin_LoginServlef" method="post" onsubmit="return loginyz()">
	    <ul>
	      <li>
	        <label>管理员：</label>
	        <span>
	        <input name="adminUsername" id="adminUsername" type="text" />
	        </span></li>
	      <li>
	        <label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
	        <span>
	        <input name="adminPassword" id="adminPassword" type="password" />
	        </span></li>
	      <li>
	        <label>验证码：</label>
	        <input name="yzm" id="yzm" type="text" style="height:18px;width:65px;margin-left: 2px" />
	        <div style="margin-top:-23px;margin-left: 145px;"><img alt="AIKL" src="admin/images/code.gif"></div>
	      </li>
	      <li>
	        <label></label>
	        <input class="tblg" type="submit" value=""/></li>
	    </ul>
	</form>
  </div>
  </body>
</html>
