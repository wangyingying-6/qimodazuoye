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
   <script type="text/javascript">
   	function yzYe(){
   		var userYe =document.getElementById("userYe");
   		if(userYe.value.length>3){
   			alert("金额过大，请重新输入！");
   			return false;
   		}
   		if(userYe.value.length<=0){
   			alert("请输入充值金额！");
   			return false;
   		}
   	}
   	function yzYe2(){
   		var userYe2 =document.getElementById("userYe2");   		
   		if(userYe2.value.length<=0){
   			alert("请输入扣款金额！");
   			return false;
   		}
   	}
   </script>
  <body>
	  <form action="servlet/Admin_UpdateYeServlet" method="post" onsubmit="return yzYe()">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />用户余额充值</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	             <%
	              	AdinUserCrtl ac = new AdinUserCrtl();
	              	UserInfo user = new UserInfo();
	              	int userid =Integer.parseInt(request.getParameter("userId"));
	              	user =ac.setuserYe(userid);
	               %>
	              <tr>
	                <td align="right">用户编号：</td>
	                <td><%=userid %><input type="hidden" name="userId" value="<%=userid%>"/></td>
	              </tr>	              
	              <tr>
	                <td align="right">当前余额：</td>
	                <td><%=user.getUserye() %>元</td>
	              </tr>
	              <tr>
	                <td align="right">充值金额：</td>
	                <td><input type="text" name="userYe" id="userYe"></td>
	              </tr>
	              <tr>
	              	<td></td>
	              	<td align="left"><input type="submit" class="btnbg" value="立即充值"></td>	              	
	              </tr>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	</form>
		  <form action="servlet/Admin_UpdateYe2Servlet" method="post" onsubmit="return yzYe2()">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />用户余额扣款</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">用户编号：</td>
	                <td><%=userid %><input type="hidden" name="userId" value="<%=userid%>"/></td>
	              </tr>
	               <tr>
	                <td align="right">当前余额：</td>
	                <td><%=user.getUserye() %>元</td>
	              </tr>
	              <tr>
	                <td align="right">扣款金额：</td>
	                <td><input type="text" name="userYe2" id="userYe2"></td>
	              </tr>
	              <tr>
	              	<td></td>
	              	<td align="left"><input type="submit" class="btnbg" value="立即扣款"></td>	              	
	              </tr>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	</form>
  </body>
</html>
