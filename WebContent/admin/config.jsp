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
  	  <%	
  	  		AdinUserCrtl ac = new AdinUserCrtl();
  	  		SiteInfo site = ac.setSite();
  	  		
  	   %>
	  <form action="servlet/Admin_UpdateSiteServlet" method="post">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />网站基本设置</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">网站名称：</td>
	                <td><input type="text" name="siteName" id="siteName" value="<%=site.getSitename() %>"/></td>
	              </tr>
	              <tr>
	                <td align="right">网站备案号：</td>
	                <td><input type="text" name="icpNumber" id="icpNumber" value="<%=site.getIcpnumber() %>"></td>
	              </tr>
	              <tr>
	              	<td></td>
	              	<td align="left"><input type="submit" class="btnbg" value="确认修改"></td>	              	
	              </tr>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	</form>
  </body>
</html>
