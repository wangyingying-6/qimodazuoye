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
    <title>My JSP 'category.jsp' starting page</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
  </head>  
  <script type="text/javascript">
  	function news(){
  		var newsTitle = document.getElementById("newsTitle");
  		var newsContent  = document.getElementById("newsContent");
  		if(newsTitle.value.length<=0){
  			alert("请填写新闻标题！");
  			return false;
  		}else if(newsTitle.value.length>25){
  			alert("新闻标题长度不可超过25！");
  			return false;
  		}
  		if(newsContent.value.length<=0){
  			alert("请填写新闻内容！");
  			return false;
  		}
  		return  true;
  	}
  </script>
  <body>
  	<%
  		int newsid =Integer.parseInt(request.getParameter("newsId"));
  		AdinUserCrtl ac = new AdinUserCrtl();
  		Admin_NewsInfo news =ac.selNews(newsid);
  	 %>
  	<form action="servlet/Admin_UpdateNewsServlef" method="post" onsubmit="return news()">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />编辑新闻</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">    
	              <tr>
	                <td align="right">新闻标题：</td>
	                <td>
	                <input type="text" style="width: 382px;" name="newsTitle" id="newsTitle" value="<%=news.getNewstitle() %>" />
	                <input type="hidden" name="newsId" value="<%=newsid%>"/>
	                </td>
	              </tr>
	               <tr>
	                <td align="right">新闻内容：</td>
	                <td><textarea name="newsContent" id="newsContent" cols="60" rows="10"><%=news.getNewscontent() %></textarea></td>
	              </tr>
	              <tr>
	                <td align="right">发布时间：</td>
	                <td><%=news.getNewsdate() %></td>
	              </tr>
	              <tr>
	              	<td width="200px;"></td>
	              	<td align="left"><input type="submit" style="margin-left: 200" class="btnbg" value="确认修改"></td>	              	
	              </tr>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	</form>
  </body>
</html>
