<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value='/js/jquery.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"
	type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/login.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/login.css'/>" />
<title>
	<c:if test="${type == 1 }">用户登录</c:if>
	<c:if test="${type == 0 }">用户注册</c:if>
</title>
</head>
<body>
	<h1>欢迎使用WhatBlog</h1>

	<div class="login" style="margin-top: 50px;">

		<div class="header">
			<div class="switch" id="switch">
				<a class="<c:if test="${type == 0 }">switch_btn</c:if><c:if test="${type == 1 }">switch_btn_focus</c:if>" id="switch_qlogin"
					href="javascript:void(0);" tabindex="7">快速登录</a> 
					<a class="<c:if test="${type == 0 }">switch_btn_focu</c:if><c:if test="${type == 1 }">switch_btn</c:if>" id="switch_login" href="javascript:void(0);"
					tabindex="8">快速注册</a>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 64px; left: <c:if test="${type == 0 }">154</c:if><c:if test="${type == 1 }">0</c:if>px;"></div>
			</div>
		</div>


		<div class="web_qr_login" id="web_qr_login"
			style="display: <c:if test='${type == 0 }'>none</c:if> <c:if test='${type == 1 }'>block</c:if>; height: 235px;">

			<!--登录-->
			<div class="web_login" id="web_login">


				<div class="login-box">


					<div class="login_form">
						<form action="" name="loginform" accept-charset="utf-8"
							id="login_form" class="loginForm" method="post">
							<input type="hidden" name="did" value="0" /> <input type="hidden"
								name="to" value="log" />
							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="u">帐号：</label>
								<div class="inputOuter" id="uArea">

									<input type="text" id="username" name="username" class="inputstyle" />
								</div>
							</div>
							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="p">密码：</label>
								<div class="inputOuter" id="pArea">

									<input type="password" id="password" name="password" class="inputstyle" />
								</div>
							</div>

							<div style="padding-left: 50px; margin-top: 20px;">
								<input type="button" value="登 录" style="width: 150px;"
									class="button_blue" id="login" />
							</div>
						</form>
					</div>

				</div>

			</div>
			<!--登录end-->
		</div>

		<!--注册-->
		<div class="qlogin" id="qlogin"
			style="display: <c:if test="${type == 0 }">block</c:if> <c:if test="${type == 1 }">none</c:if>; ">

			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8" action="reg.do"
					method="post">
					<input type="hidden" name="to" value="reg" /> <input type="hidden"
						name="did" value="0" />
					<ul class="reg_form" id="reg-ul">
						<div id="userCue" class="cue">请按格式填写</div>
						<li><label for="user" class="input-tips2">账号：</label>
							<div class="inputOuter2">
								<input type="text" id="userName" name="userName" maxlength="16" onblur="checkUserName()"
									class="inputstyle2" placeholder="支持英文，数字，下划线"/>
							</div></li>

						<li><label for="user" class="input-tips2">昵称：</label>
							<div class="inputOuter2">
								<input type="text" id="nickname" name="nickname" maxlength="16"
									class="inputstyle2" placeholder="15位以下的字符"/>
							</div></li>

						<li><label for="passwd" class="input-tips2">密码：</label>
							<div class="inputOuter2">
								<input type="password" id="reg_password" name="password" maxlength="16"
									class="inputstyle2" placeholder="6位到16位密码"/>
							</div></li>
						<li><label for="passwd2" class="input-tips2">确认密码：</label>
							<div class="inputOuter2">
								<input type="password" id="reg_repassword" name="" maxlength="16"
									class="inputstyle2" placeholder="再次确认密码" onkeyup="checkPassword()"/>
							</div></li>

						<!-- <li><label for="qq" class="input-tips2">：</label>
							<div class="inputOuter2">

								<input type="text" id="qq" name="qq" maxlength="10"
									class="inputstyle2" />
							</div></li> -->
						<li><label for="qq" class="input-tips2">验证码：</label>
							<div class="inputOuter2">

								<input type="text" id="reg_vc" name="vc" maxlength="10"
									class="inputstyle3" />
								<img title="点击更改换验证码" id="vc" class="vc_img" src="../util/getVC.do" onclick="refalsh_code()" />
							</div></li>

						<li>
							<div class="inputArea">
								<input type="button" id="reg"
									style="margin-top: 10px; margin-left: 130px;"
									class="button_blue" value="注册" /> <a href="#" class="zcxy"
									target="_blank"></a>
							</div>

						</li>
						<div class="cl"></div>
					</ul>
				</form>


			</div>


		</div>
		<!--注册end-->
	</div>
	<div class="jianyi">*推荐使用ie11或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body>
</html>