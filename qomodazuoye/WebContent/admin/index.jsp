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
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>后台管理系统</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head> 
	<frameset rows="100,*" cols="*" frameborder="no" border="0" framespacing="0">
	  <frame src="admin/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
	  <frameset cols="172,*" frameborder="no" border="0" framespacing="0">
	    <frame src="admin/left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
	    <frame src="admin/main.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
	  </frameset>
	</frameset>
<noframes><body>
</body></noframes>
</html>
