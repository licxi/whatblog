<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>你的主页</title>
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

		<h2>信息总览</h2>

		<div class="row">
			<div class="col-lg-12">
				<div class="wrapper wrapper-content">
					<div class="row">
						<div class="col-lg-3 ">
							<div class="ibox float-e-margins myshadow">
								<div class="ibox-title">
									<h5>关注你人数</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${attentionCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins myshadow">
								<div class="ibox-title">
									<h5>文章数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${articleCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3 ">
							<div class="ibox float-e-margins myshadow">
								<div class="ibox-title">
									<h5>留言数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${messageCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins myshadow">
								<div class="ibox-title">
									<h5>你关注的人数</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${youAttentionCount }</h1>
								</div>
							</div>
						</div>
					</div>
					<!-- 首页文章开始 -->
					<h2>你的热门文章</h2>
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox">
								<!--循环取出-->
								<c:if test="${hostArticles != null && hostArticles.size() != 0}">
								<c:forEach items="${hostArticles }" var="article">
								<div class="ibox-content myshadow">

									<div class="row">
										<div class="col-lg-2">
											<a href="" class="button_link"> <img alt="image"
												class="img-responsive"
												src="${article[showImage] }"
												style="max-height: 150px; min-height: 120px;"> <span
												class="line line_top"></span> <span class="line line_right"></span>
												<span class="line line_bottom"></span> <span
												class="line line_left"></span>
											</a>
										</div>
										<div class="col-lg-10">
											<a href="" class="btn-link"> <!--跳转全文-->
												<h2>${article[articleTitle] }</h2>
											</a>
											<p>${article[articleSummary] }</p>
											<div class="row">
												<div class="col-md-10">
													<span class="label label-primary" style="font-size: 12px;">评论:100</span>
													<span class="label label-info" style="font-size: 12px;">查看:100</span>
													<span class="label label-warning" style="font-size: 12px;">时间:2016-7-8</span>
												</div>
												<div class="col-md-2" style="margin-top: 10px;">
													<div class="small text-right">
														<a href=""><button type="button"
																class="btn btn-w-m btn-danger">查看全文</button></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div><br />
								</c:forEach>
								</c:if>
								<c:if test="${hostArticles == null || hostArticles.size() == 0}">
									你还没有写过文章哟，快去创作你的文章吧!!!
								</c:if>
							</div>
						</div>
						<!-- 首页文章结束 -->
					</div>
					<!-- 正文结束 -->
				</div>
			</div>
		</div>
	</div>
	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>
	<!--返回顶部-->
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