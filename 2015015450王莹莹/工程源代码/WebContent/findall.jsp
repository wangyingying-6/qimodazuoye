<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach items = "${products}" var = "p">
	<table border = "1">
		
		<tr>
			<td>商品名称：</td><td>${p.productname}</td><td><a href = "editname.jsp?id=${p.id}">修改商品名称</a></td>
		</tr>
		<tr>
			<td>商品价格：</td><td>${p.price}</td><td><a href = "editprice.jsp?id=${p.id}">修改商品价格</a></td>
		</tr>
	</table>
	
	
	<form action = "/firstshop/delete?id=${p.id}" method = "post"><input type = "submit" value = "删除商品"/></form>
	</c:forEach>
	<a href = "index.jsp">返回前台</a>
	<a href = "backstage.jsp">返回后台管理界面</a>
</body>
</html>