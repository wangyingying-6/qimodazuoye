<%@ page language="java" import="java.util.*,com.dao.*,com.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>订单详情—奥络商城</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
   <style type="text/css">
   	.btnbg2{width:100px;height:28px; border:0;background:url(images/button_xzzf.gif)}
   </style>
  </head>
  <script type="text/javascript">
  		function cloWin(){
  			this.close();
  		}
  </script>
  <body> 
		  <%
		  	int orderid =Integer.parseInt(request.getParameter("orderId"));
		  	OrderCtrl oc = new OrderCtrl(); 
 			OrderInfo order = oc.UserOrderInfo(orderid);
 			double sum =order.getGoodsprice() * order.getGoodssl() + order.getGoodscarr();
		   %>
  		<!--订单详细信息 -->
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />订单详细信息</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">订单号：</td>
	                <td><%=order.getOrderId() %></td>
	              </tr>
	              <tr>
	                <td align="right">收货人姓名：</td>
	                <td><%=order.getUsername() %><input type="hidden" name="orderId" value="1"> </td>
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
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
		<!-- 商品详细信息 -->
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />商品详细信息</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">商品名：</td>
	                <td><%=order.getGoodsname() %><input type="hidden" name="orderId" value="1"> </td>
	              </tr>
	              <tr>
	                <td align="right">商品价格：</td>
	                <td><%=order.getGoodsprice() %>1</td>
	              </tr>
	              <tr>
	                <td align="right">配送费用：</td>
	                <td><%=order.getGoodscarr() %></td>
	              </tr>
	               <tr>
	                <td align="right">商品数量：</td>
	                <td><%=order.getGoodssl() %>件</td>
	              </tr>
	              <tr>
	                <td align="right">下单时间：</td>
	                <td><%=order.getOrderdate() %></td>
	              </tr>
	              <tr>
	                <td align="right">订单状态：</td>
	                <td>
	                	<%if("交易成功".equals(order.getOrderzt())){ %>
						<font style="font-size: 12px;color: #393">交易成功</font>&nbsp;<img src="images/reg_yesok.gif"></img>
						<% } else if("未付款".equals(order.getOrderzt())){ %>
						<font style="font-size: 12px;color: #999">未付款</font>
						<% } else if("正在处理".equals(order.getOrderzt())){ %>
						<font style="font-size: 12px;color: #00F">正在处理</font>&nbsp;<img src="images/jzz.gif"></img>
						<%} else {%>
						<font style="font-size: 12px;color: red">交易失败</font>&nbsp;<img src="images/reg_yesno.gif"></img>
						<%}%>
	                </td>
	              </tr> 
	              <tr>              	
		              	 <%
		              		if("未付款".equals(order.getOrderzt())){          		             		
		              	 %>
		             <td align="center" colspan="2">
		              	<form action="servlet/UpdateOrderZtServlet" method="post">
	       				<div align="left" style="margin-left: 200px;">
	       					<input type="hidden" name="userId" value="<%=order.getUserid()%>"/>
	       					<input type="hidden" name="orderId" value="<%=order.getOrderId()%>"/>
	       					<input type="hidden" name="sum" value="<%=sum %>"/> <br/>      					
	       					付款金额：<font style="color: #d20a34">￥<%=sum %>元</font><br/>   					
	       					　　密码：<input type="password" name="userPwd"><br/><br/>
	       					　　　　　<input class="btnbg2" type="submit" value=""><br/>
	       				</div>
	       				</form>
	       			</td>     					              	 
	              	 <%} else{ %>
	              	<td align="center" colspan="2"><input type="button" class="btnbg" value="关闭本页" onclick="cloWin()"></td>
	              	<%} %>
	              </tr>           
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
		
  </body>
</html>
