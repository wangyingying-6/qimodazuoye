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
    
    <title>My JSP 'updateorder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
  </head>  
  <body>	  
  		<% 
	  		int orderid =Integer.parseInt(request.getParameter("orderId")); 
	  		OrderCtrl oc = new OrderCtrl(); 
 			OrderInfo order =oc.selOrder(orderid);
	  	 %>
	  <form action="servlet/Admin_UpdateOrderServlet" method="post">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />修改订单信息</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">收货人姓名：</td>
	                <td><%=order.getUsername() %><input type="hidden" name="orderId" value="<%=orderid %>"> </td>
	              </tr>
	              <tr>
	                <td align="right">收货地址：</td>
	                <td><%=order.getUseraddr() %></td>
	              </tr>
	              <tr>
	                <td align="right">邮政编码：</td>
	                <td><%=order.getUseryb() %></td>
	              </tr>
	               <tr>
	                <td align="right">联系电话/手机：</td>
	                <td><%=order.getUsersj() %></td>
	              </tr>
	              <tr>
	                <td align="right">E-mail：</td>
	                <td><%=order.getUseremail() %></td>
	              </tr>
	              <tr>
	                <td align="right">订单附加说明：</td>
	                <td><textarea rows="" cols="40"><%=order.getGoodssm() %></textarea></td>
	              </tr>
	              <tr>
	                <td align="right">订单状态：</td>
	                <td>
	                <input type="radio" name="orderZt" value="交易成功" <%if("交易成功".equals(order.getOrderzt())){out.print("checked='checked'");} %>>交易成功
	                <input type="radio" name="orderZt" value="正在处理" <%if("正在处理".equals(order.getOrderzt())){out.print("checked='checked'");} %>>正在处理
	                <input type="radio" name="orderZt" value="交易失败" <%if("交易失败".equals(order.getOrderzt())){out.print("checked='checked'");} %>>交易失败
	                </td>
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
