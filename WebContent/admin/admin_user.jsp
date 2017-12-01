<%@ page language="java" import="java.util.*,com.dao.*,com.entity.*" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'config.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
  </head>
  <body>	
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />管理员列表</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <%
	              	AdinUserCrtl ac =new AdinUserCrtl();
	              	ArrayList<Admin_UserInfo> al = ac.selUser();
	              	for(Admin_UserInfo au : al){	              	
	               %>
	              <tr>
	                <td align="right">管理员：
	                <input type="text" name="admin_userName" id="admin_userName" value="<%=au.getAdmin_username() %>"/>
	                <input type="hidden" name="userId" id="userId" value="<%=au.getAdmin_userId()%>"/></td>
	                <td align="left">&nbsp;密码：<input type="password" style="width: 155px;" name="admin_userPwd" id="admin_userPwd" value="<%=au.getAdmin_userpwd() %>"></td>
	                <td align="center"><a href="admin/admin_updateuser.jsp?userId=<%=au.getAdmin_userId() %>">修改</a>&nbsp;&nbsp;<a href="servlet/Admin_deleteAdminUser?userId=<%=au.getAdmin_userId() %>" onclick="return confirm('确定要删除吗？')">删除</a></td>
	              </tr>
	              <%} %>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
  </body>
</html>
