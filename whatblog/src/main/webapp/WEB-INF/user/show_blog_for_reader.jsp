<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/style.css'/>" type="text/css"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<title>${user.nickname }的博客</title>
<style type="text/css">
body {
	overflow: auto !important;
}
.modal{
	overflow: auto !important;
}
</style>
</head>

<body>
	<c:import url="../public/navbar.jsp"></c:import>
	<section class="container">
		<!-- 用户信息 -->
		<div class="hidden-xs header">
			<div style="text-align: center; margin-top: 10px;">
				<h4 style="text-align: left; margin-left: 5px; margin-top: 10px;">个人资料</h4>
				<h5>-----------------------------------</h5>
				<div>
					<img alt="" src="${user.headUrl }"
						style="border-radius: 50%; width: 100px; height: 100px;" />
					<h4 style="margin-top: 5px; margin-bottom: 5px;">${user.nickname }</h4>
					<h5>${user.description }</h5>
				</div>
				<h5>======================</h5>
				<div style="text-align: left; margin-left: 45px;">
					<ul class="blog_rank">
						<li>文章：<span>${user.articleCount }篇</span>
						</li>
						<li>积分：<span>${user.mark }</span>
						</li>
						<li>博龄：<span>${user.blogAge }</span>
						</li>
						<li>关注：<span>${attentionCount }</span>
						</li>
					</ul>

				</div>
				<h5>======================</h5>

				<c:if
					test="${userHostArticles != null && userHostArticles.size() != 0 }">
					<div style="text-align: left; margin-left: 5px; margin-top: 10px;">
						<h4>阅读排行</h4>
						<h5>-----------------------------------</h5>
						<ul class="host-article">
							<c:forEach items="${userHostArticles }" var="userHostArticle">
								<c:if test="${userHostArticle.articleSupport ==0 }">
									<li><a
										href="<c:url value='/show/article/${userHostArticle.id }'/>"
										target="_blank">${userHostArticle.articleTitle }</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
		<div class="content-wrap">
			<!--内容-->
			<div class="content">
				<header class="news_header" style="height: 50px;">
					<!-- <div class="col-sm-1 visible-lg">
						<img alt="" src="/whatblog/img/logo.png"
							style="border-radius: 50%; width: 80px; height: 80px;"
							id="openFile" class="img" />
					</div>
					<div class="col-sm-offset-1 col-sm-10">
						<h4>用户名</h4>
						<h5>用户博客描述</h5>
					</div> -->
					<!-- <p style="font-size: 22px;">用户的博客</p> -->
					<div class="col-sm-3">
					<h3>文章列表</h3>
					</div>
					
					<input type="hidden" value="${attentionId }" id="attentionId">
					<c:if test="${user_name != null }">
						<button id="attentionUser" class="btn btn-info"
							style="float: right !important; display: none"
							onclick="doAttentionUser('${user.userName}')"
							data-toggle="tooltip" data-placement="top"
							title="将博主添加到关注列表，来增加博主人气吧">加关注</button>

						<button id="noAttentionUser" class="btn btn-info"
							style="float: right !important; display: none"
							onclick="notAttentionUser()">取消关注</button>


						<button class="btn btn-info"
							style="float: right !important; margin-right: 5px;"
							data-toggle="modal" data-target="#reply_message">留言</button>
						<button class="btn btn-danger"
							style="float: right !important; margin-right: 5px;"
							data-toggle="modal" data-target="#report_user">举报</button>
					</c:if>
					<c:if test="${adminAccount != null}">
						<!-- 管理员查看时显示 -->
						<c:if test="${user.isLock == 0 }">
							<a class="btn btn-danger"
								style="float: right !important; margin-right: 5px;"
								id="modifyType${user.id }"
								onclick="modifyIsLock(${user.id },'${user.userName}')">锁定</a>
						</c:if>
						<c:if test="${user.isLock == 1 }">
							<a class="btn btn-info"
								style="float: right !important; margin-right: 5px;"
								id="modifyType${user.id }"
								onclick="modifyIsLock(${user.id },'${user.userName}')">启用</a>
						</c:if>
					</c:if>
				</header>
				<hr>

				<div>
					<!-- 文章列表 -->
					<c:set var="articles" value="${pages.list }" />
					<c:if test="${articles != null && articles.size() != 0 }">
						<c:forEach items="${articles }" var="article">
							<c:if test="${article.articleSupport ==0 }">
								<div class="ibox-content myshadow"
									style="background-color: #f6f6f6; margin-bottom: 20px;">
									<div class="row">
										<div class="articleShowImg">
											<a target="_blank" href=""><img class="showImg"
												src="${article.showImage }" alt=""> </a>
										</div>
										<div class="col-lg-9" style="margin-top: 25px;">
											<a href="<c:url value='/show/article/${article.id }'/>" class="btn-link"> <!--跳转全文-->
												<h4 class="btn-link">${article.articleTitle }</h4>

												<p style="margin-top: 5px; margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;${article.articleSummary }</p>
											</a>
										</div>
										<div class="col-md-12 article-detail" align="right">
											<span class="label label-primary" style="font-size: 12px;">评论:${article.commentsCount }</span>
											<span class="label label-info" style="font-size: 12px;">查看:${article.articleClick }</span>
											<span class="label label-warning" style="font-size: 12px;">时间:
												<fmt:formatDate value="${article.createTime }"
													pattern="yyyy-MM-dd" />
											</span>

										</div>

									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${articles == null || articles.size() == 0 }">
						<label>该博主还没有文章</label>
					</c:if>
				</div>
			</div>
		</div>


		<c:import url="../public/right_bar.jsp"></c:import>
	</section>
	<div>
		<a href="javascript:;" class="gotop"
			style="display: block; z-index: 200"></a>
	</div>

	<!-- 弹出留言框 -->
	<div class="modal fade bs-example-modal-sm" id="reply_message"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">给博主留言</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" id="toUser" name="toUser"
						value="${user.userName }">
					<div class="input-group" id="id">
						<span class="input-group-addon" id="sizing-addon1"> <span>
								内容 </span>
						</span> <input id="content" name="content" class="form-control"
							placeholder="简要概括就好！" type="text" required="required" />
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" onclick="submit()">确认</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 举报弹出框 -->
	<div class="modal fade bs-example-modal-sm" id="report_user"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">举报该博主</h4>
				</div>
				<div class="modal-body">
					<form action="" id="report_user_form">
						<input type="hidden" id="reportedUserName" name="reportedUserName"
							value="${user.userName }"> <input type="hidden"
							id="userName" name="userName" value="${user_name }">
						<div class="input-group" id="id">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									举报内容 </span>
							</span> <input id="reportContent" name="reportContent"
								class="form-control" placeholder="简要概括就好！" type="text"
								required="required" />
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary"
								onclick="submitReportUser()">确认</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"
	type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/user-blog.js'/>"></script>
<script type="text/javascript">
//将表单数据转换成json对象
$.fn.serializeObject = function() {    
   var o = {};    
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }    
   });
   return o; 
};

function submitReportUser(){
	var reportContent = $("#reportContent");
	if(reportContent.val().trim() == ""){
		alert("举报内容不能为空！");
		reportContent.focus();
		return false;
	}
	$.ajax({
        type:"post",
        url:"/whatblog/main/reportUser",
        data:JSON.stringify($("#report_user_form").serializeObject()),
        dataType:"json",
        contentType:"application/json",
        success:function(data){
            alert(data.msg);
            $("#report_user").modal('hide');
        }
    });
}

</script>
</html>