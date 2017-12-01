<%@ page language="java" import="java.util.*,com.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
if(session.getAttribute("au")== null){  			
  				response.sendRedirect("404.jsp");  					
  				return ;
  }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>My JSP 'top.jsp' starting page</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
	</head>  
  <body>
  		<%
			Admin_UserInfo au =(Admin_UserInfo)session.getAttribute("au");
		 %>
		<div class="header_top">
			<div class="navbar">
				<h1>管理后台</h1>			
			</div>
				<div class="loginbar">
					<div><a href="servlet/Admin_UserZxServlet" target="_top">退出</a></div>
			    </div>
			  <div class="date">当前时间：2012年6月30日 13:07:42</div>
		</div>
		<div class="notice">			
			<div class="nt1"><a href="admin/main.jsp" target="mainFrame">系统首页</a></div>
			<div class="nt2"><p>当前管理员：<span><%=au.getAdmin_username() %></span></p></div>
			<div class="nt1 nt4"><a href="admin/admin_user.jsp" target="mainFrame">修改密码</a></div>
		</div>
  </body>
</html>
