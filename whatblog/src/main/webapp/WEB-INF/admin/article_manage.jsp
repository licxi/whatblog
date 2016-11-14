<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入css文件 -->
<c:import url="../public/admin_common_css.jsp"></c:import>
<link href="<c:url value='/css/fileinput.css'/>" media="all"
	rel="stylesheet" type="text/css" />
<title>文章管理</title>
<style>
th {
	text-align: center;
}

td {
	text-align: center;
}
</style>

</head>
<body>

	<div id="wrapper">
		<c:import url="../public/admin_navbar.jsp"></c:import>
		<div class="row" id="page-wrapper"
			style="margin-top: 50px; background-color: #fff">
			<div class="row" style="margin-left: 0px;">
				<div class="row wrapper border-bottom white-bg page-heading">
					<div class="col-lg-8">
						<h2>文章列表</h2>
					</div>
					<div class="col-lg-4"></div>
				</div>
				<div class="ibox-content">
					<form action="articleManage" method="get">
						<div class="row wrapper border-bottom white-bg page-heading">
							<div class="col-lg-4"
								style="padding-left: 4px; padding-right: 0px;">
								<input class="form-control" type="text" name="search"
									value="${search }" placeholder="标题">
							</div>
							<div class="col-lg-2">
								<input class="btn btn-primary" type="submit" value="搜索">
							</div>
						</div>
					</form>


					<c:set var="articles" value="${pages.list }" />
					<c:if test="${articles != null && articles.size() != 0 }">

						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>文章标题</th>
									<th width="8%">作者</th>
									<th width="10%">分类</th>
									<th width="10%">发布时间</th>
									<th width="7%">查看次数</th>
									<th width="7%">评论次数</th>
									<th width="7%">是否置顶</th>
									<th width="7%">是否被禁</th>
									<th width="5%">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${articles }" var="article">
									<tr class="gradeU" id="article${article.id }">
										<td>${article.articleTitle }</td>
										<td>${article.nickname }</td>
										<td>${article.typeName }</td>
										<td><fmt:formatDate value="${article.createTime }"
												pattern="yyyy-MM-dd" /></td>
										<td>${article.articleClick }</td>
										<td>${article.commentsCount }</td>
										<td><c:if test="${article.articleUp ==1 }">
												<span id="articleUpTip${article.id }" class="label label-info">是</span>
											</c:if> <c:if test="${article.articleUp ==0 }">
												<span id="articleUpTip${article.id }" class="label label-default">否</span>
											</c:if></td>
										<td><c:if test="${article.articleSupport == 1 }">
												<span id="articleLockTip${article.id }" class="label label-danger">是</span>
											</c:if> <c:if test="${article.articleSupport == 0 }">
												<span id="articleLockTip${article.id }" class="label label-info">否</span>
											</c:if></td>
										<td><div class="dropdown">
												<button type="button" class="btn dropdown-toggle"
													id="dropdownMenu1" data-toggle="dropdown"
													style="padding: 1px 2px">
													操作 <span class="caret"></span>
												</button>
												<ul class="dropdown-menu" role="menu"
													aria-labelledby="dropdownMenu1" style="min-width: 80px; ">

													<li role="presentation">
														<a id="articleUp${article.id }" role="menuitem" tabindex="-1" 
															onclick="articleUp(${article.id})"> 
															<c:if test="${article.articleUp ==0 }">
													         	置顶
															</c:if>
															<c:if test="${article.articleUp ==1 }">
																取消置顶
															</c:if>
														</a>
													</li>


													<li role="presentation">
														<a id="articleLock${article.id }" role="menuitem" 
															tabindex="-1" onclick="articleLock(${article.id})">
															 <c:if test="${article.articleSupport == 0 }">
																锁定
															 </c:if> 
															<c:if test="${article.articleSupport == 1 }">
																解锁
															</c:if>
														</a>
													</li>
													<li><a class="btn" onclick="deleteArticle(${article.id})">删除</a></li>
												</ul>
											</div></td>
									</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div style="text-align: right;">
							<h3>总计：${pages.total }</h3>
						</div>
				</div>

				<c:if test="${pages.pages > 1 }">
					<nav style="text-align: center;">
						<ul class="pagination">
							<li><a href="/whatblog/admin/aritcleManage?page=1">首页</a></li>
							<c:forEach var="page" varStatus="status" begin="1"
								end="${pages.pages }">
								<li
									<c:if test="${pages.pageNum == status.index }">class="active"</c:if>><a
									href="/whatblog/admin/aritcleManage?page=${status.index }">${status.index }</a></li>
							</c:forEach>
							<li><a
								href="/whatblog/admin/aritcleManage?page=${pages.lastPage }">尾页</a></li>

						</ul>
					</nav>

				</c:if>

			</div>

		</div>

	</div>


	<a href="javascript:;" class="gotop1" style="display: block;"></a>

	<!-- 引入js文件 -->
	<c:import url="../public/admin_common_js.jsp"></c:import>

	<!-- 返回顶部 -->
	<script>
		//返回顶部按钮
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 300) {
					$(".gotop1").fadeIn();
				} else {
					$(".gotop1").hide();
				}
			});
			$(".gotop1").click(function() {
				$('html,body').animate({
					'scrollTop1' : 0
				}, 500);
			});
		});
	</script>
</body>
</html>