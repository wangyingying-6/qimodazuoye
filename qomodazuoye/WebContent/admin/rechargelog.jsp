<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'rechargelog.jsp' starting page</title>
    
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
	              <h2><img src="admin/images/ibg4.jpg"/>用户充值记录</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr align="center">
	                <th>管理员</th>
	                <th>用户名</th>
	                <th>充值金额</th>
	                <th>时间</th>
	              </tr>
	              <tr align="center">
	                <td>admin</td>
	                <td>admin</td>
	                <td>10</td>	
	                <td>2012年7月1日 14:17:04</td>                
	              </tr>             
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
  </body>
</html>
