<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showalluser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->	
	<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/cn_utf8.js"></script>
<script type="text/javascript" src="js/calendar-setup.js"></script>
  </head>
  
  <body id="allorders">
   <a href="javascript:history.back()">返回</a>
    <s:form namespace="/order" action="allordersbytime" method="post">
    	开始时间：<s:textfield name="myorder.st" id="f_date_a"></s:textfield>~~~~~~
    	结束时间：<s:textfield name="myorder.et" id="f_date_b"></s:textfield>
    	<s:submit value="按时间段查询订单"></s:submit>
    </s:form>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "f_date_a",         // 日期文本框的id属性
        ifFormat       :    "%Y-%m-%d",  // 输入日期的格式
        showsTime      :    true,               //是否现实时间
        onUpdate       :    null
    });
</script>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "f_date_b",         // 日期文本框的id属性
        ifFormat       :    "%Y-%m-%d",  // 输入日期的格式
        showsTime      :    true,               //是否现实时间
        onUpdate       :    null
    });
</script>
    <table border="1" width="1000px" align="center" style="margin-top: 200px;" id="biaoge6">
    <tr>
    	<td align="center">订单编号</td>
    	<td align="center">订单总金额</td>
    	<td align="center">下单时间</td>
    	<td align="center">订单状态</td>
    	<td align="center">确认订单</td>
    	
    </tr>
    <s:iterator value="allorders" id="p">
    <tr>
    	<td align="center"><a href="order/orderdetails.action?myorder.oid=<s:property value="#p.oid"/>"><s:property value="#p.oid"/></a></td>
    	<td align="center"><s:property value="#p.totalprice"/></td>
    	<td align="center"><s:property value="#p.otime"/></td>
    	<s:if test="#p.ostatus==1">
    		<td align="center">新订单</td>
    		<td align="center"><a href="order/updateorderstatus.action?myorder.oid=<s:property value="#p.oid"/>&myorder.ostatus==2">处理订单</a></td>
    	</s:if>
    	<s:else>
    		<td align="center">已处理</td>
    		<td>&nbsp;</td>
    	</s:else>
    </tr>  
    </s:iterator>
    </table>
  </body>
</html>