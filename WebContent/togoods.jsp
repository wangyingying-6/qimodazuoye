<%@ page language="java" import="java.util.*,com.dao.*,com.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	int pageSize = 12;//定义每页显示的条目数
	int pageNow = 1;//默认显示第一页
	int pageCount = 1;//默认只有1页
	GoodsCtrl gc = new GoodsCtrl();
	if(request.getParameter("pageNow") != null)
	pageNow = Integer.parseInt(request.getParameter("pageNow"));	
	//获取总页数
	pageCount = gc.getToGoodsCount(pageSize);
	//获取到商品总数
	int goodsCount =gc.getToGoodsCount2();
	//如果小于第一页，则显示第一页
	if(pageNow <= 0){
		pageNow = 1;
	}
	//如果超过最后一页，则显示最后一页
	if(pageNow >= pageCount){
		pageNow = pageCount;
	}
	ArrayList<GoodsInfo> agoods = gc.getToGoods(pageSize,pageNow);
		if(agoods==null){
			response.sendRedirect("search2.jsp");
			return;
		}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>奥络商城-最新商品</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function setTab(m,n){ 
		 var tli=document.getElementById("menu"+m).getElementsByTagName("li"); 
		 var mli=document.getElementById("main"+m).getElementsByTagName("ul"); 
		 for(i=0;i<tli.length;i++){ 
		  tli[i].className=i==n?"hover":""; 
		  mli[i].style.display=i==n?"block":"none"; 
		 } 
		}
		//window.onerror=function(){return true;}
	</script>
	<style type="text/css">
		#sum{
			border: 1px solid #d9d9d9;
			width: %80;
			height: 1450px;
		}
		#top{
			border:1px solid #d9d9d9;
			height:15px;
		}
		#logo{
			border:1px solid #d9d9d9;
			height:8px;
		}
		#daohang{			
			height:50px;
		}
		#db{			
			width: 100%;
			height: 260px;
		}
		#xg{
			width:623px;
			height: 10px;
			margin-top: 10px;		
		}
		#goodsinfo{
			border:1 solid #FFFFFF;
			width:150px;
			height:150px;
			float: left;
			margin-right: 10px;
			margin-left: 25px;
			margin-top:10px;
			margin-bottom: 10px;
			text-align: center;
			
		}
			/*==CSS样式开始==*/
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
		/*==当前位置==*/
		.location,.sortpic{position:absolute; left:9%; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}		
		.place{width:822px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.place span{float:left; margin-right:6px;font-weight:normal; background:url(images/iconbg.gif) no-repeat 8px 8px; text-indent:34px; color:#737373;}
		.place span a,.place span a:visited{color:#737373; background:url(images/iconbg.gif) no-repeat left -66px; padding-left:20px;}	
		/*==搜索文本框样式==*/
		.searchform{float:left; width:317px; height:27px; background-image:url(images/searchbg.gif); margin-top:5px; margin-left: 20px;}
		input.tbkey{width:216px;color:#999; height:25px; line-height:25px; border:0; margin-left:28px; margin-right:6px; background:url(images/srchbtnbg.gif) repeat-x left top;}
		input.btnsearch{width:65px; height:23px; border:0; font-size:14px; font-weight:bold; color:#FFFFFF; cursor:pointer; background:url(images/search.gif); text-indent:-299px;
		.grade_search{float:left; padding-top:28px; color:#737373;}
		a.grade,a.grade:visited{color:#000000; margin-right:26px; margin-left:5px;}
		/*==商品分类==*/
		.sp{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.sp,.sortpic{position:absolute; left:9%;width:198px;height:450px; top:180px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.menustyle{height:32px; position:relative; margin-top:5px;}
		.menustyle h2{position:absolute; left:-12px; width:207px; height:32px; line-height:24px; color:#FFFFFF; font-size:14px; background-image:url(images/menubg.gif); text-indent:20px; z-index:99;}
		.prod_sort dl dt{clear:both; height:10px; background-color:#EAEAEA; margin:0px; color:#000000; font-weight:bold; text-indent:10px;}
		.prod_sort dl dd{float:left; width:40px; padding-left:0px; height:20px; line-height:20px; margin-left:20px; text-indent:0px; overflow:hidden; display:inline; background:url(images/point.gif) no-repeat 0px 9px;}
		.prod_sort dl dd a,.prod_sort dl dd a:visited{color:#000000;}
		/*==商品快播==*/		
		.kb{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.kb,.sortpic{position:absolute; left:9%;width:198px;height:180px; top:756px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.kbtyle{height:32px; position:relative; margin-top:5px;}
		.kbtyle h2{position:absolute; left:-12px; width:207px; height:32px; line-height:24px; color:#FFFFFF; font-size:14px; background-image:url(images/menubg.gif); text-indent:20px; z-index:99;}
		#tabs0{height: 150px; width:100px; border: 1px solid #cbcbcb; background-color: #EDEDED;}
		.menu0{width: 193px;}
		.menu0 li{ display:block; float: left; padding: 0px; width:96px; text-align: center; cursor:pointer; background: #bebebe;} 
		.menu0 li.hover{ background: #EDEDED;} 
		#main0 ul{display: none;} 
		#main0 ul.block{display: block;}
		/*==广告图==*/
		.gg{width:930px; border-left:#D0D0D0 0px solid; border-right:#D0D0D0 0px solid; margin:0px auto; height:37px; line-height:37px;}
		.gg,.sortpic{position:absolute; left:4%;width:950px;height:130px; top:990px; border-top:#D0D0D0 0px solid; border-bottom:#D0D0D0 0px solid;}
		/*==显示搜索商品==*/
		.seh{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:20px;}
		.seh,.sortpic{position:absolute; left:28.6%;width:625px;height:800px; top:180px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.seh a:link{text-decoration:none; color:#00F;}
		.seh a:visited{text-decoration:none; color:#00F;}
		.seh a:hover{text-decoration:none;color:#FE6D02;}
		.goodsinfo-hover{border:1px solid #FE6D02;}
		.goodsinfo-out{border:0px;}	
		.jg{font-weight:bold; color:#000000;}
		.jg2{color:#E00101;}	
   </style>
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
  		window.location.href="togoods.jsp?pageNow="+ pageNow.value;
  	}
  </script>
  <body>
  	<!-- 总层 -->
    <div id="sum">
    	<!-- 网站头部信息 -->
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
    	<!-- 网站LOGO信息 -->
    	<div id="logo">
    	<br/>
    	　　<a href="index.jsp"><img src="images/logo.jpg"></img></a>
    			<div style="position: absolute;left: 215px;top: 38px;"><a href="#"><img src="images/index_gg.gif"></img></a></div>
    	</div>
    	<!-- 网站导航栏 -->
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
                    <li><a href="index.jsp">首页</a></li>
					<li><a class="navslt" href="togoods.jsp">最新商品</a></li>
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
    	<!-- 网站商品搜索 -->
    	<div id="sousuo">
    	      <div class="location">
       	  <div class="place">
           	<span><a href="#">商品搜索</a></span>
           	<div class="searchform"> 
		<form method="post" action="searchgoods.jsp">
		  <input class="tbkey" type="text" name="GoodsName" value="买什么？搜一下就知道" onFocus="this.value=''" onBlur="if(!value){value=defaultValue;}"/><input class="btnsearch" type="submit" value="搜 索" />
		</form>
		</div>
		<p class="grade_search">　搜索商品 　热搜：
			<a href="/pro_list.html?keyWords=花苞裙">花苞裙</a> 
			<a href="/pro_list.html?keyWords=雪纺裙">雪纺裙</a> 
			<a href="/pro_list.html?keyWords=吊带裙">吊带裙</a> 
			<a href="/pro_list.html?keyWords=真丝裙">真丝裙</a> 
			<a href="/pro_list.html?keyWords=背心裙">背心裙</a>
		</p>
          </div>
        </div>
    	</div>
		<!-- 网站商品分类 -->
		<div id="fenlei">
			<div class="prod_sort">
			<div class="sp">
			<div class="menustyle"><h2>商品分类</h2>
			<dl>
                	<dt><a href="">春装</a></dt>
                	<dt><a href="sortgoods.jsp?sortId=1">春装</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=2">&nbsp;上衣</a></dd> 
                    <dd><a href="sortgoods.jsp?sortId=3">&nbsp;头饰</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=4">&nbsp;毛衣</a></dd> 
                    
                    <dt><a href="sortgoods.jsp?sortId=5">&nbsp;夏装</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=6">&nbsp;T恤</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=7">&nbsp;沙滩裤</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=8">&nbsp;泳衣</a></dd>
                     
                    <dt><a href="sortgoods.jsp?sortId=9">&nbsp;鞋子</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=10">&nbsp;凉鞋</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=11">&nbsp;女鞋</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=12">&nbsp;男鞋</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=13">&nbsp;童鞋</a></dd> 
                    
                    <dt><a href="sortgoods.jsp?sortId=14">&nbsp;裤子</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=14">&nbsp;休闲裤</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=15">&nbsp;打底裤</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=16">&nbsp;泳裤</a></dd>
                    
                    <dt><a href="sortgoods.jsp?sortId=17">&nbsp;帽子</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=18">&nbsp;宽檐帽</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=19">&nbsp;棉帽</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=20">&nbsp;遮阳帽</a></dd>
                    
                    <dt><a href="sortgoods.jsp?sortId=21">&nbsp;袜子</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=22">&nbsp;丝袜</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=23">&nbsp;棉袜</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=24">&nbsp;长筒袜</a></dd>
                    
                    <dt><a href="sortgoods.jsp?sortId=25">&nbsp;裙子</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=26">&nbsp;超短裙</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=27">&nbsp;连衣裙</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=28">&nbsp;迷你裙</a></dd>
                    
                    <dt><a href="sortgoods.jsp?sortId=29">&nbsp;内衣</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=30">&nbsp;内裤</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=31">&nbsp;文胸</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=32">&nbsp;蕾丝边</a></dd>
                    
                    <dt><a href="sortgoods.jsp?sortId=33">&nbsp;眼睛</a></dt>
                    <dd><a href="sortgoods.jsp?sortId=34">&nbsp;太阳镜</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=35">&nbsp;老花镜</a></dd>
                    <dd><a href="sortgoods.jsp?sortId=36">&nbsp;蛤蟆镜</a></dd>
            </dl>
			</div>	
			</div>
			</div>
		</div> 
    	<!-- 商品搜索结果 -->
    	<div id="search" class="seh">
    		<div id="xg"><font style="font-size: 12px;">&nbsp;&nbsp;共找到相关商品：<font style="color:#FE6D02"><%=goodsCount %></font></font><font style="font-size: 12px;">件</font></div>
			 <%
                  	for(GoodsInfo goods : agoods){                  	
             %> 
			<div id="goodsinfo" onmousemove="this.className='goodsinfo-hover'" onmouseout="this.className='goodsinfo-out'">
				<a href="goodsinfo.jsp?goodsId=<%=goods.getGoodsId() %>"><img style="width:100px;height:100px;" alt="<%=goods.getGoodsname() %>" src="<%=goods.getGoodsimg() %>"><br/></a>
				<a href="goodsinfo.jsp?goodsId=<%=goods.getGoodsId() %>"><%=goods.getGoodsname() %></a><br/>
				<font class="jg">活动价：<font class="jg2">￥<%=goods.getGoodsprice() %></font></font>
			</div>
			<%} %>							
    		<table align="right" style="width: 622px;">
			<tr style="position: absolute;top: 765px;height: 40px;">       			
       			<td colspan="5">
       				<center>
       				<a href="togoods.jsp?pageNow=1"><img src="images/first.gif"></img></a>&nbsp;&nbsp;
       				<a href="togoods.jsp?pageNow=<%=pageNow-1 %>"><img src="images/back.gif"></img></a>
       				<font style="color: #8E8E8E; font-size: 12px;"><%=pageNow %>/<%=pageCount %></font>
       				<a href="togoods.jsp?pageNow=<%=pageNow+1 %>"><img src="images/next.gif"></img></a>&nbsp;&nbsp;
       				<a href="togoods.jsp?pageNow=<%=pageCount %>"><img src="images/last.gif"></img></a>
       				<font style="font-size: 12px; color:#8E8E8E">到第</font>
       				<input type="text" style="width: 20px;height: 20px;" id="pageNow">
       				<font style="font-size: 12px; color:#8E8E8E">页</font>
       				<a href="javascript:pageGo()"><img src="images/go.gif"></img></a>
       				</center>
       			</td>
       		</tr>
    		</table>
    	</div>
    	<!-- 网站商品快报 --> 
 		<div id="kb">
 			<div class="kb">
 			<div class="kbtyle"><h2>商品快报</h2></div>
					<div id="tabs0">
					 <ul class="menu0" id="menu0"> 
					  <li onclick="setTab(0,0)" class="hover">最新商品</li> 
					  <li onclick="setTab(0,1)">时尚话题</li>
					 </ul> 
					 <div class="main" id="main0"> 
					  <ul class="block"><li>加载中...</li></ul> 
					  <ul><li>加载中...</li></ul>	
					 </div> 
					</div> 
 			</div>
 		</div>
 		<!-- 广告区 --> 
        <div id="gdt" class="gg">
			<a href="#"><img src="images/sort1.jpg"></img></a>
			<a href="#"><img src="images/sort2.jpg"></img></a>
			<a href="#"><img src="images/sort3.jpg"></img></a>
			<a href="#"><img src="images/sort4.jpg"></img></a>
        </div>
        <!-- 网站底部信息--> 
  		<center>
   		<div id="db">
   			<div style="position:absolute;left: 40px;top: 1135px;"><img src="images/db1.jpg"></img></div>	
			<div style="position:absolute;left: 40px;top: 1180px;">
			 ●&nbsp;<a href="#">购物流程</a><br>
			 ●&nbsp;<a href="#">发票制度</a><br>
			 ●&nbsp;<a href="#">积分说明</a><br>
			 ●&nbsp;<a href="#">我的奥络</a><br>
			 ●&nbsp;<a href="#">交易条款</a><br>
			 </div>
			<div style="position:absolute;left: 200px;top: 1180px;">
			 ●&nbsp;<a href="#">配送时间及运费</a><br>
			 ●&nbsp;<a href="#">加急快递</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">海外配送时间</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">验货与签收</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">订单配送查询</a>&nbsp;&nbsp;&nbsp;<br>
			 </div>
			<div style="position:absolute;left: 370px;top: 1180px;">
			 ●&nbsp;<a href="#">货到付款</a><br>
			 ●&nbsp;<a href="#">网上支付</a><br>
			 ●&nbsp;<a href="#">支票支付</a><br>
			 ●&nbsp;<a href="#">银行转帐</a><br>
			 ●&nbsp;<a href="#">奥络礼券</a><br>
			 </div>
			<div style="position:absolute;left: 520px;top: 1180px;">
			 ●&nbsp;<a href="#">退换货政策</a><br>
			 ●&nbsp;<a href="#">退换货流程</a><br>
			 ●&nbsp;<a href="#">退货申请</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">换货申请</a>&nbsp;&nbsp;&nbsp;<br>
			&nbsp;&nbsp; ●&nbsp;<a href="#">申请余额提现</a><br>
			 </div>
			<div style="position:absolute;left:690px;top: 1180px;">
			 ●&nbsp;<a href="#">奥络礼品卡</a>&nbsp;<br>
			 ●&nbsp;<a href="#">商店街</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">手机奥络网</a>&nbsp;<br>
			 ●&nbsp;<a href="#">出售二手书</a>&nbsp;<br>
			 </div>
			<div style="position:absolute;left:830px;top: 1180px;">
			 ●&nbsp;<a href="#">常见问题</a><br>
			 ●&nbsp;<a href="#">找回密码</a><br>
			 ●&nbsp;<a href="#">促销说明</a><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ●&nbsp;<a href="#">退订邮件/短信</a><br>
			 ●&nbsp;<a href="#">联系客服</a><br>
			 </div>	
			 	<div style="position:absolute;left:25px;top:1280px;"><a href="#"><img src="images/db2.jpg"></img></a></div>
			 	<div style="position:absolute;left:180px;top:1350px;">
			 	<a href="#">公司简介</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">诚征英才</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">百货招商</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">机构销售</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">手机奥络</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">官方Blog</a><br>
				<pre style="color:#7C7C7C;">Copyright (C) 奥络商城 2004-2012, All Rights Reserved <a href="#">京ICP证041189号</a></pre>
			 	<a href="#"><img src="images/db3.gif"></img></a>&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/db4.png"></img></a>
			 	</div> 			 	 
   		</div>
   		</center>	
  </div>
  </body>
</html>
