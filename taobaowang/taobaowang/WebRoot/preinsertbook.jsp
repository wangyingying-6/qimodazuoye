<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showalluser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" media="all" href="css/login.css"/>
	<link rel="stylesheet" type="text/css" media="all" href="css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/cn_utf8.js"></script>
<script type="text/javascript" src="js/calendar-setup.js"></script>

  </head>
  
  <body id="preinsertbook">
<a href="/MyWeb/index.jsp">返回</a>
   <form action="book/insertbook.action" method="post" enctype="multipart/form-data">
		  <table border="1" width="400"  align="center" style="margin-top: 200px" id="biaoge4">
			  <tr>
			  	<td bgcolor="#FFCC99" align="center">预订编号</td>
			  	<td><s:textfield name="book.bid" theme="simple" ></s:textfield></td>
			  </tr>
			   <tr>
			  	<td bgcolor="#FFCC99" align="center">用户编号</td>
			  	<td><s:textfield name="#session.userinfo.userid" theme="simple" ></s:textfield></td>
			  </tr>
			   <tr>
			  	<td bgcolor="#FFCC99" align="center">房间编号</td>
			  	<td><s:textfield name="book.room.rid" theme="simple" ></s:textfield></td>
			  </tr>
				<tr>
			  	<td bgcolor="#FFCC99" align="center">入住时间</td>
			  	<td><s:textfield name="book.starttime" id="f_date_a"></s:textfield></td>
			  </tr>
			  <tr>
			  	<td bgcolor="#FFCC99" align="center">退房时间</td>
			  	<td><s:textfield name="book.endtime" id="f_date_b"></s:textfield></td>
			  </tr>
			  
			  <tr bgcolor="#FFCC99">
			  	<td align="center"><input type="submit" value="预订"/></td>	  	
			  </tr>
		  </table>
	  </form>
 
    
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "f_date_a",         // 日期文本框的id属性
        ifFormat       :    "%Y-%m-%d",  // 输入日期的格式
        showsTime      :    true,               //是否现实时间
        onUpdate       :    null
    });
</script>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "f_date_b",         // 日期文本框的id属性
        ifFormat       :    "%Y-%m-%d",  // 输入日期的格式
        showsTime      :    true,               //是否现实时间
        onUpdate       :    null
    });
</script>  
  </body>
</html>
