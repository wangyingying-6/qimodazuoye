<%@ page language="java" import="java.util.*,com.dao.*,com.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
if(session.getAttribute("user") == null){  			
  				response.sendRedirect("reg.jsp");  					
  				return ;
  }
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>奥络商城-会员中心</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <style type="text/css">
  		#sum{
			border: 1px solid #d9d9d9;
			width: %80;
			height: 950px;
		}
		#top{
			border:1px solid #d9d9d9;
			height:15px;
		}
		#daohang{			
			height:50px;
		}
		#main{
			border: 1px solid #d9d9d9;
			width: 700px;
			height: 500px;
		}
		#hy{
			border: 1px solid #d9d9d9;
			width: 180px;
			height: 500px;
			position:absolute;
			left: 150px;
		}
		#hyzl{
			border: 1px solid #d9d9d9;
			width: 520px;
			height: 500px;
			position:absolute;
			left: 330px;
		}
		#xgzl{
			border: 1px solid #d9d9d9;
			width: 520px;
			height: 500px;
			position:absolute;
			left: 330px;
		}
		#xgmm{
			border: 1px solid #d9d9d9;
			width: 520px;
			height: 500px;
			position:absolute;
			left: 330px;
		}
		#xgaddr{
			border: 1px solid #d9d9d9;
			width: 520px;
			height: 500px;
			position:absolute;
			left: 330px;
		}
		#ygmsp{
			border: 1px solid #d9d9d9;
			width: 520px;
			height: 500px;
			position:absolute;
			left: 330px;
		}
		#sc{
			border: 1px solid #d9d9d9;
			width: 520px;
			height: 500px;
			position:absolute;
			left: 330px;
		}
		#db{			
			width: 100%;
			height: 260px;
		}
		/*==顶部信息==*/
		.topreg{float:left;}
		.topreg a:link{color:#029CFC;},.topreg a:visited{color:#029CFC;}
		.topreg span{color:#8E8E8E;}
		.topinfo{float:right; color:#AFAFAF;}
		
				/*==全局样式==*/
		body,div,ul,ol,li,dl,dt,dd,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,table,p,th,td,img{margin:0px; padding:0px;}
		body { width:100%; font:normal 12px/1.5 "微软雅黑","Microsoft Sans Serif", Verdana,Tahoma,simsun, Lucida, Arial; background-color:#fff; color:#000;}
		input,select,form img,button {vertical-align:middle; }
		input{ font-size:12px;}
		img {border:0;}
		h1,h2,h3,h4,h5,h6 {font-size:100%;}
		em,i{font-style:normal;}
		a:link{text-decoration:none; color:#737373;}
		a:visited{text-decoration:none; color:#737373;}
		a:hover{text-decoration:underline;}
		.clear {clear:both; *display:inline;/*IE only*/}
				/*＝＝导航栏样式＝＝*/	
		.nav2{background:url(images/navbg.gif) repeat-x left top;}
		.nav{background:url(images/navybg.gif) repeat-x left top;}
		.navlist{width:80%; margin:0px auto;}
		.navlist ul{float:left;}
		.navlist li{float:left; height:40px; display:inline; margin-right:5px;}
		.navlist li a{display:inline-block; color:#FFFFFF; font-weight:bold; height:50px; line-height:40px; padding:0px 16px;}
		.navlist li a:visited{color:#FFFFFF;}
		.navlist li a.navslt,.navlist li a:hover{background:url(images/sltbg.gif) repeat-x left top; text-decoration:none;}
		.navlist2 li a.navslt,.navlist2 li a:hover{background:url(images/sltybg.gif) repeat-x left top;}
		/*==我的账户/购物车样式==*/
		.goodscart{float:right; height:50px;position:absolute;left:80%; color:#FFFFFF; padding:0px 10px; background:url(images/hbg.gif) repeat-x left top;}
		.goodscart p{background:url(images/hiconbg.gif) no-repeat left center; line-height:38px; padding-left:20px;}
		.goodscart a,.goodscart a:visited{color:#FFFFFF;}
		.goodscart span{margin-left:40px;}
		.goodscart span a,.goodscart span a:visited{color:#FF9700; font-weight:bold;} 
		/*==当前位置样式==*/		
		.location,.sortpic{width:100%; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.place{width:700px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.place h1{float:left; font-weight:normal; background:url(images/iconbg.gif) no-repeat 8px 8px; text-indent:34px; color:#7C7C7C;}		
  		/*==会员中心==*/
  		.hy h2{position:absolute;left:-12px; width:190px; height:32px; line-height:24px; color:#FFFFFF; font-size:14px; background-image:url(images/menubg.gif); text-indent:5px; z-index:99;}
  		.hy a:hover{color:#F90; text-decoration: none;}
  		table{border-collapse: collapse;}
  		th{border: 0px solid #BBB;font-size: 12px;}
  		td{border: 1px solid #BBB;font-size: 12px;}
  		.btnbg{width:81px;height:23px; border:0;background:url(images/btnbg.gif)}
  </style>
  <script type="text/javascript" language="javascript">
  		 /*会员信息*/
  		 function hyxx(){
  			var hyzl =document.getElementById("hyzl");
  			var xgzl =document.getElementById("xgzl");
  			var xgmm =document.getElementById("xgmm");
  			var xgaddr =document.getElementById("xgaddr");
  			var ygmsp =document.getElementById("ygmsp");
  			var sc =document.getElementById("sc");
  			
  			xgzl.style.display="none";
  			xgmm.style.display="none";
  			xgaddr.style.display="none";
  			ygmsp.style.display="none";
  			sc.style.display="none";
  			
  			hyzl.style.display="block";  					
  		}
  		
  		/*修改资料*/
  		 function xgzl(){
  			var hyzl =document.getElementById("hyzl");
  			var xgzl =document.getElementById("xgzl");
  			var xgmm =document.getElementById("xgmm");
  			var xgaddr =document.getElementById("xgaddr");
  			var ygmsp =document.getElementById("ygmsp");
  			var sc =document.getElementById("sc");
  			
  			hyzl.style.display="none";
  			xgmm.style.display="none";
  			xgaddr.style.display="none";
  			ygmsp.style.display="none";
  			sc.style.display="none";
  			
  			xgzl.style.display="block";
  		}
  		
  		/*修改密码*/
  		function xgmm(){
  			var hyzl =document.getElementById("hyzl");
  			var xgzl =document.getElementById("xgzl");
  			var xgmm =document.getElementById("xgmm");
  			var xgaddr =document.getElementById("xgaddr");
  			var ygmsp =document.getElementById("ygmsp");
  			var sc =document.getElementById("sc");
  			
  			hyzl.style.display="none";
  			xgzl.style.display="none";
  			xgaddr.style.display="none";
  			ygmsp.style.display="none";
  			sc.style.display="none";
  			
  			xgmm.style.display="block";
  		}
  		/*收货地址*/
  		 function shdz(){
  			var hyzl =document.getElementById("hyzl");
  			var xgzl =document.getElementById("xgzl");
  			var xgmm =document.getElementById("xgmm");
  			var xgaddr =document.getElementById("xgaddr");
  			var ygmsp =document.getElementById("ygmsp");
  			var sc =document.getElementById("sc");
  			
  			hyzl.style.display="none";
  			xgzl.style.display="none";
  			xgmm.style.display="none";  			
  			ygmsp.style.display="none";
  			sc.style.display="none";
  			
  			xgaddr.style.display="block";
  		}
   		/*已购买商品*/
  		 function ygmsp(){
  			var hyzl =document.getElementById("hyzl");
  			var xgzl =document.getElementById("xgzl");
  			var xgmm =document.getElementById("xgmm");
  			var xgaddr =document.getElementById("xgaddr");
  			var ygmsp =document.getElementById("ygmsp");
  			var sc =document.getElementById("sc");
  			
  			hyzl.style.display="none";
  			xgzl.style.display="none";
  			xgmm.style.display="none";  			
  			xgaddr.style.display="none";
  			sc.style.display="none";
  			
  			ygmsp.style.display="block";
  		}
    	/*收藏夹*/
  		 function scj(){
  			var hyzl =document.getElementById("hyzl");
  			var xgzl =document.getElementById("xgzl");
  			var xgmm =document.getElementById("xgmm");
  			var xgaddr =document.getElementById("xgaddr");
  			var ygmsp =document.getElementById("ygmsp");
  			var sc =document.getElementById("sc");
  			
  			hyzl.style.display="none";
  			xgzl.style.display="none";
  			xgmm.style.display="none";  			
  			xgaddr.style.display="none";
  			ygmsp.style.display="none";
  			
  			sc.style.display="block";
  		} 		
  		/*验证资料*/
  		function yzzl(){
  			var userXm =document.getElementById("userXm");
  			var userEmail =document.getElementById("userEmail");
  			var userPhone =document.getElementById("userPhone");
  			var userSj =document.getElementById("userSj");
  			var userAddr =document.getElementById("userAddr");
  			var userYb =document.getElementById("userYb");  
  			/*验证邮箱表达式*/			
  			var str =/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
  			/*电话号码表达式*/
  			var str1 =/\d{4}-\d{7}|\d{3}-\d{8}/;
  			/*手机号码表达式*/
  			var str2 =/^1[3,5,8]\d{9}$/;
  			
  			if(userXm.value.length<=0){
				alert("姓名不能为空！");
  				return false;
  			}else if(!isNaN(userXm.value)){
	  			alert("姓名格式错误！");
  				return false;
  			}  			
			if(userEmail.value.length<=0){
				alert("邮箱不能为空！");
				return false;
			}else if(!str.test(userEmail.value)){
				alert("邮箱格式错误！");
				return false;
			}
			if(userPhone.value.length<=0){
				alert("联系电话不能为空！");
				return false;
			}else if(!str1.test(userPhone.value)){
				alert("联系电话格式错误！");
				return false;
			}
			if(userSj.value.length<=0){
				alert("手机号码不能为空！");
				return false;
			}else if(!str2.test(userSj.value)){
				alert("手机号码格式错误！");
				return false;
			}
			if(userAddr.value.length<=0){
				alert("收货地址不能为空！");
				return false;
			}
			if(userYb.value.length<=0){
				alert("邮政编码不能为空！");
				return false;
			}else if(isNaN(userYb.value)){
				alert("邮政编码格式错误！");
				return false;
			}else if(userYb.value.length<5){
				alert("邮政编码长度错误！");
				return false;
			}
  		}
  		/*验证密码*/
  		function yzmm(){
  			var jmm = document.getElementById("jmm");
  			var pwd = document.getElementById("pwd");
  			var pwd2 = document.getElementById("pwd2");
  			if(jmm.value.length<=0){
  				alert("请输入旧密码！");
  				return false;
  			}else if(jmm.value.length<6){
  				alert("密码长度不能小于6！");
  				return false;
  			}
  			if(pwd.value.length<=0){
  				alert("请输入新密码！");
  				return false;
  			}else if(pwd.value.length<6){
  				alert("密码长度不能小于6！");
  				return false;
  			}
  			if(pwd2.value.length<=0){
  				alert("请输入确认密码！");
  				return false;
  			}else if(pwd2.value.length<6){
  				alert("密码长度不能小于6！");
  				return false;
  			}
  			if(pwd2.value!=pwd.value){
  				alert("两次输入密码不一致！");
  				return false;
  			}   					
  		}
  		function yzaddr(){  		
  			var bm2 =document.getElementById("bm2");  
  			var addr2 =document.getElementById("addr2");
  			if(bm2.value.length<=0){
				alert("邮政编码不能为空！");
				return false;
			}else if(isNaN(bm2.value)){
				alert("邮政编码格式错误！");
				return false;
			}else if(bm2.value.length<5){
				alert("邮政编码长度错误！");
				return false;
			}
			if(addr2.value.length<=0){
				alert("收货地址不能为空！");
				return false;
			}
  		}
  	
  </script>
  </head>  
  <body>
  	<%
  			UserInfo user1 =(UserInfo)session.getAttribute("user");
  			int userid =user1.getUserId();
  			UserCrtl uc = new UserCrtl();
 			UserInfo user =uc.selUser(userid);
  			String addr =null;
  			String yb =null;
  			String email=null;
  			String sj =null;
  			String phone=null;
  			if(user.getUseraddr()==null){
  				addr="未填写";
  			}
  			else if("".equals(user.getUseraddr())){
  				addr="未填写";
  			}
  			else{
  				addr=user.getUseraddr();
  			}
  			if(user.getUseryb()==null){
  				yb="未填写";
  			}
  			else if("".equals(user.getUseryb())){
  				yb="未填写";
  			}
  			else{
  				yb=user.getUseryb();
  			}
  			if(user.getUseremail()==null){
  				email="未填写";
  			}
  			else if("".equals(user.getUseremail())){
  				email="未填写";
  			}
  			else{
  				email=user.getUseremail();
  			}
  			if(user.getUsersj()==null){
  				sj="未填写";
  			}
  			else if("".equals(user.getUsersj())){
  				sj="未填写";
  			}
  			else{
  				sj=user.getUsersj();
  			}
  			if(user.getUserphone()==null){
  				phone="未填写";
  			}
  			else if("".equals(user.getUserphone())){
  				phone="未填写";
  			}
  			else{
  				phone=user.getUserphone();
  			}		
  	 %>
    <div id="sum">      	
    	<!-- 网站顶部信息 -->  	
    	<div id="top">
    	<%
			if(session.getAttribute("user") == null){  	
		%>
			<div class="topreg">
    	　　　　您好，欢迎来到奥络商城！<a href="reg.jsp">[请登录]</a><span>，新用户？</span><a href="reg.jsp">[免费注册]</a>
    		</div>
			<%
			  }else{			 	
 			%>
    	<div class="topreg">
    	　　　　您好，欢迎来到奥络商城！<span>当前用户：</span><a href="hy.jsp"><%=user1.getUsername() %></a>
    	</div>
    	<%} %>   
    	<div class="topinfo">
    	<a href="#">收藏的商品</a> <img src="images/plug.gif"></img> |
    	<a href="javascript:void(0)" onClick="window.external.addFavorite('http://www.safe-120.com/','	深圳XX科技有限公司');" rel="sidebar">收藏本站</a> <img src="images/plug.gif"></img> | 
    	<a href="javascript:void(0)" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.you9125.com/');">设为首页</a> <img src="images/plug.gif"></img>
    	</div>    	
    	</div>
    	<!-- 网站LOGO -->
    	<div id="logo">
    	<br/>
    	　　<a href="index.jsp"><img src="images/logo.jpg"></img></a>
    			<div style="position: absolute;left: 218px;top: 36px;"><a href="#"><img src="images/index_gg.gif"></img></a></div>
    	</div>
    	<!-- 导航栏 -->
    	<div id="daohang">  
    	 <div class="nav2">
        	<div class="navlist">
            	<ul>
            		<li></li><li></li><li></li><li></li><li></li>
            		<li></li><li></li><li></li><li></li><li></li>
            		<li></li><li></li><li></li><li></li><li></li>
            		<li></li><li></li><li></li><li></li><li></li>
             		<li></li><li></li><li></li><li></li><li></li> 
             		<li></li><li></li><li></li><li></li><li></li>                      		
                    <li><a class="navslt" href="index.jsp">首页</a></li>
					<li><a href="togoods.jsp">最新商品</a></li>
					<li><a href="search.jsp?tj=goodsTuijian">推荐商品</a></li>
					<li><a href="news.jsp">新闻资讯</a></li>
					<li><a href="search.jsp?tj=goodsXianliang">限量商品</a></li>
					<li><a href="search.jsp?tj=goodsTejia">特价商品</a></li>
					<li><a href="search.jsp?tj=goodsCuxiao">促销商品</a></li>              
                </ul>
                <div class="goodscart" style="width: 200px;height: 50px;"><p><a href="hy.jsp">我的账户</a> <span><a href="purchase.jsp">我的购物车</a></span></p>
                </div>             
            </div>
        </div>
    	</div>
    	<!-- 会员中心界面 -->
    	<center>
        <div id="main">        	
			<div id="hy" class="hy">
			<div><h2>会员中心</h2></div><br/><br/>
				<img src="images/1.gif"></img>&nbsp;<a href="javascript:hyxx()">会员信息</a>	<br/>
				<img src="images/2.gif"></img>&nbsp;<a href="javascript:xgzl()">修改资料</a><br/>
				<img src="images/3.gif"></img>&nbsp;<a href="javascript:xgmm()">修改密码</a><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/4.gif"></img>&nbsp;<a href="javascript:shdz()">收货地址管理</a><br/>
				&nbsp;&nbsp;&nbsp;<img src="images/5.gif"></img>&nbsp;<a href="javascript:ygmsp()">已购买商品</a><br/>
				&nbsp;&nbsp;&nbsp;<img src="images/6.gif"></img>&nbsp;<a href="javascript:scj()">我的收藏夹</a><br/>	
				<img src="images/7.gif"></img>&nbsp;<a href="servlet/UserZxServlet">注销登录</a>	<br/>
			</div>
			<!-- 默认显示的会员资料层 -->
			<div id="hyzl" style="display: block">
				<br>
				<table style="width: 500px;">
					<tr>
						<th><font style="font-size: 15px;">我的会员信息</font></th>
						<th align="right"><font style="font-size: 15px;">欢迎：</font><font style="font-size: 15px;color: #00F "><%=user.getUserxm() %></font></th>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">用户名：</td>
						<td><%=user.getUsername() %></td>
					</tr>					
					<tr>
						<td style="width: 150px;" align="right">姓名：</td>
						<td><%=user.getUserxm() %></td>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">余额：</td>
						<td><font style="color:red"><%=user.getUserye() %>元</font></td>
					</tr>	
					<tr>
						<td style="width: 150px;" align="right">电子邮件：</td>
						<td><%=email %></td>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">邮编：</td>
						<td><%=yb %></td>
					</tr>	
					<tr>
						<td style="width: 150px;" align="right">收货地址：</td>
						<td><%=addr%></td>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">手机号码：</td>
						<td><%=sj %></td>
					</tr>											
					<tr>
						<td style="width: 150px;" align="right">联系电话：</td>
						<td><%=phone %></td>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">注册时间：</td>
						<td><%=user.getUserdate() %></td>
					</tr>																								
				</table>
			</div>
        	<!-- 修改资料层 -->
        	<div id="xgzl" style="display: none">
				<br>
				<form action="servlet/UpdateUserServlet" method="post" onsubmit="return yzzl()">
				<table style="width: 500px;">
					<tr>
						<th><font style="font-size: 15px;">修改资料</font></th>
						<th></th>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">用户名：</td>
						<td><%=user.getUsername() %><input type="hidden" name="userId" value="<%=user1.getUserId() %>"/> </td>
					</tr>					
					<tr>
						<td style="width: 150px;" align="right">姓名：</td>
						<td><input type="text" name="userXm" id="userXm" style="width: 80px;" value="<%=user.getUserxm() %>"/></td>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">性别：</td>
						<td><input type="radio" name="userSex" id="radio" value="0" <%if(user.getUsersex()==0){out.print("checked='checked'");} %>>男
                     		<input type="radio" name="userSex" id="radio2" value="1" <%if(user.getUsersex()==1){out.print("checked='checked'");} %>>女
                     	</td>
					</tr>	
					<tr>
						<td style="width: 150px;" align="right">电子邮箱：</td>
						<td><input type="text" name="userEmail" id="userEmail" value="<%if(user.getUseremail()==null){out.print("");}else{out.print(user.getUseremail());} %>"/></td>
					</tr>	
					<tr>
						<td style="width: 150px;" align="right">联系电话：</td>
						<td><input type="text" name="userPhone" id="userPhone" value="<%if(user.getUserphone()==null){out.print("");}else{out.print(user.getUserphone());} %>"/></td>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">手机号码：</td>
						<td><input type="text" name="userSj" id="userSj" value="<%if(user.getUsersj()==null){out.print("");}else{out.print(user.getUsersj());} %>"/></td>
					</tr>	
					<tr>
						<td style="width: 150px;" align="right">收货地址：</td>
						<td><input type="text" name="userAddr" id="userAddr" style="width: 200px;" value="<%if(user.getUseraddr()==null){out.print("");}else{out.print(user.getUseraddr());} %>" /></td>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">邮政编码：</td>
						<td><input type="text" name="userYb" id="userYb" style="width: 80px;" value="<%if(user.getUseryb()==null){out.print("");}else{out.print(user.getUseryb());} %>" /></td>
					</tr>																				
					<tr>
						<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btnbg" type="submit" value="确认修改"/>
						</td>
					</tr>																								
				</table>
				</form>
			</div>
        	<!--修改密码层 -->
        	<div id="xgmm" style="display: none">
				<br>
				<form action="servlet/UpdatePwdServlet" method="post" onsubmit="return yzmm()">
				<table style="width: 500px;">
					<tr>
						<th><font style="font-size: 15px;">修改密码</font><input type="hidden" name="userId" value="<%=user1.getUserId() %>"/></th>
						<th></th>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">请输入旧密码：</td>
						<td><input type="password" name="jmm" id="jmm"/></td>
					</tr>					
					<tr>
						<td style="width: 150px;" align="right">请输入新密码：</td>
						<td><input type="password" name="pwd" id="pwd"/></td>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">确认新密码：</td>
						<td><input type="password" name="pwd2" id="pwd2"/></td>
					</tr>	
					<tr>
						<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btnbg" type="submit" value="确认修改"/>
						</td>
					</tr>																								
				</table>
				</form>
			</div>
       		<!--收货地址层 -->
       		<div id="xgaddr" style="display: none">
				<br>
				<form action="servlet/UpdateAddrServlet" method="post" onsubmit="return yzaddr()">
				<table style="width: 500px;">
					<tr>
						<th><font style="font-size: 15px;">收货地址管理</font><input type="hidden" name="userId" value="<%=user1.getUserId() %>"/></th>
						<th align="right"><font style="font-size: 12px;">（请您务必填写真实的收货地址）</font></th>
					</tr>
					<tr>
						<td style="width: 150px;" align="right">邮政编码：</td>
						<td><input type="text" name="userYb2" id="userYb2" style="width: 80px;" value="<%if(user.getUseryb()==null){out.print("");}else{out.print(user.getUseryb());} %>"/></td>
					</tr>					
					<tr>
						<td style="width: 150px;" align="right">收货地址：</td>
						<td><input type="text" name="userAddr2" id="userAddr2" style="width: 200px;" value="<%if(user.getUseraddr()==null){out.print("");}else{out.print(user.getUseraddr());} %>"/></td>
					</tr>	
					<tr>
						<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btnbg" type="submit" value="确认修改"/>
						</td>
					</tr>																								
				</table>
				</form>
			</div>
        	<!--已购买商品层 -->
       		<div id="ygmsp" style="display: none">
				<br>			
				<table style="width: 520px;border: 1px solid #BBB;">
					<tr>
						<th>订单号</th>
						<th>商品名</th>
						<th>价格</th>
						<th>订单状态</th>						
						<th>操作</th>
					</tr>				
					<%
					 	OrderCtrl oc = new OrderCtrl();
		           	 	ArrayList<OrderInfo> aorder = oc.UserOrder(userid);
		           	 	if(aorder == null){
           	 		 %>
					<tr>
						<td align="center" colspan="5">您未购买过商品！赶快下单把。。。</td>
					</tr>
					<%} else{
		           	 		for(OrderInfo order : aorder){
		           	%>		           		
						<tr>
							<td align="center"><a href="selorder.jsp?orderId=<%=order.getOrderId() %>" target="_"><%=order.getOrderId() %></a></td>
							<td align="center"><a href="goodsinfo.jsp?goodsId=<%=order.getGoodsId() %>" target="_"><%=order.getGoodsname() %></a></td>
							<td align="center"><%=order.getGoodsprice() %></td>
							<td align="center">
								<%if("交易成功".equals(order.getOrderzt())){ %>
								<font style="font-size: 12px;color: #393">交易成功</font>
								<% } else if("未付款".equals(order.getOrderzt())){ %>
								<font style="font-size: 12px;color: #999">未付款</font>
								<% } else if("正在处理".equals(order.getOrderzt())){ %>
								<font style="font-size: 12px;color: #00F">正在处理</font>
								<%} else {%>
								<font style="font-size: 12px;color: red">交易失败</font>
								<%}%>
							</td>						
							<td align="center"><a href="selorder.jsp?orderId=<%=order.getOrderId() %>" target="_">查看</a></td>												
						</tr>
					<%} } %>																			
				</table>
			</div>
        	<!--我的收藏层 -->
       		<div id="sc" style="display: none">
				<br>				
				<table style="width: 500px;border: 1px solid #BBB;">
					<tr>						
						<th>商品名</th>						
						<th>操作</th>
					</tr>
					<tr>						
						<td align="center"><a href="#"></a></td>
						<td align="center" style="width: 50px;">
						<a href="#">查看</a><br/>
						<a href="#">删除</a>
						</td>												
					</tr>																					
				</table>
			</div>
        </div>
        </center>  
        <!-- 网站底部界面 -->     
   		<center>
   		<div id="db">
   			<img src="images/db1.jpg"></img>	
			<div style="position:absolute;left: 40px;top: 690px;">
			 ●&nbsp;<a href="#">购物流程</a><br>
			 ●&nbsp;<a href="#">发票制度</a><br>
			 ●&nbsp;<a href="#">积分说明</a><br>
			 ●&nbsp;<a href="#">我的奥络</a><br>
			 ●&nbsp;<a href="#">交易条款</a><br>
			 </div>
			<div style="position:absolute;left: 200px;top: 690px;">
			 ●&nbsp;<a href="#">配送时间及运费</a><br>
			 ●&nbsp;<a href="#">加急快递</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">海外配送时间</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">验货与签收</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">订单配送查询</a>&nbsp;&nbsp;&nbsp;<br>
			 </div>
			<div style="position:absolute;left: 370px;top: 690px;">
			 ●&nbsp;<a href="#">货到付款</a><br>
			 ●&nbsp;<a href="#">网上支付</a><br>
			 ●&nbsp;<a href="#">支票支付</a><br>
			 ●&nbsp;<a href="#">银行转帐</a><br>
			 ●&nbsp;<a href="#">奥络礼券</a><br>
			 </div>
			<div style="position:absolute;left: 520px;top: 690px;">
			 ●&nbsp;<a href="#">退换货政策</a><br>
			 ●&nbsp;<a href="#">退换货流程</a><br>
			 ●&nbsp;<a href="#">退货申请</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">换货申请</a>&nbsp;&nbsp;&nbsp;<br>
			&nbsp;&nbsp; ●&nbsp;<a href="#">申请余额提现</a><br>
			 </div>
			<div style="position:absolute;left:690px;top: 690px;">
			 ●&nbsp;<a href="#">奥络礼品卡</a>&nbsp;<br>
			 ●&nbsp;<a href="#">商店街</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">手机奥络网</a>&nbsp;<br>
			 ●&nbsp;<a href="#">出售二手书</a>&nbsp;<br>
			 </div>
			<div style="position:absolute;left:830px;top: 690px;">
			 ●&nbsp;<a href="#">常见问题</a><br>
			 ●&nbsp;<a href="#">找回密码</a><br>
			 ●&nbsp;<a href="#">促销说明</a><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ●&nbsp;<a href="#">退订邮件/短信</a><br>
			 ●&nbsp;<a href="#">联系客服</a><br>
			 </div>	
			 	<div style="position:absolute;left:25px;top:790px;"><a href="#"><img src="images/db2.jpg"></img></a></div>
			 	<div style="position:absolute;left:180px;top:860px;">
			 	<a href="#">公司简介</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">诚征英才</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">百货招商</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">机构销售</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">手机奥络</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">官方Blog</a><br>
				<pre style="color:#7C7C7C;">Copyright (C) 奥络商城2004-2012, All Rights Reserved <a href="#">京ICP证041189号</a></pre>
			 	<a href="#"><img src="images/db3.gif"></img></a>&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/db4.png"></img></a>
			 	</div> 			 	 
   		</div>
   		</center>
    </div>
  </body>
</html>
