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
<%
  	int imgid =Integer.parseInt(request.getParameter("imgId"));
  	AdinUserCrtl ac = new AdinUserCrtl();
  	ImgInfo img =ac.selLunbo(imgid);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>My JSP 'pptupdate.jsp' starting page</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
  </head> 
    <script type="text/javascript">
  		function ShowImg(img,file){  			
  			img.src=file.value;
  			img.style.display="block";  			
  		}  	
  </script>
  <body>
  	<form action="servlet/Admin_UpdateLunboImgServlet" method="post" onsubmit="return yzLunbo()">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />修改轮播图片</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">    
	              <tr>
	                <td align="right">图片预览：</td>
	                <td>
	                <img style="width: 300px;height: 100px;" src="<%=img.getLunboaddr() %>" id="Lunboimg">
	                 <input type="hidden" name="imgId" value="<%=imgid%>"/>
	                </td>
	              </tr>
	               <tr>
	                <td align="right">图片地址：</td>
	                <td><input type="file" id="Lunbofile" name="Lunbofile" onchange="ShowImg(Lunboimg,this)"/></td>
	              </tr>
	              <tr>
	                <td align="right">连接地址：</td>
	                <td><input type="text" id="Lunbohref" name="Lunbohref" value="<%=img.getImghref() %>"></td>
	              </tr>
	              <tr>
	              	<td width="200px;"></td>
	              	<td align="left"><input type="submit" style="margin-left: 50" class="btnbg" value="确认修改"></td>	              	
	              </tr>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	</form>
  </body>
</html>
