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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>My JSP 'updategoods.jsp' starting page</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/adminIndex.css">
  </head>
  <script type="text/javascript">
  		function ShowImg(img,file){
  			var imgyl =document.getElementById("imgyl");
  			img.src=file.value;
  			imgyl.style.display="block";  			
  		}
  		function goods(){
  			var goodsName =document.getElementById("goodsName");
  			var goodsPrice =document.getElementById("goodsPrice");
  			var goodsCarr =document.getElementById("goodsCarr");
  			var goodsAddr =document.getElementById("goodsAddr");
  			var goodsIntro =document.getElementById("goodsIntro");
  			
  			if(goodsName.value.length<=0){
  				alert("请输入商品名！");
  				return false;
  			}else if(goodsName.value.length>25){
  				alert("商品名长度不能大于25位！");
  				return false;
  			}
  			
  			if(goodsPrice.value.length<=0){
  				alert("请输入商品价格！");
  				return false;
  			}else if(isNaN(goodsPrice.value)){
  				alert("请输入正确的字符！");
  				return false;
  			}
  			
  			if(goodsCarr.value.length<=0){
  				alert("请输入商品运费！");
  				return false;
  			}else if(isNaN(goodsCarr.value)){
  				alert("请输入正确的字符！");
  				return false;
  			}
  			
  			if(goodsAddr.value.length<=0){
  				alert("请输入商品所在地！");
  				return false;
  			}else if(goodsAddr.value.length>10){
  				alert("商品所在地长度不能大于10！");
  				return false;  			
  			}else if(!isNaN(goodsAddr.value)){
  				alert("请输入正确的字符！");
  				return false;
  			}
  			
  			if(goodsIntro.value.length<=0){
  				alert("请输入商品介绍！");
  				return false;
  			}
  			return true;  			
  		}  	
  </script>  
  <body>
  		<%
		      int goodsid =Integer.parseInt(request.getParameter("goodsId"));
		      GoodsInfo goods = new GoodsInfo();
		      GoodsCtrl gc = new GoodsCtrl();		      
		      goods=gc.selgoods(goodsid);
	      %>
       <form action="servlet/Admin_UpdateGoodsServlet" method="post" onsubmit="return goods()">
		<div id="container">
	   	 <div id="right">
	    	<div class="content">
	       	  <div class="rtbd">
	           	<div class="jyjl">
	              <h2><img src="admin/images/ibg1.jpg" />编辑商品</h2>
	            </div>
	        	<table class="tblist" width="100%" cellspacing="0" cellpadding="0">                       
	              <tr>
	                <td align="right">* 商品名称：</td>
	                <td>
	                <input type="text" style="width: 382px;" name="goodsName" id="goodsName" value="<%=goods.getGoodsname() %>" />
	                <input type="hidden" name="goodsId" id="goodsId" value="<%=goods.getGoodsId()%>"/>
	                </td>
	              </tr>
	              <tr>
	                <td align="right">* 商品类别：</td>	                
	                <td>
	               	 <select name="goodsSort">
	               	 	<%
						  AdinUserCrtl ac = new AdinUserCrtl();
						  ArrayList<GoodsSort> asort =ac.selsort();
						  for(GoodsSort sort : asort){					 		  
						 %>						
	               	 	<option value="<%=sort.getSortId() %>" <%if(goods.getGoodssort().equals(sort.getSortId()+"")){out.write("selected='selected'");} %>><%=sort.getSortname() %></option>
	               	 	 <% } %>
	               	 </select>
	               	</td>	               
	              </tr>
	              <tr>
	                <td align="right">* 商品售价：</td>
	                <td>
	                <input type="text" name="goodsPrice" id="goodsPrice" style="width: 50px;" value="<%=goods.getGoodsprice() %>">&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                	* 运费：<input type="text" name="goodsCarr" id="goodsCarr" style="width: 50px;" value="<%=goods.getGoodscarr() %>">&nbsp;元
	                </td>
	              </tr>
	              <tr>
	                <td align="right">* 所在地：</td>
	                <td><input type="text" name="goodsAddr" id="goodsAddr" value="<%=goods.getGoodsaddr() %>"/></td>
	              </tr>
	              <tr id="imgyl">
	              	<td align="right">图片预览：</td>
	              	<td><img style="height: 100px;width: 150px;" id="goodsimg" alt="" src="<%=goods.getGoodsimg() %>"></td>
	              </tr>
	              <tr>
	                <td align="right">* 商品图片：</td>
	                <td>
	                <input type="file" name="goodsImg" onchange="ShowImg(goodsimg,this)" />	                
	                </td>
	              </tr>	              
	              <tr>
	                <td align="right">是否推荐：</td>
	                <td>
		                <input type="radio" name="isTuijian" value="true" <%if("true".equals(goods.getGoodstuijian())){out.print("checked='checked'");} %>/>推荐
					 	<input type="radio" name="isTuijian" value="false" <%if("false".equals(goods.getGoodstuijian())){out.print("checked='checked'");} %> />不推荐
				 	</td>
	              </tr>
	              <tr>
	                <td align="right">是否限量：</td>
	                <td>
		                <input type="radio" name="isXianliang" value="true" <%if("true".equals(goods.getGoodsxianliang())){out.print("checked='checked'");} %>/>限量
					 	<input type="radio" name="isXianliang" value="false" <%if("false".equals(goods.getGoodsxianliang())){out.print("checked='checked'");} %>/>不限量
				 	</td>
	              </tr>
	              <tr>
	                <td align="right">是否特价：</td>
	                <td>
		                <input type="radio" name="isTejia" value="true" <%if("true".equals(goods.getGoodstejia())){out.print("checked='checked'");} %>/>特价
					 	<input type="radio" name="isTejia" value="false" <%if("false".equals(goods.getGoodstejia())){out.print("checked='checked'");} %>/>不特价
				 	</td>
	              </tr>
	              <tr>
	                <td align="right">是否促销：</td>
	                <td>
		                <input type="radio" name="isCuxiao" value="true" <%if("true".equals(goods.getGoodscuxiao())){out.print("checked='checked'");} %>/>促销
					 	<input type="radio" name="isCuxiao" value="false" <%if("false".equals(goods.getGoodscuxiao())){out.print("checked='checked'");} %>/>不促销
				 	</td>
	              </tr>
	              <tr>
	                <td align="right">* 商品状态：</td>
	                <td>
		                <input type="radio" name="goodsZt" value="true" <%if("true".equals(goods.getGoodszt())){out.print("checked='checked'");} %>/>上架
					 	<input type="radio" name="goodsZt" value="false" <%if("false".equals(goods.getGoodszt())){out.print("checked='checked'");} %> />下架
				 	</td>
	              </tr>
	               <tr>
	                <td align="right">* 商品介绍：</td>
	                <td><textarea name="goodsIntro" id="goodsIntro" cols="60" rows="10"><%=goods.getGoodsintro() %></textarea></td>
	              </tr>
	              <tr>
	              	<td width="200px;"></td>
	              	<td align="left"><input type="submit" style="margin-left: 200" class="btnbg" value="确认修改"></td>	              	
	              </tr>
	            </table>
		       	  </div>
		        </div>
		    </div>
		</div>
	</form>
  </body>
</html>
