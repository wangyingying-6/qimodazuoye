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
	AdinUserCrtl ac = new AdinUserCrtl();
	if(request.getParameter("pageNow") != null)
	pageNow = Integer.parseInt(request.getParameter("pageNow"));
	//获取总页数
	pageCount = ac.getPageCount(pageSize);
	
	//如果小于第一页，则显示第一页
	if(pageNow <= 0){
		pageNow = 1;
	}
	//如果超过最后一页，则显示最后一页
	if(pageNow >= pageCount){
		pageNow = pageCount;
	}
	ArrayList<UserInfo> alUser = ac.getUserForPage(pageSize,pageNow);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
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
  		window.location.href="user.jsp?pageNow=" + pageNow.value;
  	}
  </script>
  <body>
<div id="container">
    <div id="right">
    	<div class="content">
       	  <div class="rtbd">
           	<div class="jyjl">
                	<h2><img src="admin/images/ibg1.jpg" />会员管理</h2>
            </div>
                <table class="user" width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  	<th>用户编号</th>
					<th>用户名</th>
					<th>余额</th>
                    <th>邮箱</th>
                    <th>注册时间</th>  
                    <th>用户状态</th>  
					<th>操作</th>
                  </tr>  
                  <%
                  	for(UserInfo user : alUser){
                  	String email=null;                  	
                  	if(user.getUseremail()==null){
  						email="未填写";
  					}
  					else if("".equals(user.getUseremail())){
  						email="未填写";
  					}
  					else{
  						email=user.getUseremail();
  					}  					
                   %>                
                  <tr onmousemove="this.style.backgroundColor='#ffffcc'" onmouseout="this.style.backgroundColor=''">
					<td style="border-left:#D8E7F6 1px solid;"><%=user.getUserId() %></td>
					<td><%=user.getUsername() %></td>
					<td><%=user.getUserye() %>元</td>
					<td><%=email %></td>
					<td><%=user.getUserdate() %></td>
					<td><%if(user.getUserzt()==0){ %>
						<font style="font-size: 12px;color: #393">正常</font>
						<%} else {%>
						<font style="font-size: 12px;color: red">冻结</font>
						<%}%>
					</td>
                    <td>
						<a href="servlet/Admin_UpdateZt?userId=<%=user.getUserId() %>"><img alt="冻结用户" src="admin/images/icon1.gif"></img></a> 						
						| <a href="servlet/Admin_UpdateZt2?userId=<%=user.getUserId() %>"><img alt="解除冻结" src="admin/images/icon2.gif"></img></a>
						| <a href="admin/yecz.jsp?userId=<%=user.getUserId() %>"><img alt="给<%=user.getUserId() %>账户充值" src="admin/images/icon6.gif"></img></a>	
						| <a href="admin/updateuser.jsp?userId=<%=user.getUserId() %>"><img alt="编辑用户" src="admin/images/icon3.gif"></img></a>		
						| <a href="servlet/Admin_deleteUser?userId=<%=user.getUserId() %>" onclick="return confirm('确定要删除吗？')"><img alt="删除用户" src="admin/images/icon4.gif"></img></a>
						| <a href="#"><img alt="给<%=user.getUserId() %>发送站内短信" src="admin/images/icon5.gif"></img></a>	
					</td>                    
                  </tr>
                   <%} %>
                   <tr>
                  		<td style="border-left:#CFE0F0 1px solid;" colspan="7">
                  			<a href="admin/user.jsp?pageNow=1">首页</a>
                  			<a href="admin/user.jsp?pageNow=<%=pageNow-1 %>">上一页</a>                  			
                  			<font style="color: red; font-size: 12px;"><%=pageNow %>/<%=pageCount %></font>
                  			<a href="admin/user.jsp?pageNow=<%=pageNow+1 %>">下一页</a>
                  			<a href="admin/user.jsp?pageNow=<%=pageCount %>">尾页</a>
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
