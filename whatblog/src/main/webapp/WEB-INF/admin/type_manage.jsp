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
<title>文章分类管理</title>
<style>
th {
	text-align: center;
}

td {
	text-align: center;
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
						<h2>文章分类管理</h2>
					</div>
				</div>

				<div
					class="row wrapper border-bottom white-bg page-heading col-sm-offset-1"
					style="margin-top: 20px;">
					<div class="col-my-1">
						<label>添加分类:</label>
					</div>
					<div class="col-lg-4">
						<input class="form-control" type="text" name="typeName"
							placeholder="分类名称">
					</div>
					<div class="col-lg-4">
						<input class="form-control" type="text" name="typeDesc"
							placeholder="分类描述">
					</div>
					<div class="col-lg-2">
						<input class="btn btn-primary" type="button" value="添加">
					</div>
				</div>
				<div class="ibox-content">

					<table
						class="table table-striped table-bordered table-hover dataTables-example">
						<thead>
							<tr>
								<th>分类名称</th>
								<th>分类描述</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="gradeU">
								<td>移动互联网</td>
								<td>关于移动互联网的开发知识</td>
								<td>
									<button class="btn btn-info">修改</button> 
									<button onclick="" class="btn btn-danger"> 删除</button>
								</td>

							</tr>
							<tr class="gradeU">
								<td>移动互联网</td>
								<td>关于移动互联网的开发知识</td>
								<td><button href="" class="btn  btn-info">修改</button> <button
									href="" onclick="" class="btn  btn-danger"> 删除</button></td>

							</tr>
							<tr class="gradeU">
								<td>移动互联网</td>
								<td>关于移动互联网的开发知识</td>
								<td><button href="" class="btn  btn-info">修改</button> <button
									href="" onclick="" class="btn  btn-danger"> 删除</button></td>

							</tr>



						</tbody>

					</table>

				</div>


			</div>

		</div>

	</div>

	<!-- 弹出分类修改框 -->
	<div class="modal fade bs-example-modal-sm" id="modifyType" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改分类信息</h4>
				</div>
				<div class="modal-body">
					<form action="#" method="post">
						<div class="input-group" id="id">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									分类名称 </span>
							</span> <input id="typeName" name="typeName" class="form-control"
								onkeyup="check_suggest_content()"
								onblur="check_suggest_content()" placeholder="简要概括就好！"
								type="text" />
						</div>

						<div style="text-align: center;">
							<span id="input_tip" style="color: red; font-size: 16px;"></span>
						</div>
						
						<div class="input-group" id="id">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									分类描述 </span>
							</span> <input id="typeDesc" name="typeDesc" class="form-control"
								onkeyup="check_suggest_content()"
								onblur="check_suggest_content()" placeholder="简要概括就好！"
								type="text" />
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" id="submitSuggest"
								onclick="submitSuggestContent()">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<a href="javascript:;" class="gotop1" style="display: block;"></a>

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