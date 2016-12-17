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
<title>被锁定会员管理</title>
<style>
th {
	text-align: center;
}

td {
	text-align: center;
}
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
		<div class="row" id="page-wrapper"
			style="margin-top: 50px; background-color: #fff">
			<div class="row" style="margin-left: 0px;">
				<div class="row wrapper border-bottom white-bg page-heading">
					<div class="col-lg-8">
						<h2>被锁定会员管理</h2>
					</div>
					<div class="col-lg-4"></div>
				</div>
				<div class="ibox-content">

					<div class="ibox-content">
						<form action="lockedUserManage" method="get">
							<div class="row wrapper border-bottom white-bg page-heading">
								<div class="col-lg-4"
									style="padding-left: 4px; padding-right: 0px;">
									<input class="form-control" type="text" name="search"
										value="${search }" placeholder="用户名/昵称/手机号/邮箱/qq">
								</div>
								<div class="col-lg-2">
									<input class="btn btn-primary" type="submit" value="搜索">
								</div>
						</form>
					</div>
					<c:set var="users" value="${pages.list }" />
					<c:if test="${users != null && users.size() != 0 }">
						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th style="width: 15%">账号</th>
									<th style="width: 15%">昵称</th>
									<th style="width: 10%">注册时间</th>
									<th style="width: 12%">手机号</th>
									<th style="width: 15%">邮箱</th>
									<th style="width: 5%">积分</th>
									<th style="width: 5%">性别</th>
									<th style="width: 10%">qq</th>
									<th style="width: 5%">状态</th>
									<th style="width: 8%">操作</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${users }" var="user">
									<tr class="gradeU" id="user${user.id }">
										<td><a href="<c:url value='/show/blog/${user.userName}'/>" target="_black">${user.userName }</a></td>
										<td><a href="<c:url value='/show/blog/${user.userName}'/>" target="_black">${user.nickname }</a></td>
										<td><fmt:formatDate value="${user.createTime }"
												pattern="yyyy-MM-dd" /></td>
										<td>${user.phone }</td>
										<td>${user.email }</td>
										<td>${user.mark}</td>
										<td>${user.gender }</td>
										<td>${user.qq }</td>
										<td><c:if test="${user.isLock == 0 }">
												<span id="isLock${user.id }" class="label label-info">正常
												
											</c:if> <c:if test="${user.isLock == 1 }">
												<span id="isLock${user.id }" class="label label-danger">锁定
												
											</c:if> </span></td>
										<td><div class="dropdown">
												<button type="button" class="btn dropdown-toggle"
													id="dropdownMenu1" data-toggle="dropdown"
													style="padding: 1px 2px">
													操作 <span class="caret"></span>
												</button>
												<ul class="dropdown-menu" role="menu"
													aria-labelledby="dropdownMenu1" style="min-width: 80px;">
													<li role="presentation"><a role="menuitem"
														id="modifyType${user.id }" tabindex="-1"
														onclick="noLock(${user.id },'${user.userName}')">
															<c:if test="${user.isLock == 1 }">
																 启用
															</c:if>
													</a></li>
													<li><a class="btn"
														onClick="deleteUser(${user.id},'${user.userName }','${user.nickname }')">删除</a></li>
												</ul>
											</div></td>
									</tr>
								</c:forEach>
								</c:if>
							</tbody>

						</table>
						<div style="text-align: right;">
							<h3 >总计：<span id="total">${pages.total }</span></h3>
						</div>
				</div>
				<c:if test="${pages.pages > 1 }">
					<nav style="text-align: center;">
						<ul class="pagination">
							<li><a href="/whatblog/admin/lockedUserManage?page=1">首页</a></li>
							<c:forEach var="page" varStatus="status" begin="1"
								end="${pages.pages }">
								<li
									<c:if test="${pages.pageNum == status.index }">class="active"</c:if>><a
									href="/whatblog/admin/lockedUserManage?page=${status.index }">${status.index }</a></li>
							</c:forEach>
							<li><a
								href="/whatblog/admin/lockedUserManage?page=${pages.lastPage }">尾页</a></li>

						</ul>
					</nav>

				</c:if>

				</table>

			</div>


		</div>

	</div>

	</div>


	<a href="javascript:;" class="gotop1" style="display: block;"></a>

	<!-- 引入js文件 -->
	<c:import url="../public/admin_common_js.jsp"></c:import>

	<script src="<c:url value='/js/fileinput.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/fileinput_locale_zh.js'/>"
		type="text/javascript"></script>

	<script type="text/javascript">
		$('#bg_img').fileinput({
			language : 'zh',
			uploadUrl : "",/* 文件上传的的地址 */
			maxFileCount : 1,/* 设置上传的文件的数量 */
			allowedFileExtensions : [ 'jpg', 'jpeg', 'png' ],/* 允许上传的文件格式 */
		});
		$("#bg_img").on("fileuploaded",
				function(event, data, previewId, index) {
					if (data.response.info == "ok") {
						alert("修改成功!")
						$("#bg").attr("src", "IMG/BG.png?" + Math.random());
					} else {
						alert("上传失败！请重试");
					}
				});
	</script>
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