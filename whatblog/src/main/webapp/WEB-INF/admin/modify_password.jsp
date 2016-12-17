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
<title>修改管理员密码</title>
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
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>管理员密码修改</h2>
				</div>
				<div class="col-lg-2"></div>
			</div>

			<div class="row">
				<div class="ibox-content">
					<div class="hr-line-dashed"></div>
					<form method="post" class="form-horizontal" action="">
						<div class="form-group has-success">
							<label class="col-sm-4 control-label">原始密码</label>

							<div class="col-sm-3">
								<input type="password" class="form-control" name="pass1"
									required>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group has-success">
							<label class="col-sm-4 control-label">输入密码</label>

							<div class="col-sm-3">
								<input type="password" class="form-control" name="pass1"
									required>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group has-success">
							<label class="col-sm-4 control-label">重复密码</label>

							<div class="col-sm-3">
								<input type="password" class="form-control" name="pass2"
									required>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group has-success ">
							<input type="submit" value="修改" class="btn btn-primary col-sm-offset-5"
									data-toggle="modal">
						</div>
					</form>
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