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
<script type="text/javascript">
	function delconfirm(){	
		return confirm("是否删除该记录");
	}
</script>	

  </head>
  
  <body background="image/iframe.png">

    <table border="1" width="1000px">
    <tr>
    	<td>类型编号</td>
    	<td>类型名</td>
    	<td>房间数量</td>
    	<td>商品描述</td>
    	<td>商品图片</td>
    	<td>更新</td>
    	<td>删除</td>
    </tr>
    <s:iterator value="types" id="t">
    <tr>
    	<td><s:property value="#t.sid"/></td>
    	<td><s:property value="#t.sname"/></td>
    	<td><s:property value="#t.totalnum"/></td>
    	<td><s:property value="#t.sdesc"/></td>
    	<td><img src="<s:property value="#t.simage"/>" width="50" height="30"/></td>
    	<td><s:if test="role=admin"><a href="type/preupdatetype.action?type.sid=<s:property value="#t.sid"/>">更新</a></s:if><s:else>更新</s:else></td>
    	<td><s:if test="role=admin"><a href="type/deletetype.action?type.sid=<s:property value="#t.sid"/>" onclick="return delconfirm()">删除</a></s:if><s:else>删除</s:else></td>
    </tr>  
    </s:iterator>
    </table>
    <a href="javascript:history.back()">返回</a>
  </body>
</html>
