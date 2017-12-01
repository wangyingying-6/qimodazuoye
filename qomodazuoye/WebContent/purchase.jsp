<%@ page language="java" import="java.util.*,com.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>奥络商城-购物车</title>
    
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
			height: 820px;
		}
		#top{
			border:1px solid #d9d9d9;
			height:15px;
		}
		#daohang{			
			height:50px;
		}
		#gwc{
			border: 1px solid #d9d9d9;
			width: 700px;
			height: 330px;
		}
		#db{			
			width: 100%;
			height: 260px;
		}
		table {
		border-collapse: collapse;   
		border: 0px solid #888;
		}   
		th {
		background-color: #CCC; 
		}   
		td {   
		background-color: #EFEFEF;   
		border: 2px solid #BBB;   
		}
		/*==顶部信息==*/
		.topreg{float:left;}
		.topreg a:link{color:#029CFC;},.topreg a:visited{color:#029CFC;}
		.topreg span{color:#8E8E8E;}
		.topinfo{float:right; color:#AFAFAF;}
		
				/*==全局样式==*/
		body,div,ul,ol,li,dl,dt,dd,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,table,p,th,td,img{margin:0px; padding:0px;}
		body { width:100%; font:normal 12px/1.5 "微软雅黑","Microsoft Sans Serif", Verdana,Tahoma,simsun, Lucida, Arial; background-color:#fff; color:#000;}
		ol,{list-style:none;}
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
		.place span{float:right; margin-right:6px;}
		.place span a,.place span a:visited{color:#AB04C4; background:url(images/iconbg.gif) no-repeat left -66px; padding-left:20px;}
   		.sl{width: 25px;height:18px;color:#FE6D02; font-size:12px; font-weight:bold;text-align: center;}
   </style>
   <script type="text/javascript">
   	function zsl(){
		var sl =document.getElementById("sl");
		sl.value++;
	}
	function jsl(){
		var sl =document.getElementById("sl");
		if(sl.value<=1){
			sl.value=1;
		}else{
			sl.value--;
		}
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
    	<!-- 当前位置界面 -->
    	<center>
    	 <div class="location">
       	  <div class="place">
       	  	<img src="images/cart_step1.jpg"></img>
          </div>
        </div>
        </center> 
        <!-- 购物车界面 -->
        <center>
        <div id="gwc">
       	<table align="right" style="width: 700px;">
       		<tr>
       			<th style="border:1px; height:10px;"><center>商品名</center></th>
       			<th style="border:1px; height:10px;"><center>数量</center></th>
       			<th style="border:1px; height:10px;"><center>价格</center></th>
       			<th style="border:1px; height:10px;"><center>运费</center></th>
       			<th style="border:1px; height:10px;"><center>操作</center></th>
       		</tr>
       		<tr>
       			<td><center><a href="#"><font size="2"color="#0000ff"></font></a></center></td>
       			<td style="width: 60px;"><center><a href="javascript:jsl()"><img src="images/subtract.gif"></img></a>&nbsp;<input type="text" class="sl" name="sl" id="sl" value="1" />&nbsp;<a href="javascript:zsl()"><img src="images/adding.gif"></img></a></center></td>
       			<td style="width: 15%"><center><font style="color: #999">￥</font><font style="color: #FE6D02"></font></center></td>
       			<td style="width: 15%"><center><font style="color: #999">￥</font><font style="color: #FE6D02"></font></center></td>
       			<td style="width: 15%"><center><a href="#"><font color="red">删除</font></a></center></td>
       		</tr>  	
			<tr style="position: absolute;top: 470px;height: 40px;">
       			<td colspan="5" style="border: 1"><a href="#"><img style="position: absolute;top:6px;left: 15px;" src="images/an_car1.gif"></img></a><center>总计：<font color="#FE6D02">元</font></center><a href="#"><img style="position: absolute;right: 10px;top:4px;" align="right" src="images/an_js.gif"></img></a></td>
       		</tr>  		    		
       	</table>
        </div> 
        </center>
        <!-- 网站底部界面 -->     
   		<center>
   		<div id="db">
   			<img src="images/db1.jpg"></img>	
			<div style="position:absolute;left: 40px;top: 560px;">
			 ●&nbsp;<a href="#">购物流程</a><br>
			 ●&nbsp;<a href="#">发票制度</a><br>
			 ●&nbsp;<a href="#">积分说明</a><br>
			 ●&nbsp;<a href="#">我的奥络</a><br>
			 ●&nbsp;<a href="#">交易条款</a><br>
			 </div>
			<div style="position:absolute;left: 200px;top: 560px;">
			 ●&nbsp;<a href="#">配送时间及运费</a><br>
			 ●&nbsp;<a href="#">加急快递</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">海外配送时间</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">验货与签收</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">订单配送查询</a>&nbsp;&nbsp;&nbsp;<br>
			 </div>
			<div style="position:absolute;left: 370px;top: 560px;">
			 ●&nbsp;<a href="#">货到付款</a><br>
			 ●&nbsp;<a href="#">网上支付</a><br>
			 ●&nbsp;<a href="#">支票支付</a><br>
			 ●&nbsp;<a href="#">银行转帐</a><br>
			 ●&nbsp;<a href="#">奥络礼券</a><br>
			 </div>
			<div style="position:absolute;left: 520px;top: 560px;">
			 ●&nbsp;<a href="#">退换货政策</a><br>
			 ●&nbsp;<a href="#">退换货流程</a><br>
			 ●&nbsp;<a href="#">退货申请</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">换货申请</a>&nbsp;&nbsp;&nbsp;<br>
			&nbsp;&nbsp; ●&nbsp;<a href="#">申请余额提现</a><br>
			 </div>
			<div style="position:absolute;left:690px;top: 560px;">
			 ●&nbsp;<a href="#">奥络礼品卡</a>&nbsp;<br>
			 ●&nbsp;<a href="#">商店街</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">手机奥络网</a>&nbsp;<br>
			 ●&nbsp;<a href="#">出售二手书</a>&nbsp;<br>
			 </div>
			<div style="position:absolute;left:830px;top: 560px;">
			 ●&nbsp;<a href="#">常见问题</a><br>
			 ●&nbsp;<a href="#">找回密码</a><br>
			 ●&nbsp;<a href="#">促销说明</a><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ●&nbsp;<a href="#">退订邮件/短信</a><br>
			 ●&nbsp;<a href="#">联系客服</a><br>
			 </div>	
			 	<div style="position:absolute;left:25px;top:660px;"><a href="#"><img src="images/db2.jpg"></img></a></div>
			 	<div style="position:absolute;left:180px;top:730px;">
			 	<a href="#">公司简介</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">诚征英才</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">百货招商</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">机构销售</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">手机奥络</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">官方Blog</a><br>
				<pre style="color:#7C7C7C;">Copyright (C) 奥络商城2004-2012, All Rights Reserved <a href="#">京ICP证041189号</a></pre>
			 	<a href="#"><img src="images/db3.gif"></img></a>&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/db4.png"></img></a>
			 	</div> 			 	 
   		</div>
   		</center>
    </div>
  </body>
</html>
