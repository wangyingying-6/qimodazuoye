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
	int pageSize = 10;//定义每页显示的条目数
	int pageNow = 1;//默认显示第一页
	int pageCount = 1;//默认只有1页
	AdinUserCrtl ac = new AdinUserCrtl();
	if(request.getParameter("pageNow") != null)
	pageNow = Integer.parseInt(request.getParameter("pageNow"));
	//获取总页数
	pageCount = ac.getSortCount(pageSize);
	
	//如果小于第一页，则显示第一页
	if(pageNow <= 0){
		pageNow = 1;
	}
	//如果超过最后一页，则显示最后一页
	if(pageNow >= pageCount){
		pageNow = pageCount;
	}
	ArrayList<GoodsSort> asort = ac.getSortForPage(pageSize,pageNow);
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
  		function yzsort(){
  			var sortName =document.getElementById("sortName");
  			if(sortName.value.length<=0){
  				alert("请输入商品类别名称");
  				return false;
  			}
  			return true;
  		}
  		function pageGo(){
	  		var pageNow = document.getElementById("pageNow");
	  		if(pageNow.value.length==0){
					alert("请输入要跳转的页数！");
					pageNow.value="";
					pageNow.focus();
					return;	
				}
			if(isNaN(pageNow.value)){
					alert("请输入正确的页数！");
					pageNow.value="";
					pageNow.focus();
					return;	
				}
	  		window.location.href="category.jsp?pageNow=" + pageNow.value;
  	}
  </script> 
  <body>
    <div id="container">
    <div id="right">
    	<div class="content">
       	  <div class="rtbd">
           	<div class="jyjl">
                	<h2><img src="admin/images/ibg1.jpg" />商品类别管理</h2>
            </div>
                <table align="center" class="user" width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  	<th style="width: 50%">类别名称</th>
					<th style="width: 10%">操作</th>
                  </tr>
                  <tr>
                  	<%
                  		for(GoodsSort sort : asort){                  		
                  	 %>
					<td style="border-left:#CFE0F0 1px solid;">
						<%=sort.getSortname() %>
					</td>
					<td>
						<a href="admin/updatesort.jsp?sortId=<%=sort.getSortId() %>">修改</a>&nbsp;
						<a href="servlet/Admin_deleteSort?sortId=<%=sort.getSortId() %>" onclick="return confirm('确定要删除吗？')">删除</a>
					</td>
                  </tr>
                  <%} %>
                  <tr>
                  		<td style="border-left:#CFE0F0 1px solid;" colspan="7">
                  			<a href="admin/category.jsp?pageNow=1">首页</a>
                  			<a href="admin/category.jsp?pageNow=<%=pageNow-1 %>">上一页</a>                  			
                  			<font style="color: red; font-size: 12px;"><%=pageNow %>/<%=pageCount %></font>
                  			<a href="admin/category.jsp?pageNow=<%=pageNow+1 %>">下一页</a>
                  			<a href="admin/category.jsp?pageNow=<%=pageCount %>">尾页</a>
                  			<font style="color: red; font-size: 12px;">到第</font><input type="text" style="width: 20px;height: 20px;" id="pageNow"><font style="color: red; font-size: 12px;">页</font>
                  			<a href="javascript:pageGo()">跳转</a>                  			
                  		</td>
                  </tr>
                </table>
        	</div>
        </div>
    </div>
</div>
  	<form action="servlet/Admin_AddSortServlef" method="post" onsubmit="return yzsort()">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />商品类别添加</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">类别名称：</td>
	                <td><input type="text" id="sortName" name="sortName"/></td>
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
