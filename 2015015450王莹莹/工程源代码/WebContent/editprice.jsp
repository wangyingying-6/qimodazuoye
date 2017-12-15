<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "/firstshop/editprice" method = "post">
		请输入你要修改的产品的id(预设值为您所点击的产品的id)：<input type = "text" name = "id" value = "${param.id}"/></br>
		请输入要修改的价格：<input type = "text" name = "price"/>
		<input type = "submit" value = "确定"/>
	</form>
</body>
</html>