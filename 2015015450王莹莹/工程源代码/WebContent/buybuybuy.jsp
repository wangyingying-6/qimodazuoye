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
	<c:forEach items = "${cart.container}" var = "c">
		<tr>
			<td>商品名称:</td><td>${c.value.product.productname}</td>
			<td>商品数量：</td><td>${c.value.count}</td>
			<td>商品单价：</td><td>${c.value.product.price}</td>
			<td>产品价格：</td><td>${c.value.product.price*c.value.count}</td>
		</tr>
		</br>
	</c:forEach>
		<h2>商品总价：${sessionScope.money}</h2>
		<h1><a href = "poor.jsp">结账</a></h1>
</body>
</html>