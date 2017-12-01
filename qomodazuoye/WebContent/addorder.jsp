<%@ page language="java" import="java.util.*,com.dao.*,com.entity.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
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
    
    <title>填写订购信息-奥络商城</title>
    
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
		}
		#top{
			border:1px solid #d9d9d9;
			height:15px;
		}
		#daohang{			
			height:50px;
		}
		#order{
			border: 0px solid #d9d9d9;
			width: 800px;
		}
		#orderinfo{
			border: 1px solid #d9d9d9;
			width: 800px;				
		}
		#goodsinfo{
			border: 1px solid #d9d9d9;
			width: 800px;	
		}
		#db{			
			width: 100%;
			height: 260px;
		}
		table{border-collapse: collapse;}
		table td{font-size: 12px;}			
		.tdbg{background-color: #7b7f8a;color: #FFFFFF;height: 30px;font-size: 12px}
		.tdbg2{background-color: #7b7f8a;color: #FFFFFF;width:100%; height: 25px}
		/*==顶部信息==*/
		.topreg{float:left;}
		.topreg a:link{color:#029CFC;},.topreg a:visited{color:#029CFC;}
		.topreg span{color:#8E8E8E;}
		.topinfo{float:right; color:#AFAFAF;}
		
				/*==全局样式==*/
		body,div,ul,ol,li,dl,dt,dd,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,table,p,th,td,img{margin:0px; padding:0px;}
		body { width:100%; font:normal 12px/1.5 "微软雅黑","Microsoft Sans Serif", Verdana,Tahoma,simsun, Lucida, Arial; background-color:#fff; color:#000;}
		ol,ul{list-style:none;}
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
		.place{width:800px; border-left:#D0D0D0 1px solid; border-right:#D0D0D0 1px solid; margin:0px auto; height:37px; line-height:37px;}
		.place h1{float:left; font-weight:normal; background:url(images/iconbg.gif) no-repeat 8px 8px; text-indent:34px; color:#7C7C7C;}
		.place span{float:right; margin-right:6px;}
		.place span a,.place span a:visited{color:#AB04C4; background:url(images/iconbg.gif) no-repeat left -66px; padding-left:20px;}
   		 .text{width: 200px;}
   		 .btnbg{width:117px;height:32px; border:0;background:url(images/order.gif)}
   </style>
  <script type="text/javascript">
  	function ht(){
  		window.history.back();
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
           	  <h1>> <a href="index.jsp">首页</a> > <a href="purchase.jsp">购物车</a>  > 填写核对信息单</h1>
				<span>					
						<a href="#"></a>
				</span>
          </div>
        </div>
        </center> 
        <!-- 填写订单界面 -->
        <center>
        <div id="order">
       		<img src="images/cart_step2.jpg"></img>
       	<form action="servlet/AddOrderServlef" method="post">
       		<div id="orderinfo">
       			<table style="width:100%">
       				<tr>
       					<td class="tdbg">　　　<strong>订货人信息（为了您能够及时准确地收到商品，带*项为必填项）</strong></td>
       				</tr>
       				<tr>
       					<td>
       						<ul style="margin-left:100px;">
							      <%
							  			UserInfo user1 =(UserInfo)session.getAttribute("user");
							  			int userid =user1.getUserId();
							  			UserCrtl uc = new UserCrtl();
							 			UserInfo user =uc.selUser(userid);
							 			String xm =null;
							  			String addr =null;
							  			String yb =null;
							  			String email=null;
							  			String sj =null;
							  			
							  			if(user.getUserxm()==null){
							  				xm="";
							  			}
							  			else if("".equals(user.getUserxm())){
							  				xm="";
							  			}
							  			else{
							  				xm=user.getUserxm();
							  			}			  			
							  			if(user.getUseraddr()==null){
							  				addr="";
							  			}
							  			else if("".equals(user.getUseraddr())){
							  				addr="";
							  			}
							  			else{
							  				addr=user.getUseraddr();
							  			}
							  			if(user.getUseryb()==null){
							  				yb="";
							  			}
							  			else if("".equals(user.getUseryb())){
							  				yb="";
							  			}
							  			else{
							  				yb=user.getUseryb();
							  			}
							  			if(user.getUseremail()==null){
							  				email="";
							  			}
							  			else if("".equals(user.getUseremail())){
							  				email="";
							  			}
							  			else{
							  				email=user.getUseremail();
							  			}
							  			if(user.getUsersj()==null){
							  				sj="";
							  			}
							  			else if("".equals(user.getUsersj())){
							  				sj="";
							  			}
							  			else{
							  				sj=user.getUsersj();
							  			}							  			
							  	 %>
       							<li>
       							<input type="hidden" name="userId" value="<%=userid%>"/>
       							<input type="hidden" name="userName" value="<%=xm%>"/>
       							<input type="hidden" name="userAddr" value="<%=addr%>"/>
       							<input type="hidden" name="userYb" value="<%=yb%>"/>
       							<input type="hidden" name="userSj" value="<%=sj%>"/>
       							<input type="hidden" name="userEmail" value="<%=email%>"/>
       							</li>
       							<li>&nbsp;&nbsp;&nbsp;&nbsp;收货人姓名：<input class="text" type="text" value="<%=xm %>"/>  *   请准确填写真实姓名，以便确保商品准确无误送达。</li>
       							<li></li>
       							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货地址：<input class="text" type="text" value="<%=addr %>"/>  * </li>
       							<li></li>
       							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：<input class="text" type="text" value="<%=yb %>"/></li>
       							<li></li>
       							<li>联系电话/手机：<input class="text" type="text" value="<%=sj %>"/>  *</li>
       							<li></li>
       							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-mail：<input class="text" type="text" value="<%=email %>"/> </li>
       							<li></li>
       						</ul>
       					</td>
       				</tr>
       			</table>
       		</div>
       		<br/>
       		<div id="goodsinfo">
       			<div align="left"><font style="font-size: 16px;text-align: left">　　商品清单</font></div>
       			<table style="width:100%">  				
       				<tr class="tdbg2">
       					<td align="center"><strong>商品名称</strong></td>
       					<td align="center"><strong>价格</strong></td>
       					<td align="center"><strong>运费</strong></td>
       					<td align="center"><strong>数量</strong></td>
       				</tr>
       				<tr>
       					<%
       						String goodsId =request.getParameter("goodsId");
       						String goodsName =request.getParameter("goodsName");
       						double goodsPrice =Double.parseDouble(request.getParameter("goodsPrice"));
       						double goodsCarr =Double.parseDouble(request.getParameter("goodsCarr"));
       						int goodssl =Integer.parseInt(request.getParameter("goodssl"));
       						double sum =goodsPrice * goodssl + goodsCarr;       						
       					%>       					
       					<td align="center"><a href="goodsinfo.jsp?goodsId=<%=goodsId%>" target="_"><%=goodsName %></a></td>
       					<td align="center"><%=goodsPrice %></td>
       					<td align="center"><%=goodsCarr %></td>
       					<td align="center"><%=goodssl %></td>
       				</tr>
       				<tr>
       					<td><HR noShade SIZE=0></td>
       					<td><HR noShade SIZE=0></td>
       					<td><HR noShade SIZE=0></td>
       					<td><HR noShade SIZE=0></td>
       				</tr>
       				<tr>
       					<td align="right">　附加说明：</td>
       					<td><textarea rows="" cols="40" name="goodsSm"></textarea> </td>      					
       				</tr>   
       				<tr>
       					<td><HR noShade SIZE=0></td>
       					<td><HR noShade SIZE=0></td>
       					<td><HR noShade SIZE=0></td>
       					<td><HR noShade SIZE=0></td>
       				</tr>      								      				
       				<tr>       					 
       					<td><a href="javascript:ht()">　修改商品 &gt;&gt;</a></td>       					
       					<td>
       					<input type="hidden" name="goodsId" value="<%=goodsId%>"/>
       					<input type="hidden" name="goodsName" value="<%=goodsName%>"/>
       					<input type="hidden" name="goodsPrice" value="<%=goodsPrice%>"/>
       					<input type="hidden" name="goodsCarr" value="<%=goodsCarr%>"/>
       					<input type="hidden" name="goodssl" value="<%=goodssl%>"/>       					
       					</td>
       					<td></td>	
       					<td align="right">商品金额共计：￥<font style="color: red"><%=sum %></font>元</td>
       				</tr>      				
       			</table>		
       		</div>
       		<br/>
       		<div align="right">
       			请核对以上信息，确认无误后点击“提交订单”
       			<input type="submit" class="btnbg" value="">
       		</div>
       		</form>
        </div>         
        </center>        
        <br>
        <!-- 网站底部界面 -->     
   		<center>
   		<div id="db">			
			 	<div ><a href="#"><img src="images/db2.jpg"></img></a></div> <br>
			 	<div>
			 	<a href="#">公司简介</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">诚征英才</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">网站联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">百货招商</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">机构销售</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">手机奥络</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">官方Blog</a><br>
				<pre style="color:#7C7C7C;">Copyright (C) 奥络商城2004-2012, All Rights Reserved <a href="#">京ICP证041189号</a></pre>
			 	<a href="#"><img src="images/db3.gif"></img></a>&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/db4.png"></img></a>
			 	</div> 			 	 
   		</div>
   		</center>
    </div>
  </body>
</html>
