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
	<SCRIPT type="text/javascript">
		function delconfirm(){
		return confirm("是否删除该记录");
		}
	</SCRIPT>

  </head>
  
  <body background="image/iframe.png">
  <div align="center" style="margin-top: 100px">
	<table border="1" width="900px" height="250px" background="image/pattern.png" cellspacing="0">
	<tr bgcolor="FFCC99">
		<td align="center" style="color: 679E22">用户编号</td>
		<td align="center" style="color: B97A57">用户名</td>
		<td align="center" style="color: 679E22">角色</td>
		<td align="center" style="color: B97A57">用户状态</td>
		<td align="center" style="color: 679E22">密码错误次数</td>
		<td align="center" style="color: B97A57">性别</td>
		<td align="center" style="color: 679E22">身份证号</td>
		<td align="center" style="color: B97A57">更新</td>
		<td align="center" style="color: 679E22">删除</td>
		<td align="center" style="color: B97A57">解锁</td>
	</tr>
	<s:iterator value="users" id="u">
	<tr>
		<td><s:property value="#u.userid"/></td>
		<td><s:property value="#u.username"/></td>
		<td><s:property value="#u.role"/></td>
		<td>
		<s:if test="%{#u.status==1}">
		未锁定
		</s:if>
		<s:else>
		已锁定
		</s:else>
		</td>
		<td><s:property value="#u.wrongnum"/></td>
		<td><s:property value="#u.sex"/></td>
		<td><s:property value="#u.cardid"/></td>
		<td><s:property value="#u.tele"/></td>
		<td><a href="user/selectuserbyuserid.action?user.userid=<s:property value="#u.userid"/>">更新</a></td>
		<td><a href="user/deleteuser.action?user.userid=<s:property value="#u.userid"/>" onclick="return delconfirm()">删除</a></td>
		<td>
		<s:if test="%{#u.status==1}">
		解锁
		</s:if>
		<s:else>
		<a href="user/userunlock.action?user.userid=<s:property value="#u.userid"/>">解锁</a>
		</s:else>	
		</td>
	</tr>
	</s:iterator>
</table>
        <a href="javascript:history.back()">返回</a>
        </div>
</body>
  
</html>
