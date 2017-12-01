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
	<form action="servlet/Admin_UpdateSortServlef" method="post">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />修改商品类别</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">   
	        	<%
	        		int sortid =Integer.parseInt(request.getParameter("sortId"));
	        		GoodsSort sort = new GoodsSort();
	        		AdinUserCrtl ac = new AdinUserCrtl();
	        		sort =ac.selGoodsSort(sortid);
	        	 %>                    
	              <tr>
	                <td align="right">类别编号：<input type="hidden" name="sortId" id="sortId" value="<%=sort.getSortId()%>"/></td>
	                <td><%=sort.getSortId() %></td>
	              </tr>
	              <tr>
	              	<td align="right">类别名称：</td>
	              	<td><input type="text" name="sortName" id="sortName" value="<%=sort.getSortname() %>"></td>
	              </tr>
	              <tr>
	              	<td></td>
	                <td><input type="submit" class="btnbg" value="确认修改"></td>
	              </tr>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	</form>
  </body>
</html>
