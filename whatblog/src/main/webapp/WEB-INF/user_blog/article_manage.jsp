<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>你的文章</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/font-awesome/css/font-awesome.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/animate.css" rel="stylesheet'/>"
	rel="stylesheet">
<link href="<c:url value='/css/mystyle.css" rel="stylesheet'/>"
	rel="stylesheet">
</head>
</head>
<body>
	<c:import url="../public/user_sidebar.jsp"></c:import>
	<div class="wrapper wrapper-content animated fadeInRight">
		<h2>所有文章</h2>
		<div class="row">
			<div class="col-lg-12">
				<div class="wrapper wrapper-content animated fadeInUp">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox">
								<!--循环取出-->
								<c:if test="${articles != null && articles.size() != 0}">
									<c:forEach items="${articles }" var="article">
										<%-- <div class="ibox-content myshadow">

											<div class="row">
												<div class="col-lg-2">
													<a href="" class="button_link"> <img alt="image"
														class="img-responsive" src="${article.showImage }"
														style="max-height: 150px; min-height: 120px;"> <span
														class="line line_top"></span> <span
														class="line line_right"></span> <span
														class="line line_bottom"></span> <span
														class="line line_left"></span>
													</a>
												</div>
												<div class="col-lg-10">
													<a href="showArticle?article_id=${article.id }"
														class="btn-link"> <!--跳转全文-->
														<h2>${article.articleTitle }</h2>
													</a>
													<p>${article.articleSummary }</p>

												</div>
												
											</div>
											<div class="row">
													<div class="col-md-7 " style="margin-bottom: 5px;">
														<span class="label label-success" style="font-size: 12px;">分类:${article.typeName }</span>
														<span class="label label-primary" style="font-size: 12px;">评论:${article.commentsCount }</span>
														<span class="label label-info" style="font-size: 12px;">查看:${article.articleClick }</span>
														<span class="label label-warning" style="font-size: 12px;">发布于:<fmt:formatDate
																value="${article.createTime }"
																pattern="yyyy年MM月dd日  HH:mm:ss"></fmt:formatDate></span>
													</div>
													<div class="col-md-5">
														<div class="small text-right">
															<a href="showArticle?article_id=${article.id }" class="btn btn-primary">查看全文</a>
															<a href="#" class="btn btn-danger">删除</a>
															<a href="#" class="btn btn-info">
																<c:if test="${article.articleType == 1 }">设为不可见</c:if>
																<c:if test="${article.articleType == 0 }">设为公开</c:if>
															</a>
															
														</div>
													</div>
												</div>
										</div>
										<br /> --%>
											<c:set var="article" value="${article }" scope="application"></c:set>
										<c:import url="../public/preview_article.jsp">
									
										</c:import>
									</c:forEach>
								</c:if>
								<c:if test="${articles == null || articles.size() == 0}">
									你还没有写过文章哟，快去创作你的文章吧!!!
								</c:if>
							</div>
						</div>
					</div>
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
	
	<!-- 文章的相关操作 -->
	<script type="text/javascript" src="<c:url value='/js/article_op.js'/>"></script>
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