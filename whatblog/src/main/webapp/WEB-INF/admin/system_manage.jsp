<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入css文件 -->
<c:import url="../public/admin_common_css.jsp"></c:import>
<link href="<c:url value='/css/fileinput.css'/>" media="all"
	rel="stylesheet" type="text/css" />
<title>配置网站信息</title>
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
			<div class="row">
				<div class="wrapper wrapper-content animated fadeInRight"
					style="padding-bottom: 10px;">
					<h3>修改网站登录背景</h3>
				</div>
				<div>
					<div class="col-xs-12 col-md-5">
						<h3 style="color: black;">当前背景</h3>
						<a href="/whatblog/img/1.jpg" class="thumbnail"> <img
							src="/whatblog/img/1.jpg" id="bg" alt="...">
						</a>
					</div>
					<div class="col-xs-12 col-md-7">
						<h3 style="color: black;">修改背景</h3>
						<label>上传图片，支持png、jpeg、jpg格式</label> <input id="bg_img"
							name="bg_img" type="file" multiple style="width: 100px">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="wrapper wrapper-content animated fadeInRight"
					style="padding-bottom: 10px;">
					<h3>修改网站名称</h3>
					
					<div class="form-group">
						<div class="col-sm-5" style="padding-left: 0">
							<input class="form-control" type="text" name="systemName" value="WhatBlog"
							placeholder="输入网站名">
						</div>
						<div class="col-sm-5">
							<button class="btn btn-primary">修改</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="wrapper wrapper-content animated fadeInRight"
					style="padding-bottom: 10px;">
					<h3>每日一句</h3>
					
					<div class="form-group">
						<div class="col-sm-5" style="padding-left: 0">
							<input class="form-control" type="text" name="day" value="每日一句"
							placeholder="输入网站名">
						</div>
						<div class="col-sm-5">
							<button class="btn btn-primary" >修改</button>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>
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