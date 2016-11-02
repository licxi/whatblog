<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div class="wrapper wrapper-content animated fadeInRight">
		<h2>关注你的用户列表</h2>
		<hr />
		<div class="row">
			<div class="col-lg-4 ">
				<div class="contact-box myshadow">
					<a href="" target="_blank">
						<div class="col-sm-4">
							<div class="text-center">
								<img alt="image" class="img-circle m-t-xs img-responsive"
									src="/blog/Public/Uploads/default.png">
							</div>
						</div>
						<div class="col-sm-8">
							<h3>
								<strong>1231231231111</strong>
							</h3>
							<p>
								<i class="fa fa-map-marker"></i>关注时间：2016-01-22
							</p>

						</div>
						<div class="clearfix"></div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 ">
				<div class="contact-box myshadow">
					<a href="" target="_blank">
						<div class="col-sm-4">
							<div class="text-center">
								<img alt="image" class="img-circle m-t-xs img-responsive"
									src="/blog/Public/Uploads/default.png">
							</div>
						</div>
						<div class="col-sm-8">
							<h3>
								<strong>1231231231111</strong>
							</h3>
							<p>
								<i class="fa fa-map-marker"></i>关注时间：2016-01-22
							</p>

						</div>
						<div class="clearfix"></div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 ">
				<div class="contact-box myshadow">
					<a href="" target="_blank">
						<div class="col-sm-4">
							<div class="text-center">
								<img alt="image" class="img-circle m-t-xs img-responsive"
									src="/blog/Public/Uploads/default.png">
							</div>
						</div>
						<div class="col-sm-8">
							<h3>
								<strong>1231231231111</strong>
							</h3>
							<p>
								<i class="fa fa-map-marker"></i>关注时间：2016-01-22
							</p>

						</div>
						<div class="clearfix"></div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 ">
				<div class="contact-box myshadow">
					<a href="" target="_blank">
						<div class="col-sm-4">
							<div class="text-center">
								<img alt="image" class="img-circle m-t-xs img-responsive"
									src="/blog/Public/Uploads/default.png">
							</div>
						</div>
						<div class="col-sm-8">
							<h3>
								<strong>1231231231111</strong>
							</h3>
							<p>
								<i class="fa fa-map-marker"></i>关注时间：2016-01-22
							</p>

						</div>
						<div class="clearfix"></div>
					</a>
				</div>
			</div>
			<div class="col-lg-4 ">
				<div class="contact-box myshadow">
					<a href="" target="_blank">
						<div class="col-sm-4">
							<div class="text-center">
								<img alt="image" class="img-circle m-t-xs img-responsive"
									src="/blog/Public/Uploads/default.png">
							</div>
						</div>
						<div class="col-sm-8">
							<h3>
								<strong>1231231231111</strong>
							</h3>
							<p>
								<i class="fa fa-map-marker"></i>关注时间：2016-01-22
							</p>

						</div>
						<div class="clearfix"></div>
					</a>
				</div>
			</div>
		</div>
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
	<script>
		var s_url = window.location.pathname;
		var now_url = '';
		for (var i = 0; i < $("#side-menu li").length; i++) {
			now_url = $("#side-menu li a").eq(i).attr("href");
			if (now_url == s_url) {
				$("#side-menu a").eq(i).parent().addClass("active");
				$("#side-menu a").eq(i).parent().parent().parent().addClass(
						"active");
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
</body>
</html>