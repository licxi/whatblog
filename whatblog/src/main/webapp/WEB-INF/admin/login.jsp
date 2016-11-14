<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/font-awesome/css/font-awesome.css'/>"
	rel="stylesheet">

<link href="<c:url value='/css/animate.css'/>" rel="stylesheet">
<link href="<c:url value='/css/mystyle.css'/>" rel="stylesheet">
<style type="text/css">
#bg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

#bg img {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	width: 100%;
	height: 100%;
	z-index: -1;
}
</style>
<style type="text/css">
.myh1 {
	margin: 60px auto 50px auto;
	text-align: center;
	color: #fff;
	font-size: 35px;
	font-weight: bold;
	text-shadow: 0px 1px 1px #555;
}
</style>

</head>
<body class="gray-bg" onkeydown="login()" style="background: #fff url(/whatblog/img/1.jpg) 50% 0 no-repeat;">
	<%-- <div id="bg">
		<img src="<c:url value='/img/1.jpg'/>" alt="">
	</div> --%>
	<div>
		<div class="middle-box text-center loginscreen animated fadeInDown">
			<div>
				<h1 class="myh1">WhatBlog后台登录</h1>
				<!-- <p>Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views. -->
				<!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
				<!-- </p> -->
				<!-- <p>Login in. To see it in action.</p> -->
				<form class="m-t" role="form" action="" method="post">
					<div class="form-group">
						<input type="username" class="form-control" placeholder="管理员账号"
							required name="adminAccount" id="adminAccount">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="密码"
							required name="adminPassword" id="adminPassword">
					</div>
					<button type="button" id="login"
						class="btn btn-primary block full-width m-b">登录</button>

					<!-- <p class="text-muted text-center"><small>Do not have an account?</small></p> -->
					<!-- <a class="btn btn-sm btn-white btn-block" href="register.html">Create an account</a> -->
				</form>
			</div>
		</div>


		<script src="<c:url value='/js/jquery.min.js'/>"
			type="text/javascript"></script>
		<script src="<c:url value='/js/bootstrap.min.js'/>"
			type="text/javascript"></script>
		<script src="<c:url value='/js/jquery-md5.js'/>"
			type="text/javascript"></script>
		<script src="<c:url value='/js/admin_login.js'/>"
			type="text/javascript"></script>
		
</body>
</html>