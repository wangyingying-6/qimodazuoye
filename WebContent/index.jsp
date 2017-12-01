<%@ page language="java" import="java.util.*,com.dao.*,com.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	
  AdinUserCrtl ac = new AdinUserCrtl();
  GoodsCtrl gc = new GoodsCtrl();
  SiteInfo site = ac.setSite();
  ImgInfo logoimg =ac.setLogoImg();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title><%=site.getSitename() %></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<script type="text/javascript" src="js/jquery-1.1.3.pack.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/scroll.js"></script>
	<!--今日热点图片自动轮播效果代码-->
	<script language="javascript" type="text/javascript">
		$(document).ready(function(){

		$("#scrollDiv1").Scroll({line:5,speed:500,timer:3000,left:"scroll_rt1",right:"scroll_lt1"}); //自动播放
		$("#scrollDiv2").Scroll({line:5,speed:500,timer:7000,left:"scroll_rt2",right:"scroll_lt2"});//自动播放		
		
		$(".menunav_bar").find("a").click(
			function(){
				$(this).addClass("sltmenubg").siblings().removeClass("sltmenubg");
				var index = $(".menunav_bar a").index(this);
				$(".chgmenu").eq(index).show().siblings("ul").hide();
			}
		)		
});
	</script>
	<!--轮播图片特效代码-->
	<script type="text/javascript">
	$(function() {
		var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
		var len = $("#focus ul li").length; //获取焦点图个数
		var index = 0;
		var picTimer;
		
		//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
		var btn = "<div class='btnBg'></div><div class='btn'>";
		for(var i=0; i < len; i++) {
			btn += "<span></span>";
		}
		btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
		$("#focus").append(btn);
		$("#focus .btnBg").css("opacity",0.5);
	
		//为小按钮添加鼠标滑入事件，以显示相应的内容
		$("#focus .btn span").css("opacity",0.4).mouseenter(function() {
			index = $("#focus .btn span").index(this);
			showPics(index);
		}).eq(0).trigger("mouseenter");
	
		//上一页、下一页按钮透明度处理
		$("#focus .preNext").css("opacity",0.2).hover(function() {
			$(this).stop(true,false).animate({"opacity":"0.5"},300);
		},function() {
			$(this).stop(true,false).animate({"opacity":"0.2"},300);
		});
	
		//上一页按钮
		$("#focus .pre").click(function() {
			index -= 1;
			if(index == -1) {index = len - 1;}
			showPics(index);
		});
	
		//下一页按钮
		$("#focus .next").click(function() {
			index += 1;
			if(index == len) {index = 0;}
			showPics(index);
		});
	
		//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
		$("#focus ul").css("width",sWidth * (len));
		
		//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
		$("#focus").hover(function() {
			clearInterval(picTimer);
		},function() {
			picTimer = setInterval(function() {
				showPics(index);
				index++;
				if(index == len) {index = 0;}
			},4000); //此4000代表自动播放的间隔，单位：毫秒
		}).trigger("mouseleave");
		
		//显示图片函数，根据接收的index值显示相应的内容
		function showPics(index) { //普通切换
			var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
			$("#focus ul").stop(true,false).animate({"left":nowLeft},300); //通过animate()调整ul元素滚动到计算出的position
			//$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
			$("#focus .btn span").stop(true,false).animate({"opacity":"0.4"},300).eq(index).stop(true,false).animate({"opacity":"1"},300); //为当前的按钮切换到选中的效果
		}
	});
	
	</script>
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
			height: 1750px;
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
		#lunbo{
			border: 0px solid #d9d9d9;
			width:300px;
			height: 300px;
			position: absolute;
			top: 185px;
			left: 9%;
		}
		#db{			
			width: 100%;
			height: 260px;
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
		/*==图片轮播样式==*/		
		#lunbo {margin:5px auto;text-align:center; background:#FFFFFF;}
		#focus {width:822px; height:280px; overflow:hidden; position:relative;}
		#focus ul {height:380px; position:absolute;}
		#focus ul li {float:left; width:822px; height:280px; overflow:hidden; position:relative; background:#FFFFF;}
		#focus ul li div {position:absolute; overflow:hidden;}
		#focus .btnBg {position:absolute; width:800px; height:20px; left:1.3%; bottom:0; background:#000;}
		#focus .btn {position:absolute; width:780px; height:10px; padding:5px 10px; right:0; bottom:0; text-align:right;}
		#focus .btn span {display:inline-block; _display:inline; _zoom:1; width:25px; height:10px; _font-size:0; margin-left:5px; cursor:pointer; background:#fff;}
		#focus .btn span.on {background:#fff;}
		#focus .preNext {width:45px; height:100px; position:absolute; top:90px; background:url(images/sprite.png) no-repeat 0 0; cursor:pointer;}
		#focus .pre {left:0;}
		#focus .next {right:0; background-position:right top;}
		/*==首页==*/
		.sy2,.sortpic{position:absolute; left:9%;top:500px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		/*==商品分类==*/
		.sp{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.sp,.sortpic{position:absolute; left:9%;width:198px;height:450px; top:538px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.menustyle{height:32px; position:relative; margin-top:5px;}
		.menustyle h2{position:absolute; left:-12px; width:230px; height:32px; line-height:24px; color:#FFFFFF; font-size:14px; background-image:url(images/menubg.gif); text-indent:20px; z-index:99;}
		.prod_sort dl dt{clear:both; height:10px; background-color:#EAEAEA; margin:0px; color:#000000; font-weight:bold; text-indent:10px;}
		.prod_sort dl dd{float:left; width:40px; padding-left:0px; height:20px; line-height:20px; margin-left:20px; text-indent:0px; overflow:hidden; display:inline; background:url(images/point.gif) no-repeat 0px 9px;}
		.prod_sort dl dd a,.prod_sort dl dd a:visited{color:#000000;}
		/*==今日新品==*/
		.xp{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.xp,.sortpic{position:absolute; left:28.6%;width:625px;height:290px; top:538px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.newprod_menu{height:38px; line-height:38px; position:relative;}
		.newprod_menu h3{float:left; padding-left:24px; font-size:14px; font-weight:bold;}
		.newprod_menu h3 label{margin-left:60px; font-weight:normal; font-size:12px; color:#727272;}
		.newprodbg{position:absolute; background:url(images/barbg.gif) no-repeat left top; width:624px; z-index:100;}
		.scroll_lt,.scroll_rt{float:left; padding:100px 10px 0px;}
		.scroll_lt a,.scroll_rt a{display:block; width:30px; height:100px;}
		.scroll_lt a{background:url(images/scrollbgn.gif) no-repeat left top;}
		.scroll_rt a{background:url(images/scrollbgn.gif) no-repeat right top;}
		.scroll_ct{float:left; width:620px; height:200px; overflow:hidden;}
		.scroll_ct ul{float:left;}
		.scroll_ct ul li{float:left; width:100px; height:200px; margin:5px 12px; display:inline;}
		.scroll_ct ul li a:visited,ul.todayprice li a:visited,.place h1 a:visited{color:#737373;}
		.scroll_ct ul li h3{display:table-cell; text-align:center; vertical-align:middle; *display:block; *font-size:119px; width:100px; height:136px; margin-bottom:8px; overflow:hidden;}
		.scroll_ct ul li h3 img{max-width:100px; max-height:136px; vertical-align:middle; _width:expression(this.width>100&&this.width>=this.height?100:true); _height:expression(this.height>136&&this.height>=this.width?136:true);}
		
		.scroll_ct li span,.todayprice li span{font-weight:bold; color:#000000;}
		.scroll_ct li em,.todayprice li em{color:#E00101;}
		.scroll_ct ul li p{width:100px; height:28px; overflow:hidden;}
		
		/*==精品推荐==*/
		.jp{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.jp,.sortpic{position:absolute; left:28.6%;width:625px;height:290px; top:825px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.menunav_bar{margin-left:14px;}
		.menunav_bar a{display:inline-block; width:90px; height:25px; line-height:25px; text-align:center; background-color:#BEBEBE; margin-right:1px; color:#2B2E31;}
		.menunav_bar a.sltmenubg{background-color:#EDEDED; border:#A5A5A5 1px solid; border-bottom:none; font-weight:bold; color:#2B2E31;}
		.menunav_bar a:hover{text-decoration:none;}
		.chgmenubg{background-color:#EDEDED; height:173px;}
		ul.chgmenu{margin-left:14px; padding:8px 0px 14px;}
		ul.chgmenu li{line-height:25px; background:url(images/point.gif) no-repeat left center; padding-left:8px; margin-right:6px; width:194px; white-space:nowrap; text-overflow:}
		/*==商品快播==*/		
		.kb{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.kb,.sortpic{position:absolute; left:9%;width:198px;height:180px; top:1115px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.kbtyle{height:32px; position:relative; margin-top:5px;}
		.kbtyle h2{position:absolute; left:-12px; width:230px; height:32px; line-height:24px; color:#FFFFFF; font-size:14px; background-image:url(images/menubg.gif); text-indent:20px; z-index:99;}
		#tabs0{height: 150px; width:100px; border: 1px solid #cbcbcb; background-color: #EDEDED;}
		.menu0{width: 193px;}
		.menu0 li{ display:block; float: left; padding: 0px; width:96px; text-align: center; cursor:pointer; background: #bebebe;} 
		.menu0 li.hover{ background: #EDEDED;} 
		#main0 ul{display: none;} 
		#main0 ul.block{display: block;}
		/*==人气热卖==*/		
		.rq{width:930px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.rq,.sortpic{position:absolute; left:28.6%;width:625px;height:188px; top:1115px; border-top:#D0D0D0 1px solid; border-bottom:#D0D0D0 1px solid;}
		.rq{float:left;overflow:hidden;line-height: 20px;}
		.rq ul{float:left;text-align: center;}
		.rq ul li{float:left;width:100px;height:150px; margin:15px 15px; display:inline;}
		.rq ul li span{display:block; width:100px;}
		/*==广告图==*/
		.gg{width:930px; border-left:#D0D0D0 0px solid; border-right:#D0D0D0 0px solid; margin:0px auto; height:37px; line-height:37px;}
		.gg,.sortpic{position:absolute; left:4%;width:950px;height:130px; top:1303px; border-top:#D0D0D0 0px solid; border-bottom:#D0D0D0 0px solid;}
		/*底部样式*/		
		.dbtyle{height:32px; position:relative; margin-top:5px;}
		.dbtyle{position:absolute; left:-12px; width:860px; height:151px; line-height:24px; color:#FFFFFF; font-size:14px; background-image:url(images/db.jpg); text-indent:20px; z-index:99;}
	</style>
  </head>  
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
    	　　　　您好，欢迎来到奥络商城！<span>当前用户：</span><a href="hy.jsp"><%=user.getUsername() %></a>&nbsp;&nbsp;&nbsp;<a href="servlet/UserZxServlet" style="color: #999;text-decoration:none;">退出登录</a>
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
    	　　<a href="index.jsp"><img src="<%=logoimg.getLogoaddr() %>"></img></a>
    			<div style="position: absolute;left: 218px;top: 38px;"><a href="#"><img src="images/index_gg.gif"></img></a></div>
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
    	<!-- 网站商品搜索 -->
    	<div id="sousuo">
    	      <div class="location">
       	  <div class="place">
           	<span><a href="#">商品搜索</a></span>
           	<div class="searchform"> 
		<form action="searchgoods.jsp" method="post">
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
    	<!-- 网站图片轮播 -->
    	<div id="lunbo">    		
			<div id="focus">
				<ul>
				 <%
					ArrayList<ImgInfo> aimg =ac.selLunboImg();
	              	for(ImgInfo img : aimg){	             
				 %>	
				 <li><a href="<%=img.getImghref() %>" target="_blank"><img src="<%=img.getLunboaddr() %>" /></a></li>							
				<%} %>	
				</ul>				
			</div>				
    	</div>
    	<!-- 网站当前位置 -->
		<div id="shouye">
		 <div class="sy2">
       	  <div class="place">
           	<span><a href="#">首页</a></span>
            <a href="#" style="float: right;">● 奥络服饰城交易平台—商城效果正式发布！</a>
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
		<!-- 网站今日新品展示区 -->
   		<div id="xinpin">
   		<div class="xp">
   		<div class="newprod_menu">
           <div class="newprodbg"><h3>今日新品</h3></div>
        </div>
        <div>
        <div class="scroll_lt" id="scroll_lt1" style="position: absolute;top:25px; left:0px;"><a href="javascript:"></a></div>
        <div id="scrollDiv1" class="scroll_ct">
           <ul style="position: absolute;left:60px;">
           	 <%
           	 	ArrayList<GoodsInfo> agoods = gc.getToGoods2();
           	 	for(GoodsInfo goods : agoods){           	 	
           	  %>
             <li>
                 <h3><a href="goodsinfo.jsp?goodsId=<%=goods.getGoodsId() %>"><img alt="<%=goods.getGoodsname() %>" src="<%=goods.getGoodsimg() %>"/></a></h3><p><a href="goodsinfo.jsp?goodsId=<%=goods.getGoodsId() %>"><%=goods.getGoodsname() %></a></p><span>活动价：<em>￥<%=goods.getGoodsprice() %></em></span>
              </li>
              <%} %>                                                                      
            </ul>
         </div>
          <div class="scroll_rt" id="scroll_rt1" style="position: absolute;top:25px; left:560px;"><a href="javascript:"></a></div>
   		</div>
        </div>
    	</div> 
    	<!-- 网站精品推荐展示区 -->   	
    	<div id="tuijian">
   			<div class="jp">
   			<div class="newprod_menu">
       	    <div class="newprodbg"><h3>精品推荐</h3></div>
       	 </div>
       	 <div>
      	  <div class="scroll_lt" id="scroll_lt2" style="position: absolute;top:25px; left:0px;"><a href="javascript:"></a></div>
      	  <div id="scrollDiv2" class="scroll_ct">
        	   <ul style="position: absolute;left:60px;">
        	  <%
	           	 	ArrayList<GoodsInfo> agoods2 = gc.getjptjGoods();
	           	 	for(GoodsInfo goods2 : agoods2){        	 	
           	  %>
          	  <li>
                 <h3><a href="goodsinfo.jsp?goodsId=<%=goods2.getGoodsId() %>"><img alt="<%=goods2.getGoodsname() %>" src="<%=goods2.getGoodsimg() %>"/></a></h3><p><a href="goodsinfo.jsp?goodsId=<%=goods2.getGoodsId() %>"><%=goods2.getGoodsname() %></a></p><span>活动价：<em>￥<%=goods2.getGoodsprice() %></em></span>
              </li>
              <%} %>              	                                                                                      	           	            	           	          	   
         	   </ul>
        	 </div>       
       	   <div class="scroll_rt" id="scroll_rt2" style="position: absolute;top:25px; left:560px;"><a href="javascript:"></a></div>
   			</div>
      	 </div>
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
 		<!-- 人气热卖 --> 
 		<div id="rq">
 			<div class="rq">
   				<div class="newprod_menu">
	        	<div class="newprodbg"><h3>人气热卖</h3></div>
	        	<div style="position: absolute;top: 45px;">
	        	<!-- 点击按钮控制图片滚动方向 -->
	        	<script type="text/javascript">
	        		function left(){
	        			var gd =document.getElementById("gd");
	        			gd.direction="left";
	        		}
	        		function right(){
	        			var gd =document.getElementById("gd");
	        			gd.direction="right";
	        		}
	        	</script>
	        	<a href="javascript:left()"><img src="images/left.jpg" style="position: absolute;top: 94px;"></a>
	        	<marquee id="gd" onmouseover="this.stop();" onMouseOut="this.start();" direction="right">
	        	<ul>
	        		<%
		           	 	ArrayList<GoodsInfo> agoods3 = gc.getxlGoods();
		           	 	for(GoodsInfo goods3 : agoods3){        	 	
           	 		 %>		          
		            <li><p><a href="goodsinfo.jsp?goodsId=<%=goods3.getGoodsId() %>"><img style="width: 100px;height: 100px;" alt="<%=goods3.getGoodsname() %>" src="<%=goods3.getGoodsimg() %>"/></a></p>
		             <a href="goodsinfo.jsp?goodsId=<%=goods3.getGoodsId() %>"><span><%=goods3.getGoodsname() %></span></a><br />		           
		            </li>	
		            <%} %>	           
		          </ul>
	        	</marquee>
	        	<a href="javascript:right()"><img src="images/right.jpg" style="position: absolute;top: 90px;left: 600px;"></a>
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
   			<div style="position:absolute;left: 40px;top: 1440px;"><img src="images/db1.jpg"></img></div>	
			<div style="position:absolute;left: 40px;top: 1480px;">
			 ●&nbsp;<a href="#">购物流程</a><br>
			 ●&nbsp;<a href="#">发票制度</a><br>
			 ●&nbsp;<a href="#">积分说明</a><br>
			 ●&nbsp;<a href="#">我的奥络</a><br>
			 ●&nbsp;<a href="#">交易条款</a><br>
			 </div>
			<div style="position:absolute;left: 200px;top: 1480px;">
			 ●&nbsp;<a href="#">配送时间及运费</a><br>
			 ●&nbsp;<a href="#">加急快递</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">海外配送时间</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">验货与签收</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">订单配送查询</a>&nbsp;&nbsp;&nbsp;<br>
			 </div>
			<div style="position:absolute;left: 370px;top: 1480px;">
			 ●&nbsp;<a href="#">货到付款</a><br>
			 ●&nbsp;<a href="#">网上支付</a><br>
			 ●&nbsp;<a href="#">支票支付</a><br>
			 ●&nbsp;<a href="#">银行转帐</a><br>
			 ●&nbsp;<a href="#">奥络礼券</a><br>
			 </div>
			<div style="position:absolute;left: 520px;top: 1480px;">
			 ●&nbsp;<a href="#">退换货政策</a><br>
			 ●&nbsp;<a href="#">退换货流程</a><br>
			 ●&nbsp;<a href="#">退货申请</a>&nbsp;&nbsp;&nbsp;<br>
			 ●&nbsp;<a href="#">换货申请</a>&nbsp;&nbsp;&nbsp;<br>
			&nbsp;&nbsp; ●&nbsp;<a href="#">申请余额提现</a><br>
			 </div>
			<div style="position:absolute;left:690px;top: 1480px;">
			 ●&nbsp;<a href="#">奥络礼品卡</a>&nbsp;<br>
			 ●&nbsp;<a href="#">商店街</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;<br>
			●&nbsp;<a href="#">手机奥络网</a>&nbsp;<br>
			 ●&nbsp;<a href="#">出售二手书</a>&nbsp;<br>
			 </div>
			<div style="position:absolute;left:830px;top: 1480px;">
			 ●&nbsp;<a href="#">常见问题</a><br>
			 ●&nbsp;<a href="#">找回密码</a><br>
			 ●&nbsp;<a href="#">促销说明</a><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ●&nbsp;<a href="#">退订邮件/短信</a><br>
			 ●&nbsp;<a href="#">联系客服</a><br>
			 </div>	
			 	<div style="position:absolute;left:25px;top:1580px;"><a href="#"><img src="images/db2.jpg"></img></a></div>
			 	<div style="position:absolute;left:180px;top:1650px;">
			 	<a href="#">公司简介</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">诚征英才</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">百货招商</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">机构销售</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">手机奥络</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">官方Blog</a><br>
				<pre style="color:#7C7C7C;">Copyright (C) 奥络商城 2004-2012, All Rights Reserved <a href="#"><%=site.getIcpnumber() %></a></pre>
			 	<a href="#"><img src="images/db3.gif"></img></a>&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/db4.png"></img></a>
			 	</div> 			 	 
   		</div>
   		</center>	
  </div>
  </body>
</html>
