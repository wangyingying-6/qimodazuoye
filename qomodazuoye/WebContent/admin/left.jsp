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
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
  </head>
  <script type="text/javascript">
 	 /*功能菜单折叠方法*/
  	function displayNav(id) {
  	 var nav =document.getElementById("nav"+id);
  	 	if(nav.style.height=="30px"){
  	 		nav.style.height="";
  	 	}else{
  	 		nav.style.height="30px";
  	 	}
	}
  </script>
  <body>
    <div id="left">
    <div id="nav0" class="nav">
    	<dl>
    		<dt onclick="displayNav(0)">基本功能</dt>
    		<dd><a href="admin/config.jsp" target="mainFrame">基本设置</a></dd>
    		<dd><a href="admin/ppt.jsp" target="mainFrame">图片管理</a></dd>
    		<dd><a href="admin/log.jsp" target="mainFrame">系统日志</a></dd>
    	</dl>
    </div>
    <div id="nav1" class="nav">
    	<dl>
    		<dt onclick="displayNav(1)">会员管理</dt>
    		<dd><a href="admin/user.jsp" target="mainFrame">会员列表</a></dd>
    		<dd><a href="admin/useradd.jsp" target="mainFrame">会员添加</a></dd>
    		<dd><a href="admin/rechargelog.jsp" target="mainFrame">用户充值记录</a></dd>
    	</dl>
    </div>
    <div id="nav2" class="nav">
     	<dl>
    		<dt onclick="displayNav(2)">商品管理</dt>
    		<dd><a href="admin/category.jsp" target="mainFrame">类别管理</a></dd>
    		<dd><a href="admin/goods.jsp" target="mainFrame">商品列表</a></dd>
    		<dd><a href="admin/goodsadd.jsp" target="mainFrame">添加商品</a></dd>
    		<dd><a href="admin/order.jsp" target="mainFrame">订单管理</a></dd>
    		<dd><a href="admin/comment.jsp" target="mainFrame">评论管理</a></dd>
    	</dl>
    </div>	
    <div id="nav3" class="nav">
    	<dl>
    		<dt onclick="displayNav(3)">新闻管理</dt>
    		<dd><a href="admin/news.jsp" target="mainFrame">新闻列表</a></dd>
    		<dd><a href="admin/newsadd.jsp" target="mainFrame">添加新闻</a></dd>
    	</dl>
    </div>	
    <div id="nav4" class="nav">	
    	<dl>
    		<dt onclick="displayNav(4)">管理员管理</dt>
    		<dd><a href="admin/admin_user.jsp" target="mainFrame">管理员列表</a></dd>
    		<dd><a href="admin/admin_user2.jsp" target="mainFrame">管理员添加</a></dd>
    	</dl>
    </div>	
	</div>
  </body>
</html>
