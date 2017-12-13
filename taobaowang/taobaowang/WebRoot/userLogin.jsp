<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'login.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="userlogin.css">
	-->
		<link rel="stylesheet" type="text/css" media="all"
			href="css/login.css" />
	</head>

	<body>



		<table  id="cc" style="margin-top: 50px">
		    <form action="user/userlogin.action" method="post">
			<tr align="center">
				<td>
					<img src="image/39.jpg"/>
				</td>
			</tr>
			<tr align="center">
				<td>
					<font color="#CC0066"> 
							<h1><s:text name="html.login.title"></s:text></h1>
						 
					</font>
				</td>
			</tr>
			<tr align="center">
				<td> 
					<a href="changelanguage.action?request_locale=zh_CN">中文</a>
					<a href="changelanguage.action?request_locale=en_GB">English</a>
				</td>
			</tr>
			<tr align="center">
				<td style="font-size: 18px">
	                   <font color="#CC0066"><s:text name="html.login.username"></s:text>:</font>
						<input type="text" name="user.username" />
				</td>
			</tr>
			<tr align="center">
                <td style="font-size: 18px">
						<font color="#CC0066"><s:text name="html.login.password"></s:text>:</font>
						<input type="password" name="user.password" />
			   </td>
			 </tr>
			 <tr align="center">
               <td style="font-size: 18px">
						<input type="submit" value="<s:text name='html.login.submit'/>" />
						&nbsp;&nbsp;&nbsp;
						<input type="reset" value="<s:text name='html.login.reset'/>" />
			  </td>
			  </tr>
			  <tr align="center">
              <td style="font-size: 18px">
						<a href="/MyHotel/UserRegister.jsp"><s:text name="html.login.register"></s:text>
						</a>
						<s:fielderror></s:fielderror>
			  </td>
			  </tr>
			 
	
		</table>
		

	</body>
</html>
