<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'login_success.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<link type="text/css" rel="stylesheet" href="css/book.css" />
		<link rel="stylesheet" type="text/css" href="sdmenu/sdmenu.css" />
		<script type="text/javascript" src="sdmenu/sdmenu.js">
	
</script>

		<script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
		showtime();
	};
	// ]]>
</script>
		<script type="text/javascript">
	function showtime() {
		d = new Date();
		h = document.getElementById("time1");
		h.innerHTML = d.toLocaleString();
		o = setTimeout("showtime()", 1000);
	}
</script>
	</head>

	<body>
		<div id="header">
			<img alt="" src="image/logo.jpg">
			<span>TRADITIONALLY ROYAL HOTEL</span>
			<table>
				<tr>

					<td>
						<font color="#F7E6C0"><s:text name="html.main.welcome"></s:text>&nbsp;&nbsp;<s:property
								value="#session.userinfo.username" />&nbsp;&nbsp;<s:text
								name="html.main.login"></s:text>酒店预订系统</font>
					</td>
					<td id="time1"></td>
					<td>
						&nbsp;&nbsp;
					</td>
					<td>
						<a href="user/userlogoff.action"><s:text
								name="html.main.logoff"></s:text>
						</a>
					</td>
				</tr>
			</table>
			<img src="image/image.jpg" width="1000px" height="310px" />
			<br />
		</div>
		<div id="center">
			<div id="leftmenu">
				<div id="my_menu" class="sdmenu">
					<div>
						<span><s:text name="html.main.usermanage"></s:text>
						</span>
						<ul>
							<s:if test="session.userinfo.role=='admin'">
								<li>
									<a href="user/getalluser.action" target="myframe"><s:text
											name="html.main.selectalluser"></s:text>
									</a>
								</li>
								<li>
									<a href="user/preinsertuser.action" target="myframe"><s:text
											name="html.main.adduser"></s:text>
									</a>
								</li>
							</s:if>
							<s:if test="session.userinfo.role=='member'">
								<li>
									<a
										href="user/selectuserbyuserid.action?user.userid=<s:property value="session.userinfo.userid"/>"
										target="myframe"><s:text name="html.main.updateuserinfo"></s:text>
									</a>
								</li>
							</s:if>
						</ul>
						<br />
					</div>
					<div>
						<span><s:text name="html.main.ordermanage"></s:text>
						</span>
						<ul>
							<s:if test="session.userinfo.role=='admin'">
								<li>
									<a href="order/allorders.action" target="myframe"> <s:text
											name="html.main.selectallorder"></s:text>
									</a>
								</li>

							</s:if>
							<s:if test="session.userinfo.role=='member'">
								<li>
									<a href="order/myorders.action" target="myframe"> <s:text
											name="html.main.selectmyorder"></s:text>
									</a>
								</li>
							</s:if>
						</ul>
						</div>
						<div>
						<span><s:text name="html.main.commentmanage"></s:text>
						</span>
						<ul>
							<li>
								<a href="comment/getallcomments.action" target="myframe"> <s:text
										name="html.main.selectallcomment"></s:text>
								</a>
							</li>
						</ul>
					</div>
					<div>
						<span><s:text name="html.main.roommanage"></s:text>
						</span>
						<ul>
							<s:if test="session.userinfo.role=='admin'">
								<li>
									<a href="room/getallrooms.action" target="myframe"> <s:text
											name="html.main.selectallroom"></s:text>
									</a>
								</li>
								<li>
									<a href="room/preinsertroom.action" target="myframe"> <s:text
											name="html.main.addnewroom"></s:text>
									</a>
								</li>
							</s:if>
							<s:if test="session.userinfo.role=='member'">
								<li>
									<a href="room/selectallroomsforguest.action" target="myframe"><s:text
											name="html.main.selectallroom"></s:text>
									</a>
								</li>
							</s:if>
						</ul>
					</div>
					<div>
						<span><s:text name="html.main.stylemanage"></s:text>
						</span>
						<ul>

							<s:if test="session.userinfo.role=='admin'">
								<li>
									<a href="type/preinserttype.action" target="myframe"><s:text
											name="html.main.addtype"></s:text>
									</a>
								</li>
								<li>
									<a href="type/gettypes.action" target="myframe"><s:text
											name="html.main.selectalltype"></s:text>
									</a>
								</li>
							</s:if>
							<s:if test="session.userinfo.role=='member'">
								<li>
									<a href="type/gettypes.action" target="myframe"><s:text
											name="html.main.selectalltype"></s:text>
									</a>
								</li>
							</s:if>
						</ul>
					</div>

				</div>
			</div>
				<iframe src="index.jsp" name="myframe" width="1200px" height="800px"></iframe>
		</div>
        <div id="footer">1996 - 2015 Marriott International, Inc. 保留所有权利,Sheraton酒店所有权信息.<br />
              About our hotel&nbsp;|   联系我们</a>&nbsp;
</div>

		<a href="javascript:history.back()"><s:text name="html.main.back"></s:text>
		</a>
	</body>
</html>
