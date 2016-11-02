<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>你的个人信息</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/font-awesome/css/font-awesome.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/animate.css" rel="stylesheet'/>"
	rel="stylesheet">
<link href="<c:url value='/css/mystyle.css" rel="stylesheet'/>"
	rel="stylesheet">
</head>
<body>
	<c:import url="../public/user_sidebar.jsp"></c:import>
	<div class="wrapper wrapper-content animated fadeInRight" style="padding-bottom: 10px;">
		<h3>个人信息页面</h3>

	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox">
				<input type="file" id="imgUpl" name="imgUpl"
					onchange="fileSelectd()" style="display: none;" />

				<div
					style="text-align: left; padding-top: 0px; margin-left: 10px; margin-right: 10px;">
					<form class="form-horizontal" role="form" action="saveUserInfo.do" method="post">
						<input type="hidden" name="id" value="${user.id }">
						<div class="form-group ">
						
							<div class="col-sm-offset-4 col-sm-6 avatar"
								style="padding-left: 0px;">
								<%-- <a style="background: url('${user.headUrl}');"
									id="openFile" class="img"> <!--<img alt="" title="点我更换头像" src="/whatblog/img/logo.png" 
						      	style="border-radius: 50%;width: 145px;height: 145px;;"
						      		id="openFile" class="img"/>--> <span>点我修改头像</span>
								</a> --%>
								
								 <img alt="" title="点我更换头像" src="${headUrl}" 
						      	style="border-radius: 50%;width: 145px;height: 145px;"
						      		id="openFile" class="img" >
							</div>
							<div style="margin-top: 60px" id="modify_head_tip">
								<span>点击图片更换头像</span>
							</div>
						</div>
						<input type="hidden" name="headUrl" value="${headUrl }" id="headUrl" >
						<div class="form-group ">
							<label for="nickname" class="col-sm-2 control-label">昵称</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="nickname"
									name="nickname" placeholder="不为空，且不超过10位" readonly value="${user.nickname }">
							</div>
							<div style="text-align: left; padding-top: 5px;">
								<span
									style="font-size: 16px; color: red; font-family: 'arial black'"
									id="nickname_tip"></span>
							</div>
						</div>
						<div class=" form-group">
							<label for="phone" class=" col-sm-2 control-label">手机号</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="请输入正确的号码" readonly onblur="check_phone()" value="${user.phone }">
							</div>
							<div style="text-align: left; padding-top: 5px;">
								<span
									style="font-size: 16px; color: red; font-family: 'arial black'"
									id="phone_tip"></span>
							</div>
						</div>
						<div class=" form-group">
							<label for="email" class=" col-sm-2 control-label">邮箱</label>
							<div class=" col-sm-6">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="输入你常用的邮箱" readonly onblur="check_email()" value="${user.email }">
							</div>
							<div style="text-align: left; padding-top: 5px;">

								<span
									style="font-size: 16px; color: red; font-family: 'arial black'"
									id="email_tip"></span>
							</div>
						</div>
						<div class=" form-group">
							<label for="qq" class=" col-sm-2 control-label">QQ</label>
							<div class=" col-sm-6">
								<input type="text" class="form-control" id="qq" name="qq"
									placeholder="输入你心爱的qq号" readonly value="${user.qq }">
							</div>
							<div style="text-align: left; padding-top: 5px;">

								<span
									style="font-size: 16px; color: red; font-family: 'arial black'"
									id="qq_tip"></span>
							</div>
						</div>
						<div class=" form-group">
							<label for="address" class=" col-sm-2 control-label">地址</label>
							<div class=" col-sm-6">
								<input type="text" class="form-control" id="address"
									name="address" placeholder="你的居住地址" readonly value="${user.address }">
							</div>
							<div style="text-align: left; padding-top: 5px;">

								<span
									style="font-size: 16px; color: red; font-family: 'arial black'"
									id="nickname_tip"></span>
							</div>
						</div>
						<div class=" form-group">
							<label for="description" class=" col-sm-2 control-label">个性签名</label>
							<div class=" col-sm-6">
								<input type="text" class="form-control" id="description"
									name="description" placeholder="用个性签名，展现你的自己吧" readonly value="${user.description }">
							</div>
							<div style="text-align: left; padding-top: 5px;">
								<span
									style="font-size: 16px; color: red; font-family: 'arial black'"
									id="description_tip"></span>
							</div>
						</div>
						<div class=" form-group">
							<label for="school" class=" col-sm-2 control-label">学校</label>
							<div class=" col-sm-6">
								<input type="text" class="form-control" id="school"
									name="school" placeholder="毕业的学校" readonly value="${user.school }">
							</div>
							<div style="text-align: left; padding-top: 5px;">
								<span
									style="font-size: 16px; color: red; font-family: 'arial black'"
									id="school_tip"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="radio" class=" col-sm-2 control-label">性别</label>
							<div class="col-sm-6">
								<div class="radio">
									<label> <input type="radio" value="男" name="gender"
										id="man" <c:if test="${user.gender == '男' }"> checked</c:if> disabled="disabled"> 男
									</label> <label> <input type="radio" value="女" name="gender"
										id="woman" <c:if test="${user.gender == '女' }"> checked</c:if> disabled="disabled"> 女
									</label>
								</div>

							</div>
						</div>
						<div class="form-group">

							<div class="col-sm-6" style="margin-left: 38%;">
								<button type="button" id="modify" class="btn btn-default">修改</button>
								<a type="button" id="cancel" class="btn btn-default" href="userInfo.do"
									style="display: none">取消</a>
								<button type="submit" id="submit" class="btn btn-primary"
									style="display: none">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 首页文章结束 -->
	</div>
	<!-- 正文结束 -->
	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>
	<script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/jquery-ui-1.10.4.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<!-- 手风琴菜单 -->
	<script
		src="<c:url value='/js/plugins/metisMenu/jquery.metisMenu.js'/>"></script>
	<!-- 滚动条 -->
	<script
		src="<c:url value='/js/plugins/slimscroll/jquery.slimscroll.min.js'/>"></script>
	<!-- 导航菜单 -->
	<script src="<c:url value='/js/inspinia.js'/>"></script>
	<!-- 进度条 -->
	<script src="<c:url value='/js/plugins/pace/pace.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ajaxfileupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/user_info.js'/>"></script>
	<script>
			var s_url = window.location.pathname;
			var now_url = '';
			for(var i = 0; i < $("#side-menu li").length; i++) {
				now_url = $("#side-menu li a").eq(i).attr("href");
				if(now_url == s_url) {
					$("#side-menu a").eq(i).parent().addClass("active");
					$("#side-menu a").eq(i).parent().parent().parent().addClass("active");
					$("#side-menu a").eq(i).parent().parent().addClass("in");
				} else {
					$("#side-menu a").eq(i).parent().removeClass("active");
				}
			}
		</script>
		<!-- 返回顶部 -->
		<script>
		//返回顶部按钮
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 100) {
					$(".gotop").fadeIn();
				} else {
					$(".gotop").hide();
				}
			});
			$(".gotop").click(function() {
				$('html,body').animate({
					'scrollTop' : 0
				}, 500);
			});
		});
	</script>
	<c:if test="${msg != null}">
	<script type="text/javascript">
		
		window.onload = function(){
			alert('${msg }');
		}
	</script>
	</c:if>
</body>
</html>