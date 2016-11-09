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
									<h1 class="no-margins">12</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>文章数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">1</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>用户建议数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">3</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>评论数量</h5>
								</div>
								<div class="ibox-content">
									<h1 class="no-margins">7</h1>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-7" style="padding-left: 0px;">
						<div class="panel panel-primary">
							<div class="panel-heading">热门文章</div>
							<div class="panel-body">
								<div class="list-group">
									<if condition="$exam_list"> <foreach name="exam_list"
										item="vo"> <a href="{:U("
										admin/exams/getExams?key=$vo[title]
										","","")}"  class="list-group-item">{$vo.title}<span
										style="float: right !important;">{$vo.status}</span></a> </foreach> <else />
									<span style="color: red">没有文章</span> </if>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-5" style="padding-right: 0px;">
					<div class="panel panel-primary">
						<div class="panel-heading">人气博主</div>
						<div class="panel-body">
							<div class="list-group">
								<if condition="$exam_list"> <foreach name="exam_list"
									item="vo"> <a href="{:U("
									admin/exams/getExams?key=$vo[title]
									","","")}"  class="list-group-item">{$vo.title}<span
									style="float: right !important;">{$vo.status}</span></a> </foreach> <else />
								<span style="color: red">还没有</span> </if>
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