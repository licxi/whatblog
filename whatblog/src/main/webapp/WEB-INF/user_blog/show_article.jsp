<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${article.articleTitle }</title>
<link type="text/css" href="<c:url value='/css/shThemeMidnight.css'/>"
	rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/js/shCore.min.js'/>"></script>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/font-awesome/css/font-awesome.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/animate.css" rel="stylesheet'/>"
	rel="stylesheet">
<link href="<c:url value='/css/mystyle.css" rel="stylesheet'/>"
	rel="stylesheet">

<!-- 引入代码高亮 -->
<link type="text/css" href="<c:url value='/css/shThemeMidnight.css'/>"
	rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/js/shCore.min.js'/>"></script>
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
<style type="text/css">
.container {
	width: 100%;
}
</style>
</head>
<body>
	<c:import url="../public/user_sidebar.jsp"></c:import>
	<div class="wrapper wrapper-content animated fadeInRight">
		<!-- <h2>文章标题<a class="btn btn-info navbar-right" href="">删除</a></h2> -->
		<div class="col-sm-12">
			<div class="col-sm-10">
				<h2>${article.articleTitle }</h2>
				<ul class="myul">
					<li class="myli">发布于 ：<fmt:formatDate
							value="${article.createTime }" pattern="yyyy年MM月dd日  HH:mm:ss"></fmt:formatDate></li>
					<li class="myli">分类：<a class="mya" href="" title=""
						target="_blank">${article.typeName }</a></li>
					<li class="myli"><strong>${article.articleClick }</strong> 查看
					</li>
					<li class="myli"><strong>${article.commentsCount }</strong> 评论</li>
				</ul>
			</div>
			<div class="col-sm-offset-10">
				<a
					href="<c:url value='/${user_name }/modifyArticle/${article.id }'/>"
					class="btn btn-primary ">修改</a>
				<button class="btn btn-danger navbar-right"
					onclick="deleteArticleInShowArticle(${article.id})">删除</button>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="wrapper wrapper-content">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox myshadow"
								style="background-color: white; padding: 10px 20px 10px 20px;">
								${article.articleContent }</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${article.comments != null}">
			<div class="content-block comment">
				<h2 class="title">
					<strong>评论</strong>
				</h2>
			</div>
			<c:forEach items="${article.comments }" var="comments">
				<div class="feed-element myshadow ">
					<div style="margin: 10px 10px 10px 10px;">
						<a href="#" class="pull-left"><img alt="image"
							class="img-circle" src="${comments.headUrl }"></a>
						<div class="media-body">
							<button class="btn btn-danger pull-right"
								style="font-size: 12px;">删除</button>
							<strong style="font-size: 15px;">${comments.nickname }</strong><br>
							<small class="text-muted"><fmt:formatDate
									value="${comments.time }" pattern="yyyy年MM月dd日  HH:mm:ss"></fmt:formatDate></small>
							<div class="well" style="font-size: 14px; margin-right: 50px;">${comments.content }</div>
							<div class="pull-right">
								</a>
							</div>
						</div>
					</div>
					<c:if test="${comments.comments != null }">
						<c:forEach items="${comments.comments }" var="comment">
							<div class="feed-element"
								style="margin-left: 50px; margin-right: 100px">
								<a href="#" class="pull-left"><img alt="image"
									class="img-circle" src="${comments.headUrl }"></a>
								<div class="media-body ">
									<small class="pull-right" style="font-size: 12px;"></small> <strong
										style="font-size: 15px;">${comments.nickname }</strong><br>
									<small class="text-muted"><fmt:formatDate
											value="${comments.time }" pattern="yyyy年MM月dd日  HH:mm:ss"></fmt:formatDate></small>
									<div class="well" style="font-size: 14px;">${comments.content }</div>
									<div class="pull-right">
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</c:forEach>
		</c:if>
		<c:if
			test="${article.comments == null || article.comments.size() == 0}">
		文章还没有评论
	</c:if>
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
	<!-- 文章的相关操作 -->
	<script type="text/javascript" src="<c:url value='/js/article_op.js'/>"></script>
	<!-- 鼠标进过时，展开下拉栏 -->
	<script type="text/javascript"
		src="<c:url value='/js/bootstrap-hover-dropdown.js'/>"></script>

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