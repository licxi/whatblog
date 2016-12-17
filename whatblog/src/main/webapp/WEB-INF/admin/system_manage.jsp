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
			<div class="row">
				<div class="wrapper wrapper-content animated fadeInRight"
					style="padding-bottom: 10px;">
					<h3>修改网站登录背景</h3>
				</div>
				<div>
					<div class="col-xs-12 col-md-5">
						<h3 style="color: black;">当前背景</h3>
						<a href="/whatblog/img/1.jpg" class="thumbnail" target="_black">
							<img src="/whatblog/img/1.jpg" id="bg" alt="当前登录背景">
						</a>
					</div>
					<div class="col-xs-12 col-md-7">
						<h3 style="color: black;">修改背景</h3>
						<label>上传图片，支持png、jpeg、jpg格式</label> <input id="bg_img"
							name="bg_img" type="file" multiple style="width: 100px">
					</div>
				</div>
			</div>
			
			<hr>
			<div class="col-sm-offset-4" style="margin-bottom: 100px;">
				<form action="" id="systemSetup">
				<input type="hidden" name="id" value="${systemSetup.id }">
				<div class="row">
					<div class="wrapper wrapper-content animated fadeInRight"
						style="padding-bottom: 10px;">
						<h3>修改网站名称</h3>

						<div class="form-group">
							<div class="col-sm-5" style="padding-left: 0">
								<input class="form-control" type="text" id="systemName" name="systemName" required
									value="${systemSetup.systemName }" placeholder="输入网站名">
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
								<input class="form-control" type="text" name="daily" name="daily" value="${systemSetup.daily }" required
									placeholder="每日一句">
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="wrapper wrapper-content animated fadeInRight"
						style="padding-bottom: 10px;">
						<h3>发表文章积分</h3>

						<div class="form-group">
							<div class="col-sm-5" style="padding-left: 0">
								<input class="form-control" type="number" id="writeArticleMark" name="writeArticleMark" required="required"
									value="${systemSetup.writeArticleMark }" placeholder="用户发表文章时得到的积分" onkeydown="onlyNum()" min="0">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="wrapper wrapper-content animated fadeInRight"
						style="padding-bottom: 10px;">
						<h3>评论积分</h3>

						<div class="form-group">
							<div class="col-sm-5" style="padding-left: 0">
								<input class="form-control" type="number" id="writeCommentMark" name="writeCommentMark" required="required"
									value="${systemSetup.writeCommentMark }" placeholder="用户发表评论时获得的积分" onkeydown="onlyNum()" min="0">
							</div>
						</div>
					</div>
				</div>
					<div class="row">
					<div class="wrapper wrapper-content animated fadeInRight"
						style="padding-bottom: 10px;">
						<h3>收到评论积分</h3>

						<div class="form-group">
							<div class="col-sm-5" style="padding-left: 0">
								<input class="form-control" type="number" id="receiveCommentMark" name="receiveCommentMark" required="required"
									value="${systemSetup.receiveCommentMark }" placeholder="用户的文章收到评论时获得的积分" 
									onkeydown="onlyNum()" min="0">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="wrapper wrapper-content animated fadeInRight"
						style="padding-bottom: 10px;">
						<div class="form-group">
							<div class="col-sm-5" style="padding-left: 0">
								<input class="form-control btn btn-primary" type="button" value="修改" id="submitModifySystemSetup">
							</div>
						</div>
					</div>
				</div>
				</form>
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
			uploadUrl : "modifyBackgroud",/* 文件上传的的地址 */
			maxFileCount : 1,/* 设置上传的文件的数量 */
			allowedFileExtensions : [ 'jpg', 'jpeg', 'png' ],/* 允许上传的文件格式 */
		});
		$("#bg_img").on("fileuploaded",
				function(event, data, previewId, index) {
					if (data.response.errCode == "0") {
						alert("修改成功!")
						$("#bg").attr("src", data.response.url+"?" + Math.random());
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