<%@ page language="java" import="java.util.*,com.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>奥络商城-注册登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
  		#sum{
			border: 1px solid #d9d9d9;
			width: %80;
			height: 980px;
		}
		#top{
			border:1px solid #d9d9d9;
			height:15px;
		}
		#daohang{			
			height:50px;
		}
		#bd{
			border: 1px solid #d9d9d9;
			width: 950px;
			height: 500px;
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
		ol,ul {list-style:none;}
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
		/*==注册登录样式==*/		
		.location,.sortpic{width:100%; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.place{width:948px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.place h1{float:left; font-weight:normal; background:url(images/iconbg.gif) no-repeat 8px 8px; text-indent:34px; color:#7C7C7C;}
		.place span{float:right; margin-right:6px;}
		.place span a,.place span a:visited{color:#AB04C4; background:url(images/iconbg.gif) no-repeat left -66px; padding-left:20px;}
		.bannerbg{background-color:#242424;}
		.reglogin{background:url(images/rlbg.gif) #F7F7F7 no-repeat right bottom;}
		#login{float:left; width:474px; font-size:14px; height:487px; background:url(images/lgbg.gif) repeat-y right top;}
		#login h2{height:78px; background:url(images/regbg.jpg) no-repeat left top; text-indent:-3000px;}
		#login ul{width:348px; margin:20px auto;}
		#login ul li{margin-top:10px; text-align:center;}
		.dlbtn{border-bottom:#B1B1B1 1px dotted; padding-bottom:18px; padding-top:12px;}
		.btnlogin{width:116px; height:34px; background:url(images/regbtn.gif) repeat-x left top; border:0; font-size:14px; color:#FFFFFF; font-weight:bold; cursor:pointer;}
		#login ul li.forget{margin-top:24px;}
		#login ul li.forget a{margin:0px 12px;}
		.tbname{width:180px; height:20px; line-height:20px; border:#B8B8B8 1px solid;}
		#login ul li.remember{text-align:left; padding-left:98px;}		
		
		#reg{float:left; width:474px; font-size:14px;}
		#reg h2{height:78px; background:url(images/regbg.jpg) no-repeat right top; text-indent:-3000px;}
		#reg ul{width:300px; margin:20px 0px 20px 56px;}
		#reg ul li{margin-top:10px;}
		#reg ul li label{display:inline-block; width:74px; text-align:right;}
		.tbbd{width:106px;}
		.tbbd2{width:156px;}
		.btnblue{background-position:left bottom;}
		#reg ul li.regnow{text-align:center;}
		#reg ul li.read{margin-top:28px; margin-bottom:20px;}
		.read a,.read a:visited{color:#006CFF;}
		.sc_tip{text-align:center; padding-top:60px; font-size:14px;}		
  </style>
    <!-- 用户登录验证 -->
  <script type="text/javascript" language="javascript">

  	function login(){  	
  		var yzname =document.getElementById("yzname");
  		var yzpwd =document.getElementById("yzpwd");
  		var userName =document.getElementById("userName");
  		var userPwd =document.getElementById("userPwd");
  		if(userName.value.length<=0){
  			yzname.style.display = "block";
  			return false;
  		}else if(userPwd.value.length<=0){  		
  			yzpwd.style.display = "block";
  			return false;
  		}
  		return true;
  	}
  	function yzName(){
  		var yzname =document.getElementById("yzname");
  		var userName =document.getElementById("userName");
  		if(userName.value.length>0){
  				yzname.style.display = "none";
  		}
  	}
  function yzPwd(){
  		var yzpwd =document.getElementById("yzpwd");
  		var userPwd =document.getElementById("userPwd");
  		if(userPwd.value.length>0){
  				yzpwd.style.display = "none";
  		}
  	}
  </script>
  <!-- 用户注册验证 -->
  <script type="text/javascript" language="javascript">
  	function yzname(){
  		var yzname1 =document.getElementById("yzname1");
  		var yzname2 =document.getElementById("yzname2");
  		var yzname3 =document.getElementById("yzname3");  		
  		var userNameReg =document.getElementById("userNameReg");
		if(userNameReg.value.length<=0){
			yzname2.style.display = "none";
			yzname3.style.display = "none";
  			yzname1.style.display = "block";
  			return false;
  		}
  		else if(userNameReg.value.length<3){
  			yzname1.style.display = "none";
  			yzname3.style.display = "none";			
  			yzname2.style.display = "block";
  			return false;
  		}else{
  			yzname1.style.display = "none";
  			yzname2.style.display = "none";
  			yzname3.style.display = "block";
  			return true;
  		}
  	}
  	 function yzpwd(){
  		var yzpwd1 =document.getElementById("yzpwd1");
  		var yzpwd2 =document.getElementById("yzpwd2");
  		var yzpwd3 =document.getElementById("yzpwd3");  		
  		var userpwdReg =document.getElementById("userpwdReg");
		if(userpwdReg.value.length<=0){
			yzpwd2.style.display = "none";
			yzpwd3.style.display = "none";
  			yzpwd1.style.display = "block";
  			return false;
  		}
  		else if(userpwdReg.value.length<6){
  			yzpwd1.style.display = "none";
  			yzpwd3.style.display = "none";			
  			yzpwd2.style.display = "block";
  			return false;
  		}else{
  			yzpwd1.style.display = "none";
  			yzpwd2.style.display = "none";
  			yzpwd3.style.display = "block";
  			return true;
  		}
  	}
  	 function yzpwd2(){
  		var yztopwd1 =document.getElementById("yztopwd1");
  		var yztopwd2 =document.getElementById("yztopwd2");
  		var yztopwd3 =document.getElementById("yztopwd3");
  		var userpwdReg =document.getElementById("userpwdReg");	
  		var userpwd2Reg =document.getElementById("userpwd2Reg");
		if(userpwd2Reg.value.length<=0){
			yztopwd2.style.display = "none";
			yztopwd3.style.display = "none";
  			yztopwd1.style.display = "block";
  			return false;
  		}
  		else if(userpwd2Reg.value!=userpwdReg.value){
  			yztopwd1.style.display = "none";
  			yztopwd3.style.display = "none";			
  			yztopwd2.style.display = "block";
  			return false;
  		}else{
  			yztopwd1.style.display = "none";
  			yztopwd2.style.display = "none";
  			yztopwd3.style.display = "block";
  			return true;
  		}
  	}
  function yzxm(){
  		var yzxm1 =document.getElementById("yzxm1");
  		var yzxm2 =document.getElementById("yzxm2");
  		var yzxm3 =document.getElementById("yzxm3");  	
  		var realNameReg =document.getElementById("realNameReg");
		if(realNameReg.value.length<=0){
			yzxm2.style.display = "none";
			yzxm3.style.display = "none";
  			yzxm1.style.display = "block";
  			return false;
  		}
  		else if(!isNaN(realNameReg.value)){
  			yzxm1.style.display = "none";
  			yzxm3.style.display = "none";			
  			yzxm2.style.display = "block";
  			return false;
  		}
  		else{
  			yzxm1.style.display = "none";
  			yzxm2.style.display = "none";
  			yzxm3.style.display = "block";
  			return true;
  		}
  	}
  function yzyzm(){
  		var yzm1 =document.getElementById("yzm1");
  		var yzm2 =document.getElementById("yzm2");
  		var yzm3 =document.getElementById("yzm3");  	
  		var changePage =document.getElementById("changePage");
		if(changePage.value.length<=0){
			yzm2.style.display = "none";
			yzm3.style.display = "none";
  			yzm1.style.display = "block";
  			return false;
  		}
  		else if(changePage.value=="0750"){
  			yzm1.style.display = "none";
  			yzm2.style.display = "none";
  			yzm3.style.display = "block";
  			return true;
  		}
  		else{
  			yzm1.style.display = "none";
  			yzm3.style.display = "none";
  			yzm2.style.display = "block";
  			return false;
  		}
  	}
  function yzagree(){		 	
  		var agree =document.getElementById("agree");
		if(!agree.checked){
			alert("您还没有阅读并同意《用户使用条款》");
  			return false;
  		}
  			return true;
 }
  </script>
  </head>  
  <body>
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
			 	 UserInfo user =(UserInfo)session.getAttribute("user");
 			%>
    	<div class="topreg">
    	　　　　您好，欢迎来到奥络商城！<span>当前用户：</span><a href="hy.jsp"><%=user.getUsername() %></a>
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
    	<!-- 注册登录界面 -->
    	<center>
    	 <div class="location">
       	  <div class="place">
           	  <h1>> <a href="index.jsp">首页</a> > 注册/登录</h1>
				<span>					
						<a href="#"></a>
				</span>
          </div>
        </div>
        <div class="product reglogin">
        <div id="bd">
        	<div id="login" align="left">
            	<h2>用户登录</h2>
				<form id="form1" name="form1" method="post" action="servlet/LoginServlef" onsubmit="return login()">
            	<ul>
            		<% 
				       String username =request.getParameter("username");
				     %>
                	<li>账号：
                	  <input class="tbname" type="text" id="userName" name="userName" value="<% if(username!=null){out.print(username);}else{out.print("");} %>" onblur="yzName()"/>
                	  <div id="yzname" style="position: absolute;top: 285px;font-size:14px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 帐号不能为空！</div>
                	</li>
                    <li>密码：
                      <input class="tbname" type="password" id="userPwd" name="userPwd" onblur="yzPwd()"/>
                      <div id="yzpwd" style="position: absolute;top: 315px;font-size:14px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 密码不能为空！</div>
                    </li>
                    <li class="dlbtn">
                      <input class="btnlogin" type="submit" name="button2" id="button2" value="登 录" />
                    </li>
                    <li class="forget"><a href="/reg_getPassword.html">忘记账号？</a> <a href="/reg_getPassword.html">忘记密码？</a></li>
                </ul>
				</form>
            </div>
            <div id="reg" align="left">
            	<h2>新用户注册</h2>
				<form id="form2" name="form2" method="post" action="servlet/AddUserServlef" onsubmit="return yzname() && yzpwd() && yzpwd2() && yzxm() && yzyzm() && yzagree()"><div align="left"> 
            	</div><ul>
                	<li><div align="left"><label>账号：</label> 
                	  <input type="text" class="tbname" name="userNameReg" id="userNameReg" onblur="yzname()"></div>                	
                	</li>
                    <li><div align="left"><label>密码：</label> 
                      <input type="password" class="tbname" name="userpwdReg" id="userpwdReg" onblur="yzpwd()"></div>
                    </li>
                    <li><div align="left"><label>确认密码：</label> 
                      <input type="password" class="tbname" name="userpwd2Reg" id="userpwd2Reg" onblur="yzpwd2()"></div>
                    </li>
                    <li><div align="left"><label>姓名：</label> 
                      <input type="text" class="tbname tbbd" name="realNameReg" id="realNameReg" onblur="yzxm()"></div>
                    </li>
                    <li><div align="left"><label>性别：</label> 
                      <input type="radio" name="userSex" id="radio" value="0" checked="checked"> 
                      男 &nbsp;&nbsp; 
                      <input type="radio" name="userSex" id="radio2" value="1"> 
                      女 
                  </div></li>
                    <li><div align="left"><label>验证码：</label> 
                      <input type="text" class="tbname tbbd" style="width: 50px;" name="changePage" id="changePage" onblur="yzyzm()"><a href="#"><img id="changeCode" src="images/yzm1.bmp"></a></div>
                    </li>
                  <li class="read"><div align="left"><label><input type="checkbox" name="checkbox2" id="agree"></label> 
                    我已阅读并同意<a href="#" target="_blank">《用户使用条款》</a></div></li>
                    <li class="regnow">						
						<input class="btnlogin btnblue" type="submit" name="button2" id="button2" value="立即注册" />
					</li>                    
                </ul>
				</form>
            </div>
            </div>
        </div>
        </center>  
        <!-- 网站底部界面 -->     
   		<center>
   		<div id="db">
   			<img src="images/db1.jpg"></img>	
			<div style="position:absolute;left: 40px;top: 720px;">
			 ●&nbsp;<a href="#">购物流程</a><br>
			 ●&nbsp;<a href="#">发票制度</a><br>
			 ●&nbsp;<a href="#">积分说明</a><br>
			 ●&nbsp;<a href="#">我的奥络</a><br>
			 ●&nbsp;<a href="#">交易条款</a><br>
			 </div>
			<div style="position:absolute;left: 200px;top: 720px;">
			 ●&nbsp;<a href="#">配送时间及运费</a><br>
			 ●&nbsp;<a href="#">加急快递</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">海外配送时间</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">验货与签收</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">订单配送查询</a>&nbsp;&nbsp;&nbsp;<br>
			 </div>
			<div style="position:absolute;left: 370px;top: 720px;">
			 ●&nbsp;<a href="#">货到付款</a><br>
			 ●&nbsp;<a href="#">网上支付</a><br>
			 ●&nbsp;<a href="#">支票支付</a><br>
			 ●&nbsp;<a href="#">银行转帐</a><br>
			 ●&nbsp;<a href="#">奥络礼券</a><br>
			 </div>
			<div style="position:absolute;left: 520px;top: 720px;">
			 ●&nbsp;<a href="#">退换货政策</a><br>
			 ●&nbsp;<a href="#">退换货流程</a><br>
			 ●&nbsp;<a href="#">退货申请</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">换货申请</a>&nbsp;&nbsp;&nbsp;<br>
			&nbsp;&nbsp; ●&nbsp;<a href="#">申请余额提现</a><br>
			 </div>
			<div style="position:absolute;left:690px;top: 720px;">
			 ●&nbsp;<a href="#">奥络礼品卡</a>&nbsp;<br>
			 ●&nbsp;<a href="#">商店街</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">手机奥络网</a>&nbsp;<br>
			 ●&nbsp;<a href="#">出售二手书</a>&nbsp;<br>
			 </div>
			<div style="position:absolute;left:830px;top: 720px;">
			 ●&nbsp;<a href="#">常见问题</a><br>
			 ●&nbsp;<a href="#">找回密码</a><br>
			 ●&nbsp;<a href="#">促销说明</a><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ●&nbsp;<a href="#">退订邮件/短信</a><br>
			 ●&nbsp;<a href="#">联系客服</a><br>
			 </div>	
			 	<div style="position:absolute;left:25px;top:820px;"><a href="#"><img src="images/db2.jpg"></img></a></div>
			 	<div style="position:absolute;left:180px;top:890px;">
			 	<a href="#">公司简介</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">诚征英才</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">百货招商</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">机构销售</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">手机奥络</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">官方Blog</a><br>
				<pre style="color:#7C7C7C;">Copyright (C) 奥络商城2004-2012, All Rights Reserved <a href="#">京ICP证041189号</a></pre>
			 	<a href="#"><img src="images/db3.gif"></img></a>&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/db4.png"></img></a>
			 	</div> 			 	 
   		</div>
   		</center>
   		<!-- 注册验证用到的层 -->
   		<div id="yzname1" style="position: absolute;top: 290px;left: 823px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 帐号不能为空！</div>
   		<div id="yzname2" style="position: absolute;top: 290px;left: 823px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 帐号不能小于3位！</div>
   		<div id="yzname3" style="position: absolute;top: 290px;left: 823px;color:#090;display: none;"><img src="images/reg_yesok.gif"></img> 恭喜，帐号可以使用！</div>
   		<div id="yzpwd1" style="position: absolute;top: 322px;left: 823px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 密码不能为空！</div>
   		<div id="yzpwd2" style="position: absolute;top: 322px;left: 823px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 密码长度不能小于6位！</div>
   		<div id="yzpwd3" style="position: absolute;top: 322px;left: 823px;color:#090;display: none;"><img src="images/reg_yesok.gif"></img> 恭喜，密码可以使用！</div>
   		<div id="yztopwd1" style="position: absolute;top: 357px;left: 823px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 确认密码不能为空！</div>
   		<div id="yztopwd2" style="position: absolute;top: 357px;left: 823px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 两次输入密码不一致！</div>
   		<div id="yztopwd3" style="position: absolute;top: 357px;left: 823px;color:#090;display: none;"><img src="images/reg_yesok.gif"></img> 密码输入正确！</div>
   		<div id="yzxm1" style="position: absolute;top: 390px;left: 750px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 姓名不能为空！</div>
   		<div id="yzxm2" style="position: absolute;top: 390px;left: 750px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 姓名格式错误！</div>
   		<div id="yzxm3" style="position: absolute;top: 390px;left: 750px;color:#090;display: none;"><img src="images/reg_yesok.gif"></img> 姓名可以使用！</div>
   		<div id="yzm1" style="position: absolute;top: 455px;left: 763px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 验证码不能为空！</div>
   		<div id="yzm2" style="position: absolute;top: 455px;left: 763px;color:red;display: none;"><img src="images/reg_yesno.gif"></img> 验证码错误！</div>
   		<div id="yzm3" style="position: absolute;top: 455px;left: 763px;color:#090;display: none;"><img src="images/reg_yesok.gif"></img> 验证码正确！</div>
    </div>
  </body>
</html>
