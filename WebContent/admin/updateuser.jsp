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
	  	<% 
	  		int userid =Integer.parseInt(request.getParameter("userId")); 
	  		UserCrtl uc = new UserCrtl(); 
 			UserInfo user =uc.selUser(userid); 
	  	 %>
	  <form action="servlet/Admin_UpdateUserServlet" method="post" onsubmit="return checkForm()">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />编辑用户信息</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">用户编号：</td>
	                <td><%=userid %><input type="hidden" name="userId" value="<%=userid%>"/></td>
	              </tr>
	              <tr>
	                <td align="right">用户名：</td>
	                <td><input type="text" name="userName" id="userName" value="<%=user.getUsername() %>"></td>
	              </tr>
	              <tr>
	                <td align="right">用户密码：</td>
	                <td><input type="password" style="width: 155px;" name="userPwd" id="userPwd" value="<%=user.getUserpwd() %>"></td>
	              </tr>
	               <tr>
	                <td align="right">用户姓名：</td>
	                <td><input type="text" name="userXm" id="userXm" value="<%=user.getUserxm() %>"></td>
	              </tr>
	              <tr>
	                <td align="right">用户性别：</td>
	                <td>
	                	<input type="radio" name="userSex" id="radio" value="0" <%if(user.getUsersex()==0){out.print("checked='checked'");} %>>男
                     	<input type="radio" name="userSex" id="radio2" value="1" <%if(user.getUsersex()==1){out.print("checked='checked'");} %>>女
                    </td>
	              </tr>
	              <tr>
	                <td align="right">用户邮箱：</td>
	                <td><input type="text" name="userEmail" id="userEmail" value="<%if(user.getUseremail()==null){out.print("");}else{out.print(user.getUseremail());} %>"></td>
	              </tr>
	              <tr>
	                <td align="right">邮编地址：</td>
	                <td><input type="text" name="userYb" id="userYb" value="<%if(user.getUseryb()==null){out.print("");}else{out.print(user.getUseryb());} %>"></td>
	              </tr>
	              <tr>
	                <td align="right">收货地址：</td>
	                <td><input type="text" name="userAddr" id="userAddr" value="<%if(user.getUseraddr()==null){out.print("");}else{out.print(user.getUseraddr());} %>"></td>
	              </tr>
	              <tr>
	                <td align="right">联系电话：</td>
	                <td><input type="text" name="userPhone" id="userPhone" value="<%if(user.getUserphone()==null){out.print("");}else{out.print(user.getUserphone());} %>"></td>
	              </tr>
	              <tr>
	                <td align="right">手机号码：</td>
	                <td><input type="text" name="userSj" id="userSj" value="<%if(user.getUsersj()==null){out.print("");}else{out.print(user.getUsersj());} %>"></td>
	              </tr>
	              <tr>
	                <td align="right">注册时间：</td>
	                <td><%=user.getUserdate() %></td>
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
  </body>
</html>
