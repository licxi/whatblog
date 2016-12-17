<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入css文件 -->
<c:import url="../public/admin_common_css.jsp"></c:import>
<link href="<c:url value='/css/fileinput.css'/>" media="all"
	rel="stylesheet" type="text/css" /> 
<title>用户建议管理</title>
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
.opra{
padding:2px 6px;
}
.col-my-1 {
	width: 8.6%;
	float: left;
	position: relative;
	min-height: 1px;
	padding-right: 5px;
	padding-left: 15px;
	padding-top: 5px;
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
						<h2>用户建议管理</h2>
					</div>
				</div>

				
				<div class="ibox-content">
					<c:set var="suggests" value="${pages.list }"/>
							<c:if test="${suggests != null && suggests.size() != 0 }">
					<table
						class="table table-striped table-bordered table-hover dataTables-example">
						<thead>
							<tr>
								<th style="width: 15%">用户</th>
								<th style="width: 60%%">建议内容</th>
								<th style="width: 15%">时间</th>
								<th style="width: 10%">操作</th>
							</tr>
						</thead>
						<tbody>
							
								<c:forEach items="${suggests }" var="suggest">
									<tr class="gradeU" id="suggest${suggest.id }">
										<td >${suggest.nickname}</td>
										<td >${suggest.content}</td>
										<td ><fmt:formatDate value="${suggest.time }" pattern="yyyy-MM-dd"/></td>
										<td>
											<button class="btn btn-danger" onclick="deleteSuggest(${suggest.id})">删除</button>
										</td>
									</tr>
								</c:forEach>
							
						</tbody>

					</table>
					<div style="text-align: right;">
						<h3>总计：<span id="total">${pages.total }</span></h3>
					</div>
					</c:if>
					<c:if test="${suggests == null && suggests.size() == 0 }">
						<h3>还没用户建议</h3>
					</c:if>
					
				</div>
				 <c:if test="${pages.pages > 1 }">
					

						<nav style="text-align: center;">
							<ul class="pagination">
								<li><a href="/whatblog/admin/suggestManage?page=1">首页</a></li>
								<c:forEach var="page" varStatus="status" begin="1" end="${pages.pages }" >
									<li <c:if test="${pages.pageNum == status.index }">class="active"</c:if>>
									<a href="/whatblog/admin/suggestManage?page=${status.index }">${status.index }</a></li>
								</c:forEach>
								<li><a href="/whatblog/admin/suggestManage?page=${pages.lastPage }">尾页</a></li>
								
							</ul>
						</nav>
					
				</c:if> 


			</div>

		</div>

	</div>
	<a href="javascript:;" class="gotop" style="display: block;"></a>

	<!-- 引入js文件 -->
	<c:import url="../public/admin_common_js.jsp"></c:import>

	<script src="<c:url value='/js/fileinput.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/fileinput_locale_zh.js'/>"
		type="text/javascript"></script
	<script type="text/javascript" src="<c:url value='/js/type_op.js'/>"></script>

	
	
	<!-- 返回顶部 -->
	<script>
		//返回顶部按钮
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 300) {
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