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
	OrderCtrl oc = new OrderCtrl();
	if(request.getParameter("pageNow") != null)
	pageNow = Integer.parseInt(request.getParameter("pageNow"));
	//获取总页数
	pageCount = oc.getOrderCount(pageSize);
	
	//如果小于第一页，则显示第一页
	if(pageNow <= 0){
		pageNow = 1;
	}
	//如果超过最后一页，则显示最后一页
	if(pageNow >= pageCount){
		pageNow = pageCount;
	}
	ArrayList<OrderInfo> aorder = oc.getOrderForPage(pageSize,pageNow);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
  </head>  
  <script type="text/javascript">
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
  		window.location.href="order.jsp?pageNow=" + pageNow.value;
  	}
  </script>
  <body>
<div id="container">
    <div id="right">
    	<div class="content">
       	  <div class="rtbd">
           	<div class="jyjl">
                	<h2><img src="admin/images/ibg1.jpg" />订单管理</h2>
            </div>
                <table class="user" width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  	<th>订单号</th>
                  	<th>商品名</th>
					<th>商品价格</th>
					<th>操作人ID</th>                    
					<th>订单状态</th>
					<th>下单时间</th>					
					<th>操作</th>
                  </tr>   
                  <%
                  	for(OrderInfo order : aorder){         	
                   %> 
                  <tr onmousemove="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''">				
					<td><%=order.getOrderId() %></td>
					<td><%=order.getGoodsname() %></td>
					<td><%=order.getGoodsprice() %></td>
					<td><%=order.getUserid() %></td>					
					<td><%if("交易成功".equals(order.getOrderzt())){ %>
						<font style="font-size: 12px;color: #393">交易成功</font>
						<% } else if("未付款".equals(order.getOrderzt())){ %>
						<font style="font-size: 12px;color: #999">未付款</font>
						<% } else if("正在处理".equals(order.getOrderzt())){ %>
						<font style="font-size: 12px;color: #00F">正在处理</font>
						<%} else {%>
						<font style="font-size: 12px;color: red">交易失败</font>
						<%}%>
					</td>
					<td><%=order.getOrderdate() %></td>
                    <td>
						<a href="admin/updateorder.jsp?orderId=<%=order.getOrderId() %>"><img alt="修改订单" src="admin/images/icon3.gif"></img></a>		
						| <a href="servlet/Admin_deleteOrder?orderId=<%=order.getOrderId() %>" onclick="return confirm('确定要删除吗？')"><img alt="删除订单" src="admin/images/icon4.gif"></img></a>
					</td>                    
                  </tr>
                  <%} %>
                   <tr>
                  		<td style="border-left:#CFE0F0 1px solid;" colspan="9">
                  			<a href="admin/order.jsp?pageNow=1">首页</a>
                  			<a href="admin/order.jsp?pageNow=<%=pageNow-1 %>">上一页</a>                  			
                  			<font style="color: red; font-size: 12px;"><%=pageNow %>/<%=pageCount %></font>
                  			<a href="admin/order.jsp?pageNow=<%=pageNow+1 %>">下一页</a>
                  			<a href="admin/order.jsp?pageNow=<%=pageCount %>">尾页</a>
                  			<font style="color: red; font-size: 12px;">到第</font><input type="text" style="width: 20px;height: 20px;" id="pageNow"><font style="color: red; font-size: 12px;">页</font>
                  			<a href="javascript:pageGo()">跳转</a>                  			
                  		</td>
                  </tr>
                </table>
        	</div>
        </div>
    </div>
</div>
  </body>
</html>
