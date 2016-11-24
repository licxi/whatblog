<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/style.css'/>" type="text/css"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<title>${user.nickname }的博客</title>
</head>
<body>
	<c:import url="../public/navbar.jsp"></c:import>
	<section class="container">
		<!-- 用户信息 -->
		<div class="hidden-xs header">
			<div style="text-align: center; margin-top: 10px;">
				<h4 style="text-align: left; margin-left: 5px; margin-top: 10px;">个人资料</h4>
				<h5>-----------------------------------</h5>
				<div>
					<img alt="" src="${user.headUrl }"
						style="border-radius: 50%; width: 100px; height: 100px;" />
					<h4 style="margin-top: 5px; margin-bottom: 5px;">${user.nickname }</h4>
					<h5>${user.description }</h5>
				</div>
				<h5>======================</h5>
				<div style="text-align: left; margin-left: 45px;">
					<ul class="blog_rank">
						<li>文章：<span>${user.articleCount }篇</span>
						</li>
						<li>积分：<span>${user.mark }</span>
						</li>
						<li>博龄：<span>${user.blogAge }</span>
						</li>
					</ul>

				</div>
				<h5>======================</h5>

				<c:if test="${userHostArticles != null && userHostArticles.size() != 0 }">
				<div style="text-align: left; margin-left: 5px; margin-top: 10px;">
					<h4>阅读排行</h4>
					<h5>-----------------------------------</h5>
					<ul class="host-article">
						<c:forEach items="${userHostArticles }" var="userHostArticle">
							<li><a>${userHostArticle.articleTitle }</a></li>
						</c:forEach>
					</ul>
				</div>
				</c:if>
			</div>
		</div>
		<div class="content-wrap">
			<!--内容-->
			<div class="content">
				<header class="news_header" style="height: 50px;">
					<!-- <div class="col-sm-1 visible-lg">
						<img alt="" src="/whatblog/img/logo.png"
							style="border-radius: 50%; width: 80px; height: 80px;"
							id="openFile" class="img" />
					</div>
					<div class="col-sm-offset-1 col-sm-10">
						<h4>用户名</h4>
						<h5>用户博客描述</h5>
					</div> -->
					<!-- <p style="font-size: 22px;">用户的博客</p> -->
					<button class="btn btn-info" style="float: right !important;" onclick="attentionUser('${user.userName}')"
						data-toggle="tooltip" data-placement="top" id="attention"
						title="将博主添加到关注列表，来增加博主人气吧">加关注</button>
					<a class="btn btn-info"
						style="float: right !important; margin-right: 5px;"
						data-toggle="modal" data-target="#reply_message" href="">留言</a>

					
					<c:if test="${adminAccount != null}">
					<!-- 管理员查看时显示 -->
						<c:if test="${user.isLock == 0 }">
							<a class="btn btn-danger"
								style="float: right !important; margin-right: 5px;"
								id="modifyType${user.id }"
								onclick="modifyIsLock(${user.id },'${user.userName}')">锁定</a>
						</c:if>
						<c:if test="${user.isLock == 1 }">
							<a class="btn btn-info"
								style="float: right !important; margin-right: 5px;"
								id="modifyType${user.id }"
								onclick="modifyIsLock(${user.id },'${user.userName}')">启用</a>
						</c:if>
					</c:if>
				</header>

				<div>
					<!-- 文章列表 -->
					<c:set var="articles" value="${pages.list }" />
					<c:if test="${articles != null && articles.size() != 0 }">
						<c:forEach items="${articles }" var="article">
							<div class="ibox-content myshadow"
								style="background-color: #f6f6f6; margin-bottom: 20px;">
								<div class="row">
									<div class="articleShowImg">
										<a target="_blank" href=""><img class="showImg"
											src="${article.showImage }" alt=""> </a>
									</div>
									<div class="col-lg-9">
										<a href="" class="btn-link"> <!--跳转全文-->
											<h2 class="btn-link" align="center">${article.articleTitle }</h2>

											<p style="margin-top: 5px; margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;${article.articleSummary }</p>
										</a>
									</div>
									<div class="col-md-12 article-detail" align="right">
										<span class="label label-primary" style="font-size: 12px;">评论:${article.commentsCount }</span>
										<span class="label label-info" style="font-size: 12px;">查看:${article.articleClick }</span>
										<span class="label label-warning" style="font-size: 12px;">时间:
											<fmt:formatDate value="${article.createTime }"
												pattern="yyyy-MM-dd" />
										</span>

									</div>

								</div>
							</div>
						</c:forEach>
					</c:if>



					<div class="ibox-content myshadow"
						style="background-color: #f6f6f6; margin-bottom: 20px;">
						<div class="row">
							<div class="articleShowImg">
								<a target="_blank" href=""><img class="showImg"
									src="/whatblog/img/weixin.png" alt=""> </a>
							</div>
							<div class="col-lg-9">
								<a href="" class="btn-link"> <!--跳转全文-->
									<h2 class="btn-link" align="center">这是文章的标题</h2>

									<p style="margin-top: 5px; margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要</p>
								</a>
								<div class="row">
									<div class="col-md-12" align="right"
										style="margin-bottom: 5px;">
										<span class="label label-primary" style="font-size: 12px;">评论:100</span>
										<span class="label label-info" style="font-size: 12px;">查看:100</span>
										<span class="label label-warning" style="font-size: 12px;">时间:2016-7-8</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ibox-content myshadow"
						style="background-color: #f6f6f6; margin-bottom: 20px;">
						<div class="row">
							<div class="articleShowImg">
								<a target="_blank" href=""><img class="showImg"
									src="/whatblog/img/weixin.png" alt=""> </a>
							</div>
							<div class="col-lg-9">
								<a href="" class="btn-link"> <!--跳转全文-->
									<h2 class="btn-link" align="center">这是文章的标题</h2>

									<p style="margin-top: 5px; margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要</p>
								</a>
								<div class="row">
									<div class="col-md-12" align="right"
										style="margin-bottom: 5px;">
										<span class="label label-primary" style="font-size: 12px;">评论:100</span>
										<span class="label label-info" style="font-size: 12px;">查看:100</span>
										<span class="label label-warning" style="font-size: 12px;">时间:2016-7-8</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<c:import url="../public/right_bar.jsp"></c:import>
	</section>
	<div>
		<a href="javascript:;" class="gotop" style="display: block;z-index: 200"></a>
	</div>

	<!-- 弹出留言框 -->
	<div class="modal fade bs-example-modal-sm" id="reply_message"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">给博主留言</h4>
				</div>
				<div class="modal-body">
						<input type="hidden" id="toUser" name="toUser" value="${user.userName }">
						<div class="input-group" id="id">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									内容 </span>
							</span> <input id="content" name="content" class="form-control"
								placeholder="简要概括就好！" type="text" required="required"/>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary"
								onclick="submit()">确认</button>
						</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"
	type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/user-blog.js'/>"></script>

</html>