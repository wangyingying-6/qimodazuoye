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
    <title>My JSP 'ppt.jsp' starting page</title>    
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
    <form action="servlet/Admin_UpdateLogoImgServlet" method="post" onsubmit="return ">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />网站LOGO设置</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	             	<%	
					  AdinUserCrtl ac = new AdinUserCrtl();
					  ImgInfo logoimg = ac.setLogoImg();	
					 %>
	              <tr>
	                <td align="right">LOGO预览：</td>
	                <td><img style="width: 180px;height: 50px;" alt="LOGO" src="<%=logoimg.getLogoaddr() %>" id="logoimg"> </td>
	              </tr>
	              <tr>
	                <td align="right">图片地址：</td>
	                <td><input type="file" id="logofile" name="logofile" onchange="ShowImg(logoimg,this)"/></td>
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
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />网站轮播图片管理</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">  
	              <tr align="center">
	                <th>图片预览</th>
	                <th>连接地址</th>               
	                <th>操作</th>
	              </tr>
	              <%
	              		ArrayList<ImgInfo> aimg =ac.selLunboImg();
	              		for(ImgInfo img : aimg){  
	               %>
	              <tr align="center">
	                <td><img style="width: 300px;height: 100px;" id="lunbo" alt="LOGO" src="<%=img.getLunboaddr() %>"></td>
	                <td><%=img.getImghref() %></td>
	                <td>
		                <a href="admin/pptupdate.jsp?imgId=<%=img.getImgId() %>">修改</a>&nbsp;&nbsp;&nbsp;
		                <a href="servlet/Admin_deleteLunbo?imgId=<%=img.getImgId() %>" onclick="return confirm('确定要删除吗？')">删除</a>
	                </td>                
	              </tr>
	              <%} %>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	   <form action="servlet/Admin_AddLunboImgServlef" method="post" onsubmit="return ">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />轮播图片添加</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">图片预览：</td>
	                <td><img style="width: 300px;height: 100px;display: none;" alt="LOGO" src="" id="lbimg"> </td>
	              </tr>
	              <tr>
	                <td align="right">图片地址：</td>
	                <td><input type="file" id="lbfile" name="lbfile" onchange="ShowImg(lbimg,this)"/></td>
	              </tr>
	              <tr>
	                <td align="right">连接地址：</td>
	                <td><input type="text" id="lbhref" name="lbhref"> </td>
	               </tr>
	              <tr>
	              	<td></td>
	              	<td align="left"><input type="submit" class="btnbg" value="确认添加"></td>	              	
	              </tr>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	</form>
  </body>
</html>
