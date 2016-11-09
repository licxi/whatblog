<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关注管理</title>
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
		<ul class="nav nav-tabs" role="tablist" id="myTab">
			<li role="presentation" class="active"><a href="#attentionYou"
				role="tab" data-toggle="tab">关注你的博主</a></li>
			<li role="presentation"><a href="#yourAttention" role="tab"
				data-toggle="tab">你关注的博主</a></li>
		</ul>
		<div class="tab-content">
			<!-- 关注用户的博主 -->
			<div role="tabpanel" class="tab-pane active fade in"
				id="attentionYou" style="margin-top: 10px;">
				<div class="row">
					<c:if test="${attentionsYou != null && attentionsYou.size() != 0 }">
						<c:forEach items="${attentionsYou }" var="attention">
							<div class="col-lg-4 ">
								<div class="contact-box myshadow">
									<a href="" target="_blank">
										<div class="col-sm-4">
											<div class="text-center">
												<a href="${attention.headUrl }" target="_black"><img
													alt="image" class="img-circle"
													style="width: 80px; height: 80px;"
													src="${attention.headUrl }"></a>
											</div>
										</div>
										<div class="col-sm-8">
											<h3>
												<strong>${attention.nickname }</strong>
											</h3>
											<p>
												<i class="fa fa-map-marker"></i>关注时间：
												<fmt:formatDate value="${attention.attentionTime }"
													pattern="yyyy-MM-dd" />
											</p>

										</div>
										<div class="clearfix"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${attentionsYou == null || attentionsYou.size() == 0 }">
						没有用户关注你，快去发表文章，获取更多的人气吧！
					</c:if>
				</div>

			</div>
			<!-- 用户关注的博主 -->
			<div role="tabpanel" class="tab-pane fade" id="yourAttention"
				style="margin-top: 10px;">
				<div class="row">
					<c:if
						test="${yourAttentions != null && yourAttentions.size() != 0 }">
						<c:forEach items="${yourAttentions }" var="attention"
							varStatus="status">
							<div class="col-lg-4" id="att${attention.id }">
								<div class="contact-box myshadow">
									<a href="" target="_blank">
										<div class="col-sm-4">
											<div class="text-center">
												<a href="${attention.attentionHeadUrl }" target="_black"><img
													alt="image" class="img-circle"
													style="width: 80px; height: 80px;"
													src="${attention.attentionHeadUrl }"></a>
											</div>
										</div>
										<div class="col-sm-8">
											<h3>
												<strong>${attention.attentionNickname }</strong>
											</h3>
											<p>
												<i class="fa fa-map-marker"></i>关注时间：
												<fmt:formatDate value="${attention.attentionTime }"
													pattern="yyyy-MM-dd" />
											</p>
											<button class="btn btn-danger"
												onclick="cancelAttention(${attention.id})">取消关注</button>
										</div>
										<div class="clearfix"></div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if
						test="${yourAttentions == null || yourAttentions.size() == 0 }">
						你还没有关注过其他博主，
					</c:if>
				</div>
			</div>
		</div>


		<hr />

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
	<!-- 鼠标进过时，展开下拉栏 -->
	<script type="text/javascript"
		src="<c:url value='/js/bootstrap-hover-dropdown.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/js/attention_manage.js'/>"></script>
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
	<script>
			$(function() {
				$('#myTab a:first').tab('show')
			});
		</script>
</body>
</html>