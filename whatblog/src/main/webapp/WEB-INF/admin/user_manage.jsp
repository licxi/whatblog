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
<title>会员管理</title>
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
						<h2>会员管理，总计：100</h2>
					</div>
					<div class="col-lg-4"></div>
				</div>
				<div class="ibox-content">

					<table
						class="table table-striped table-bordered table-hover dataTables-example">
						<thead>
							<tr>
								<th>账号</th>
								<th>昵称</th>
								<th>注册时间</th>
								<th>手机号</th>
								<th>邮箱</th>
								<th>积分</th>
								<th>性别</th>
								<th>qq</th>
								<th>毕业学校</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="gradeU">
								<td>417708459</td>
								<td>刘岑溪</td>
								<td>2016年3月3日</td>
								<td>18098108580</td>
								<td>417708459@qq.com</td>
								<td>100</td>
								<td>男</td>
								<td>417708459</td>
								<td>韩山师范学院</td>
								<td><span class="label label-info">启用</span></td>
								<td><div class="dropdown">
										<button type="button" class="btn dropdown-toggle"
											id="dropdownMenu1" data-toggle="dropdown" style="padding:1px 2px">
											操作 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1" style="min-width: 80px;">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="">解锁</a></li>
											<li><a class="btn" onClick="del({$vo.exam_id})">删除</a></li>
										</ul>
									</div></td>

							</tr>
							<tr class="gradeU">
								<td>licxi</td>
								<td>刘岑溪</td>
								<td>2016年3月3日</td>
								<td>18098108580</td>
								<td>417708459@qq.com</td>
								<td>100</td>
								<td>男</td>
								<td>417708459</td>
								<td>韩山师范学院</td>
								<td><span class="label label-info">启用</span></td>
								<td>
									<div class="dropdown">
										<button type="button" class="btn dropdown-toggle"
											id="dropdownMenu1" data-toggle="dropdown">
											操作 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1" style="min-width: 80px;">
											<li role="presentation"><a class="btn" role="menuitem"
												tabindex="-1" onclick="change_exam_status({$vo.exam_id})"
												id="a{$vo.exam_id}"><if condition="$vo[status] eq '进行中'">终止<else />开始</if></a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="{:U(" admin/scores/getScores?exam_id=$vo[exam_id]",'','')}">成绩</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="{:U(" admin/exams/edit?exam_id=$vo[exam_id]",'','')}">编辑</a></li>
											<li><a class="btn" onClick="del({$vo.exam_id})">删除</a></li>
										</ul>
									</div>
								</td>

							</tr>
							<tr class="gradeU">
								<td>licxi</td>
								<td>刘岑溪</td>
								<td>2016年3月3日</td>
								<td>18098108580</td>
								<td>417708459@qq.com</td>
								<td>100</td>
								<td>男</td>
								<td>417708459</td>
								<td>韩山师范学院</td>
								<td><span class="label label-info">锁定</span></td>
								<td>
									<div class="dropdown">
										<button type="button" class="btn dropdown-toggle"
											id="dropdownMenu1" data-toggle="dropdown">
											操作 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1" style="min-width: 80px;">
											<li role="presentation"><a class="btn" role="menuitem"
												tabindex="-1" onclick="change_exam_status({$vo.exam_id})"
												id="a{$vo.exam_id}"><if condition="$vo[status] eq '进行中'">终止<else />开始</if></a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="{:U(" admin/scores/getScores?exam_id=$vo[exam_id]",'','')}">成绩</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="{:U(" admin/exams/edit?exam_id=$vo[exam_id]",'','')}">编辑</a></li>
											<li><a class="btn" onClick="del({$vo.exam_id})">删除</a></li>
										</ul>
									</div>
								</td>

							</tr>
							<tr class="gradeU">
								<td>licxi</td>
								<td>刘岑溪</td>
								<td>2016年3月3日</td>
								<td>18098108580</td>
								<td>417708459@qq.com</td>
								<td>100</td>
								<td>男</td>
								<td>417708459</td>
								<td>韩山师范学院</td>
								<td><span class="label label-info">启用</span></td>
								<td>
									<div class="dropdown">
										<button type="button" class="btn dropdown-toggle"
											id="dropdownMenu1" data-toggle="dropdown">
											操作 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1" style="min-width: 80px;">
											<li role="presentation"><a class="btn" role="menuitem"
												tabindex="-1" onclick="change_exam_status({$vo.exam_id})"
												id="a{$vo.exam_id}"><if condition="$vo[status] eq '进行中'">终止<else />开始</if></a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="{:U(" admin/scores/getScores?exam_id=$vo[exam_id]",'','')}">成绩</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="{:U(" admin/exams/edit?exam_id=$vo[exam_id]",'','')}">编辑</a></li>
											<li><a class="btn" onClick="del({$vo.exam_id})">删除</a></li>
										</ul>
									</div>

								</td>

							</tr>

						</tbody>

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