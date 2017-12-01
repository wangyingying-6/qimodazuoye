<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">

  </head>
  
  <body>
   <div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="admin/images/ibg1.jpg" />登录成功</h2>
				</div>
				<div class="clear"></div>
			</div>
			<div class="rtbd">
				<div class="jyjl">
				<h2><img src="admin/images/ibg2.jpg" />网站统计信息：</h2>
				</div>
				<div id="sum">
				<ul>
					<%
						SumInfoCrtl sum = new SumInfoCrtl();
						int UserCount =sum.UserCount();
						int OrderCount =sum.OrderCount();
						int NewsCount =sum.NewsCount();
					 %>
					<li>会员总数：<span><%=UserCount %></span>个</li>
					<li>订单总数：<span><%=OrderCount %></span>个</li>
					<li>新闻总数：<span><%=NewsCount %></span>个</li>
				</ul>	
				</div>					
			</div>
		</div>
  </body>
</html>
