<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>My JSP '404.jsp' starting page</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <STYLE type=text/css>
    BODY {FONT-SIZE: 9pt; COLOR: #842b00; LINE-HEIGHT: 16pt; FONT-FAMILY: "Tahoma", "宋体"; TEXT-DECORATION: none}
	TABLE {FONT-SIZE: 9pt; COLOR: #842b00; LINE-HEIGHT: 16pt; FONT-FAMILY: "Tahoma", "宋体"; TEXT-DECORATION: none}
	TD FONT-SIZE: 9pt; COLOR: #842b00; LINE-HEIGHT: 16pt; FONT-FAMILY: "Tahoma", "宋体"; TEXT-DECORATION: none}
	BODY {SCROLLBAR-HIGHLIGHT-COLOR: buttonface; SCROLLBAR-SHADOW-COLOR: buttonface; SCROLLBAR-3DLIGHT-COLOR: buttonhighlight; SCROLLBAR-TRACK-COLOR: #eeeeee; BACKGROUND-COLOR: #ffffff}
	A {FONT-SIZE: 9pt; COLOR: #842b00; LINE-HEIGHT: 16pt; FONT-FAMILY: "Tahoma", "宋体"; TEXT-DECORATION: none}
	A:hover {FONT-SIZE: 9pt; COLOR: #0188d2; LINE-HEIGHT: 16pt; FONT-FAMILY: "Tahoma", "宋体"; TEXT-DECORATION: none}
	H1 {FONT-SIZE: 9pt; FONT-FAMILY: "Tahoma", "宋体"}
</STYLE>    
  <body>
   <TABLE cellSpacing=0 width=600 align=center border=0>
  	<TR>
	    <TD><br><br><IMG height=100 src="admin/images/404.jpg" width=100 border=0></TD>
	   	<TD>
	   	<br><br><br><br><br>
     	 <H2>您无权访问该页面！</H2>
     	  <HR noShade SIZE=0>
	      <P>☉ 最有可能的原因：</P>
	      <UL>
	        <LI>您还没有登录！</LI>
	        <LI>网站加载出错！</LI>
	      </UL> 
	      <div align="right">☉<a href="admin/login.jsp" >点此登录</a></div>
	       <HR noShade SIZE=0>	      
	    	  <P>☉ 如果您对本站有任何疑问、意见、建议、咨询，请联系管理员</p>  
    	</TD>
   	  </TR>
     </TABLE>
  </body>
</html>
