<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/pic.css" />
	<script type="text/javascript">
    pics= new Array("image/1.jpg","image/2.jpg","image/3.jpg","image/4.jpg");
	pos=0;
   function left(){
        pic= document.getElementById("myt");
	if(pos==pics.length-1){
	   pos=0;
	}else{
	  pos++;
    }
	  pic.background=pics[pos];
   }
  
   function autochange(){
     left();
	 o=setTimeout("autochange()",2000);
   }
   function stopchange(){
      clearTimeout(o);
   }
   function change(i){
          stopchange();
         pic.background=pics[i];
   }
</script>
  </head>
  
  <body onload="autochange()">
  <div>
  <table style="width: 1238px; height: 65px;">
				<tr>

					<td style="font-family: 仿宋;">
						<font size="10" color="#4A1106" >酒店预订系统</font>
					</td>
					 
					<td style="text-align: center;">
						 <a href="/MyHotel/userLogin.jsp">请登录</a>
					</td>
					<td style="text-align: center;">
						<a href="/MyHotel/UserRegister.jsp">请注册</a>
					</td>
				</tr>
			</table>
	</div>
     <table width=100% height=100% border="1" id="myt">
  <tr>
    <td height="231"><form action="intro.html"  id="form">
      <a href="javascript:change(0)" >o</a> <a href="javascript:change(1)">o</a> <a href="javascript:change(2)">o</a> <a href="javascript:change(3)">o</a> <a href="javascript:change(4)">o</a> <a href="javascript:change(5)">o</a>
    </form></td>
    
  </tr>
	</table>
  </body>
</html>
