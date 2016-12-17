<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入css文件 -->
<c:import url="../public/admin_common_css.jsp"></c:import>
<title>后台首页</title>
<style>
th {
	text-align: center;
}

td {
	text-align: center;
}
</style>
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

	<div id="wrapper">
		<c:import url="../public/admin_navbar.jsp"></c:import>
		<div class="row" id="page-wrapper" style="margin-top: 50px;">
			<div class="col-lg-12">
				<div class="wrapper wrapper-content">
					<div class="row">
						<div class="col-lg-3">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>会员数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${usersCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>文章数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${articlesCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>用户建议数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${suggestsCount }</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>评论数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">${commentsCount }</h1>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-8" style="padding-left: 0px;">
						<div class="panel panel-primary">
							<div class="panel-heading">热门文章</div>
							<div class="panel-body">
								<div class="list-group">
									<c:if test="${hostArticles != null && hostArticles.size() !=0 }">
										<!-- <a class="list-group-item"> <span
											style="float: left !important;">标题</span> <span
											style="float: right !important;">点击数</span></a> -->
										<c:forEach items="${hostArticles }" var="article">
											<a href="<c:url value='/show/article/${article.id }'/>" class="list-group-item" target="_black">${article.articleTitle}
											<span style="float: right !important;">${article.nickname }</span></a>
										</c:forEach>
									</c:if>
									<c:if test="${hostArticles == null || hostArticles.size() ==0 }">
										<span style="color: red">没有热门</span>
									</c:if>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4" style="padding-right: 0px;">
						<div class="panel panel-primary">
							<div class="panel-heading">人气博主</div>
							<div class="panel-body">
								<div class="list-group">
									<c:if test="${hostUsers != null && hostUsers.size() != 0 }">
										<!-- <a class="list-group-item" style="margin-bottom: 10px;border: 0px"> <span
											style="float: left !important;">昵称</span> <span
											style="float: right !important;">关注数</span></a> -->
											
										<c:forEach items="${hostUsers }" var="user">
											<a href="<c:url value='/show/blog/${user.userName}'/>" target="_black" class="list-group-item">${user.nickname}<span
									style="float: right !important;">关注数：${user.attentionCount}</span></a>
									</c:forEach>
									</c:if>
									<c:if test="${hostUsers == null || hostUsers.size() == 0 }">
										<span style="color: red">还没有</span>
									</c:if>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 引入js文件 -->
	<c:import url="../public/admin_common_js.jsp"></c:import>

</body>
</html>