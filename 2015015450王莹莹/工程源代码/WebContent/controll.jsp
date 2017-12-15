<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>欢迎使用后台管理系统</h1>
	新增商品
	<form action = "/firstshop/addproduct" method = "post">
		新增商品名称：<input type = "text" name = "productname"/>
		新增商品价格: <input type = "text" name = "price"/>
		<input type = "submit" value = "提交至数据库"/>
	</form>
	<a href = "backstage.jsp">返回后台主页</a>
	<a href = "index.jsp">返回前台</a>
</body>
</html>