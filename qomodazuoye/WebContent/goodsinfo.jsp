<%@ page language="java" import="java.util.*,com.dao.*,com.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String userName=null;
	if(session.getAttribute("user") != null){  			
	  	UserInfo user =(UserInfo)session.getAttribute("user");
	  	userName =user.getUsername();
	 }else{
	 	userName="匿名用户";
	 }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>奥络商城-商品详细信息</title>
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
			height: 1600px;
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
		table {
		border-collapse: collapse;		
		}   
		th {
		background-color: #CCC; 
		}   
		td {   
		background-color: #EFEFEF;   
		border: 1px solid #BBB;   
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
		.location,.sortpic{position:absolute; left:4%; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}		
		.place{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
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
		.sp,.sortpic{position:absolute; left:4%;width:198px;height:450px; top:181px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.menustyle{height:32px; position:relative; margin-top:5px;}
		.menustyle h2{position:absolute; left:-12px; width:207px; height:32px; line-height:24px; color:#FFFFFF; font-size:14px; background-image:url(images/menubg.gif); text-indent:20px; z-index:99;}
		.prod_sort dl dt{clear:both; height:10px; background-color:#EAEAEA; margin:0px; color:#000000; font-weight:bold; text-indent:10px;}
		.prod_sort dl dd{float:left; width:40px; padding-left:0px; height:20px; line-height:20px; margin-left:20px; text-indent:0px; overflow:hidden; display:inline; background:url(images/point.gif) no-repeat 0px 9px;}
		.prod_sort dl dd a,.prod_sort dl dd a:visited{color:#000000;}
		/*==商品快播==*/		
		.kb{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.kb,.sortpic{position:absolute; left:4%;width:198px;height:250px; top:756px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.kbtyle{height:32px; position:relative; margin-top:5px;}
		.kbtyle h2{position:absolute; left:-12px; width:207px; height:32px; line-height:24px; color:#FFFFFF; font-size:14px; background-image:url(images/menubg.gif); text-indent:20px; z-index:99;}
		.xptg_list li{padding-bottom:18px; border-bottom:#C7C7C7 1px dotted; margin-bottom:15px;}
		.gg{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.gg,.sortpic{position:absolute; left:4%;width:930px;height:130px; top:1138px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		/*商品详细信息*/
		.info{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.info,.sortpic{position:absolute; left:24%;width:730px;top:181px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.detail_info{padding:15px 12px 0px;}
		.prod_pic{float:left; width:280px;}
		.prod_pic p{display:table-cell; vertical-align:middle; text-align:center; *display: block; *font-size: 215px; *font-family:Arial; width:270px; height:246px; border:#CCCECD 1px solid; overflow:hidden;}
		.prod_pic p img{max-width:270px; max-height:246px; vertical-align:middle; _width:expression(this.width>270&&this.width>this.height?270:true);_height:expression(this.height>246?246:true);}
		.prod_pic li{float:left; margin-left:10px; display:inline;}
		.prod_pic li a{display:block; width:40px; height:40px; border:#CCCCCC 1px solid; text-align:center;}
		.prod_pic li.sltpicbg{background:url(images/picbg.gif) no-repeat left top; width:46px; height:52px; position:relative; top:-8px;}
		.prod_pic li.sltpicbg a{margin-top:8px; margin-left:2px;}
		
		
		.prod_info{float:left; padding-left:16px; width:400px;}
		.prod_info li{margin-bottom:7px; color:#707070;}
		.btnbuy{width:144px; height:38px; line-height:38px; font-size:16px; font-weight:bold; background:url(images/buybg.gif) repeat-x left top; color:#FFFFFF; border:none; cursor:pointer;}
		.btncard{background-position:left bottom;}
		.prod_info li.prodtit{font-size:16px; font-weight:bold; color:#000000;}
		.prod_info li span{color:#FE6D02; font-size:14px; font-weight:bold;}
		.prod_info li label{font-weight:bold; font-size:14px;}
		.prod_info li.pricefor{padding-left:42px; line-height:22px;}
		.num{width:42px; height:18px; line-height:18px; border:#BFBFBF 1px solid; padding-left:6px;}
		.prod_info li select{width:124px; height:20px; line-height:20px; border:#BFBFBF 1px solid;}
		.prod_info li.prodbtn{margin-top:26px;}
		.prod_info li.prodbtn input{margin-left:25px; margin-right:10px;}
		
		.view_main{margin-top:35px; width:700px; margin:35px auto; overflow:hidden;}
		.prodnav{height:34px; padding-left:20px; background:url(images/hnavbg.gif) repeat-x left bottom;}
		.prodnav li{float:left; margin-right:4px; height:34px;}
		.prodnav li a{display:inline-block; height:30px; line-height:30px; border:#E3E3E3 2px solid; border-bottom:none; background-color:#F5F5F5; font-size:14px; font-weight:bold; padding:0px 18px;}
		.prodnav li.prodnav_slt a{background:none; border:#797979 2px solid; border-bottom:#FFFFFF 2px solid; background-color:#FFFFFF; text-decoration:none; color:#D40BB3;}
		.linkprod{float:left;overflow:hidden;line-height: 20px;}
		.linkprod ul{float:left;text-align: center;}
		.linkprod ul li{float:left;width:100px;height:150px; margin:15px 15px; display:inline;}
		.linkprod ul li a:visited,ul.todayprice li a:visited,.place h1 a:visited{color:#737373;}	
		#show1,#show3{margin-top:15px; clear:both;}
		#show1 img{max-width:700px;_width:expression(this.width>700?700:true);}		
		#show1 .linkprod{padding-top:0px;}
		#show3 th{background-color: #999;font-size: 14px;color: #FFFFFF}
		#show3 td{background-color: #FFFFFF;font-size: 12px}	
		ul.peisong{margin-top:25px;}
		ul.peisong li{line-height:24px; color:#717171; background:url(images/redpoint.gif) no-repeat 6px 8px; padding-left:20px;}
		ul.peisong li span{color:#000000;}		
		.redcol{border-top:#B1B1B1 1px dotted; padding-top:12px; margin-top:50px;}
		.spcmt{height:24px; border-bottom:#B1B1B1 1px dotted; margin-bottom:4px; background:url(images/iconbg.gif) no-repeat left -114px; text-indent:24px; font-size:14px; font-weight:bold; color:#000000; margin-top:20px;}
		.spcmt span{color:#DF0DBA;}
		.btncmt{margin-top:8px; text-align:center; margin-bottom:20px;}
		.btncmt input{border:#C8C8C8 1px solid; width:94px; height:30px; font-size:14px; font-weight:bold; background:url(images/plbtn.gif) repeat-x left top; cursor:pointer;}
		.btnbuy2{width:81px; height:25px; line-height:28px; font-size:12px; font-weight:bold; background:url(images/btnbg.gif) repeat-x left top; color:#666; border:none; cursor:pointer;}
		.sl{width: 30px;height:18px;border: 0;color:#FE6D02; font-size:14px; font-weight:bold;text-align: center;}
		.btnbg{width:81px;height:23px; border:0;background:url(images/btnbg.gif)}
</style>
<script type="text/javascript">
	function changeInfo(id){
		for(i=1;i<=3;i++){
			document.getElementById("show"+i).style.display="none";
			document.getElementById("liself"+i).className="";
		}
		document.getElementById("show"+id).style.display="block";
		document.getElementById("liself"+id).className="prodnav_slt";
		
	}
	function zsl(){
		var sl =document.getElementById("goodssl");
		sl.value++;
	}
	function jsl(){
		var sl =document.getElementById("goodssl");
		if(sl.value<=1){
			sl.value=1;
		}else{
			sl.value--;
		}
	}
</script>
  </head>  
  <body>
  	 <%
		  int goodsid =Integer.parseInt(request.getParameter("goodsId"));
		  GoodsInfo goods = new GoodsInfo();
		  GoodsCtrl gc = new GoodsCtrl();		      
		  goods=gc.selgoods(goodsid);
	 %>
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
    	<!-- 网站当前位置 -->
    	<div id="sousuo">
    	  <div class="location">
       	  <div class="place">
           	<span><a href="#"> 首页 </a>&gt; 商品详细页面</span>
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
    	<!-- 网站合作伙伴 --> 
 		<div id="kb">
 			<div class="kb">
 			<div class="kbtyle"><h2>合作伙伴</h2></div>
 			 <ul class="xptg_list">
		        <li><a href="#"><img src="images/tj1.jpg" /></a></li>
		        <li><a href="#"><img src="images/tj2.jpg" /></a></li>
		        <li><a href="#"><img src="images/tj3.jpg" /></a></li>
  		    </ul>
 			</div>
 		</div>
 		<!-- 商品信息 --> 
 		<div class="info">
 			<form action="addorder.jsp" method="post">
 			<div class="detail_info"> 			
 			 <div class="prod_pic">
          		<p><img src="<%=goods.getGoodsimg() %>" /></p>
        	</div>        		
        		<ul class="prod_info">
		          <li class="prodtit"><%=goods.getGoodsname() %></li>
		          <li>售价： <span><%=goods.getGoodsprice() %></span></li>
		          <li>运费：  <span><%=goods.getGoodscarr() %></span></li>
				  <li>所在地：<%=goods.getGoodsaddr() %></li>
				  <%
				  	    int sortid =Integer.parseInt(goods.getGoodssort());
	                  	GoodsSort sort = new GoodsSort();
		        		AdinUserCrtl ac = new AdinUserCrtl();
		        		sort =ac.selGoodsSort(sortid);  
				   %>				 
				  <li>商品类别： <span><a href="sortgoods.jsp?sortId=<%=sortid %>"><%=sort.getSortname() %></a></span></li>
		          <li>数量：<a href="javascript:jsl()"><img src="images/subtract.gif"></img></a>&nbsp;<input class="sl" type="text" name="goodssl" id="goodssl" value="1"/>&nbsp;<a href="javascript:zsl()"><img src="images/adding.gif"></img></a></li>		        
		          <li class="prodbtn">
		          	<input type="hidden" name="goodsId" value="<%=goods.getGoodsId()%>"/>
		          	<input type="hidden" name="goodsName" value="<%=goods.getGoodsname()%>"/>
		          	<input type="hidden" name="goodsPrice" value="<%=goods.getGoodsprice()%>"/>
		          	<input type="hidden" name="goodsCarr" value="<%=goods.getGoodscarr()%>"/>
		          	<div style="position:absolute;left:75px;top:280px;">
		          	<input type="button" class="btnbuy2" value="收藏商品">
		          	</div>	          	          
		            <input type="submit" class="btnbuy" value="立即购买">		            
		            <input type="button" class="btnbuy btncard" name="button3" id="button3" value="加入购物车" onclick="">
		          </li>
       			 </ul>       			
        	</div>
        	</form>      	 	 
        	<div class="view_main">
		        <ul class="prodnav">
		          <li id="liself1" onclick="changeInfo(1)" class="prodnav_slt"><a href="javascript:">商品信息</a></li>
		          <li id="liself2" onclick="changeInfo(2)"><a href="javascript:">相关商品</a></li>
		          <li id="liself3" onclick="changeInfo(3)"><a href="javascript:">商品评论</a></li>
      			  </ul>
		        <div id="show1">
		         <%=goods.getGoodsintro() %>
		        </div>
		        <div id="show2" class="linkprod" style="display:none;">
		        <br>		        
		          <ul>
		          	<%
			        	int sortId =Integer.parseInt(goods.getGoodssort());
			        	ArrayList<GoodsInfo> agoods = gc.xgGoods(sortId);
			        	for(GoodsInfo xggoods : agoods){			        	
		       		 %>
		            <li><p><a href="goodsinfo.jsp?goodsId=<%=xggoods.getGoodsId() %>"><img style="width: 100px;height: 100px;" src="<%=xggoods.getGoodsimg() %>"/></a></p>
		             <a href="goodsinfo.jsp?goodsId=<%=xggoods.getGoodsId() %>"><%=xggoods.getGoodsname() %></a><br />
		             <span>售价: </span><font style="color:red"><%=xggoods.getGoodsprice() %></font>
		            </li>
		            <%} %>
		          </ul>
		        </div>
		        <div id="show3" style="display:none;">
		        	<p class="spcmt">商品评论</p>
		            <div>
		           	  <table width="100%" border="0" cellspacing="0" cellpadding="0">             
						  <tr>
		                    <th width="16%" align="center">评论人</th>
		                    <th width="62%" align="center">内容</th>
		                    <th width="22%" align="center">评论时间</th>
		                  </tr>
		                  <%						 	
			           	 	ArrayList<CommentInfo> acomment = gc.goodsComment(goods.getGoodsId());
			           	 	if(acomment==null){			           	 			           	 	           	 	
	           	 		  %>
	           	 		  <tr>
	           	 		  	<td align="center" colspan="3">该商品暂无评论！</td>
	           	 		  </tr>	                  
		                  <%} else{
		                   		for(CommentInfo comment : acomment){
		                  %>
		                   <tr>
		                  	<td align="center"><%=comment.getCommentname() %></td>
		                  	<td align="center"><%=comment.getCommentContent() %></td>
		                  	<td align="center"><%=comment.getCommentDate() %></td>
		                  </tr> 
		                  <%} } %>		                             
		              </table>
		            </div>
		          <p class="btncmt"></p>		          		
		          		<div align="center">
		          		<form action="servlet/AddCommentServlef" method="post">			          							
						<label>内&nbsp;&nbsp;&nbsp;容：</label><textarea name="Plcomment" cols="30" rows=""></textarea>
						<input type="hidden" name="userName" value="<%=userName %>"/>
						<input type="hidden" name="goodsId" value="<%=goods.getGoodsId() %>"/><br/><br/>
						<input type="submit" class="btnbg" value="发表评论" />
						</form>						
						</div>						
		        </div>
		      </div>
 		</div>
 		<!-- 广告区 --> 
        <div id="gdt" class="gg" align="center">
			<a href="#"><img src="images/sort1.jpg"></img></a>
			<a href="#"><img src="images/sort2.jpg"></img></a>
			<a href="#"><img src="images/sort3.jpg"></img></a>
			<a href="#"><img src="images/sort4.jpg"></img></a>
        </div>
        <!-- 网站底部信息--> 
  		<center>
   		<div id="db">
   			<div style="position:absolute;left: 40px;top: 1275px;"><img src="images/db1.jpg"></img></div>	
			<div style="position:absolute;left: 40px;top: 1320px;">
			 ●&nbsp;<a href="#">购物流程</a><br>
			 ●&nbsp;<a href="#">发票制度</a><br>
			 ●&nbsp;<a href="#">积分说明</a><br>
			 ●&nbsp;<a href="#">我的奥络</a><br>
			 ●&nbsp;<a href="#">交易条款</a><br>
			 </div>
			<div style="position:absolute;left: 200px;top: 1320px;">
			 ●&nbsp;<a href="#">配送时间及运费</a><br>
			 ●&nbsp;<a href="#">加急快递</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">海外配送时间</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">验货与签收</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">订单配送查询</a>&nbsp;&nbsp;&nbsp;<br>
			 </div>
			<div style="position:absolute;left: 370px;top: 1320px;">
			 ●&nbsp;<a href="#">货到付款</a><br>
			 ●&nbsp;<a href="#">网上支付</a><br>
			 ●&nbsp;<a href="#">支票支付</a><br>
			 ●&nbsp;<a href="#">银行转帐</a><br>
			 ●&nbsp;<a href="#">奥络礼券</a><br>
			 </div>
			<div style="position:absolute;left: 520px;top: 1320px;">
			 ●&nbsp;<a href="#">退换货政策</a><br>
			 ●&nbsp;<a href="#">退换货流程</a><br>
			 ●&nbsp;<a href="#">退货申请</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">换货申请</a>&nbsp;&nbsp;&nbsp;<br>
			&nbsp;&nbsp; ●&nbsp;<a href="#">申请余额提现</a><br>
			 </div>
			<div style="position:absolute;left:690px;top: 1320px;">
			 ●&nbsp;<a href="#">奥络礼品卡</a>&nbsp;<br>
			 ●&nbsp;<a href="#">商店街</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">手机奥络网</a>&nbsp;<br>
			 ●&nbsp;<a href="#">出售二手书</a>&nbsp;<br>
			 </div>
			<div style="position:absolute;left:830px;top: 1320px;">
			 ●&nbsp;<a href="#">常见问题</a><br>
			 ●&nbsp;<a href="#">找回密码</a><br>
			 ●&nbsp;<a href="#">促销说明</a><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ●&nbsp;<a href="#">退订邮件/短信</a><br>
			 ●&nbsp;<a href="#">联系客服</a><br>
			 </div>	
			 	<div style="position:absolute;left:25px;top:1420px;"><a href="#"><img src="images/db2.jpg"></img></a></div>
			 	<div style="position:absolute;left:180px;top:1490px;">
			 	<a href="#">公司简介</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">诚征英才</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">百货招商</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">机构销售</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">手机奥络</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">官方Blog</a><br>
				<pre style="color:#7C7C7C;">Copyright (C) 奥络商城 2004-2012, All Rights Reserved <a href="#">京ICP证041189号</a></pre>
			 	<a href="#"><img src="images/db3.gif"></img></a>&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/db4.png"></img></a>
			 	</div> 			 	 
   		</div>
   		</center>
  </div>
  </body>
</html>
