<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>留言</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/font-awesome/css/font-awesome.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/animate.css" rel="stylesheet'/>"
	rel="stylesheet">
<link href="<c:url value='/css/mystyle.css" rel="stylesheet'/>"
	rel="stylesheet">
<style type="text/css">
.body {
	overflow: auto !important;
}

.model {
	overflow: auto !important;
}
</style>
</head>
<body>
	<c:import url="../public/user_sidebar.jsp"></c:import>
	<div class="wrapper wrapper-content animated fadeInRight">
		<h2>留言板</h2>
		<div class="row">
			<div class="col-lg-12">
				<div class="wrapper wrapper-content animated fadeInUp">
					<ul class="notes">
						<c:if test="${messages != null && messages.size() != 0}">
							<c:forEach items="${messages }" var="message">
								<li id="message${message.id }">
									<div
										style="color: #fff; background: #17987E; overflow: hidden;">
										<small><fmt:formatDate value="${message.time }"
												pattern="yyyy年MM月dd日 "></fmt:formatDate></small>
										<p style="font-size: medium; margin-top: 20px;">${message.content }</p>
										<a style="left: 10px;" class="fa"
											onclick="reply(${message.fromUserName})">回复</a> <a
											style="left: 50px;" class="fa" onclick="del(${message.id})">删除</a>
										<a href="#"><i class="fa fa-paint-brush"></i>from
											${message.fromNickname }</a>
									</div>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</div>

			</div>

		</div>
	</div>
	<!-- 正文结束 -->
	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>

	<!-- 弹出回复留言框 -->
	<div class="modal fade bs-example-modal-sm" id="reply" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">回复留言</h4>
				</div>
				<div class="modal-body">
					<form action="#" method="post">
						<div class="input-group" id="id">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									内容 </span>
							</span> <input id="content" name="content" class="form-control"
								onkeyup="check_content()" onblur="check_content()"
								placeholder="简要概括就好！" type="text" />
						</div>

						<div style="text-align: center;">
							<span id="tip" style="color: red; font-size: 16px;"></span>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" id="submit"
								onclick="dosubmit()">确认</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/jquery-ui-1.10.4.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<!-- 手风琴菜单 -->
	<script
		src="<c:url value='/js/plugins/metisMenu/jquery.metisMenu.js'/>"></script>
	<!-- 滚动条 -->
	<script
		src="<c:url value='/js/plugins/slimscroll/jquery.slimscroll.min.js'/>"></script>
	<!-- 导航菜单 -->
	<script src="<c:url value='/js/inspinia.js'/>"></script>
	<!-- 进度条 -->
	<script src="<c:url value='/js/plugins/pace/pace.min.js'/>"></script>
	<!-- 鼠标进过时，展开下拉栏 -->
	 <script type="text/javascript"
		src="<c:url value='/js/bootstrap-hover-dropdown.js'/>"></script> 
	<!-- 留言 -->
	<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
	<!--  -->
	<script>
		var s_url = window.location.pathname;
		var now_url = '';
		for (var i = 0; i < $("#side-menu li").length; i++) {
			now_url = $("#side-menu li a").eq(i).attr("href");
			if (now_url == s_url) {
				$("#side-menu a").eq(i).parent().addClass("active");
				$("#side-menu a").eq(i).parent().parent().parent().addClass(
						"active");
				$("#side-menu a").eq(i).parent().parent().addClass("in");
			} else {
				$("#side-menu a").eq(i).parent().removeClass("active");
			}
		}
	</script>

	<script>
		//返回顶部按钮
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 100) {
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

	<script type="text/javascript">
		var toUserName;
		function del(id){
			var url = "deleteMessage";
			if (confirm("删除后不可恢复！确定删除该留言吗？")) {
				jQuery.post(url, {
					"id" : id
				}, function(data) {
					if (data.errCode == '0') {
						$("#message" + id).remove();
						alert("删除成功!");
					} else {
						alert("删除失败！");
					}
				}, 'json').error(function() {
					alert("网络连接错误，请稍后再试");
				});
			}
		}
		
		function reply(toUserName){
			this.toUserName  = toUserName;
			 $("#reply").modal("show");
			
		}
	
		function dosubmit(){
			var url = "replyMessage";
			if($("#content").val()==""){
				$("#tip").text("内容不能为空");
				$("#submit").attr("disabled",true);
				return false;
			}
			$("#reply").modal("hide");
			jQuery.post(url, {
				"toUserName" : toUserName,
				"content":$("#content").val()
			}, function(data) {
				if (data.errCode == '0') {
					alert(data.msg);
				} else {
					alert(data.msg);
				}
			}, 'json').error(function() {
				alert("网络连接错误，请稍后再试");
			});
			
		}
		
		function check_content(){
			if($("#content").val()==""){
				$("#tip").text("内容不能为空");
				$("#submit").attr("disabled",true);
			}else{
				$("#tip").text("");
				$("#submit").attr("disabled",false);
			}
		}
	</script>


</body>
</html>