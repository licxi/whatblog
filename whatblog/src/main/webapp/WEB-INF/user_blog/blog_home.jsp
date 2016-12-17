<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
body {
	overflow: auto !important;
}
.modal{
	overflow: auto !important;
}
</style>
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
									<a href="<c:url value='/${user_name}/attentionManage?t=1'/>"><h5>关注你人数</h5></a>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${attentionCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins myshadow">
								<div class="ibox-title">
									<a href="<c:url value='/${user_name}/articleManage'/>"><h5>文章数量</h5></a>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${articleCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3 ">
							<div class="ibox float-e-margins myshadow">
								<div class="ibox-title">
									<a href="<c:url value='/${user_name}/messageManage'/>"><h5>留言数量</h5></a>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${messageCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins myshadow">
								<div class="ibox-title">
									<a href="<c:url value='/${user_name}/attentionManage?t=2'/>"><h5>你关注的人数</h5></a>
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
									<c:set var="article" value="${article }" scope="application"></c:set>
									<c:import url="../public/preview_article.jsp" >
									</c:import>
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
	<script type="text/javascript" src="<c:url value='/js/article_op.js'/>"></script>
	<!-- 鼠标进过时，展开下拉栏 -->
 <script type="text/javascript" src="<c:url value='/js/bootstrap-hover-dropdown.js'/>"></script> 
	<!-- 留言 -->
		<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
	
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