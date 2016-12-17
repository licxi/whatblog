<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>${article.articleTitle }</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value='/css/bootstrap.min.css'/>" type="text/css"
	rel="stylesheet">
<link href="<c:url value='/css/style.css'/>" type="text/css"
	rel="stylesheet">
<link rel="apple-touch-icon-precomposed"
	href="<c:url value='/img/icon.jpg'/>">
<!-- 引入代码高亮 -->
<link type="text/css" href="<c:url value='/css/shThemeMidnight.css'/>"
	rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/js/shCore.min.js'/>"></script>
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
<meta name="Keywords" content="whatblog WhatBlg">
<meta name="description" content="">
<style type="text/css">
.ibox {
	clear: both;
	margin-bottom: 25px;
	margin-top: 0;
	padding: 0;
}

body {
	overflow: auto !important;
}

.modal {
	overflow: auto !important;
}
</style>
<script type="text/javascript">
	//判断浏览器是否支持HTML5
	window.onload = function() {
		if (!window.applicationCache) {
			//window.location.href="ie.html";
			alert("你的浏览器不支持html5,快升级或更换浏览器吧！！");
		}
	}
</script>
</head>
<body>
	<c:import url="../public/navbar.jsp"></c:import>
	<section class="container">
		<c:import url="../public/header.jsp"></c:import>
		<!--/超小屏幕可见-->
		<div class="content-wrap">
			<!--内容-->
			<div class="content">
				<div class="col-sm-9">
					<header class="news_header">
						<h2>${article.articleTitle }</h2>
						<ul>
							<li><a
								<c:if test="${user_name != article.userName }">
										href="<c:url value='/show/blog/${article.userName}'/>" 
										</c:if>
										<c:if test="${user_name == article.userName }">
										href="<c:url value='/${user_name }/home'/>" 
										</c:if> target="_blank"> <strong>${article.nickname }</strong></a></li>
							<li>发布于<fmt:formatDate value="${article.createTime }" />
							</li>
							<li>分类：<a href="<c:url value='/search/article?t=${article.typeId }'/>" title="" target="_blank">${article.typeName }</a></li>
							<li>共 <strong>${article.articleClick }</strong> 查看
							</li>
							<li>共 <strong>${article.commentsCount }</strong> 条评论
							</li>
						</ul>
					</header>
				</div>
				<c:if test="${adminAccount != null}">
					<div class="col-sm-3" style="text-align: right;">
						<button class="btn btn-danger"
							onclick="articleLock(${article.id})" id="articleLock">
							<c:if test="${article.articleSupport ==0 }">锁定</c:if>
							<c:if test="${article.articleSupport ==1 }">解锁</c:if>

						</button>
						<button class="btn btn-danger"
							onclick="deleteArticle(${article.id})">删除</button>
					</div>
				</c:if>

				<c:if test="${adminAccount == null && user_name != null}">
					<div class="col-sm-3" style="text-align: right;">
						<button class="btn btn-danger" data-toggle="modal"
							data-target="#report_article">举报</button>
					</div>
				</c:if>
				<div class="ibox">${article.articleContent }</div>

				<div class="reprint">
					转载请说明出处
					<!-- ：<a
						href=""
						title="" target="_blank">WhatBlog</a> » <a
						href=""
						title="" target="_blank">欢迎来到WhatBlog</a> -->
				</div>
				<!-- <div class="zambia">
					<a href="javascript:;" name="zambia" rel=""><span
						class="glyphicon glyphicon-thumbs-up"></span> 赞（0）</a>
				</div> -->
				<div class="content-block comment">
					<h2 class="title">
						<strong>评论</strong>
					</h2>
					<form action="" method="post" class="form-inline" id="comment-form">
						<div class="comment-form">
							<textarea placeholder="说说你的看法吧" name="commentContent"
								id="commentContent"></textarea>
							<div class="comment-form-footer">
								<c:if test="${user_name == null }">
									<div class="comment-form-text">
										<c:url value="/show/article/${article.id }" var="fromurl" />
										<c:url value="/user/toLogin" var="login">
											<c:param name="fromurl" value="${fromurl }" />
										</c:url>
										请先 <a href="${login }">登录</a> 或 <a
											href="<c:url value='/user/toReg'/>">注册</a>
									</div>
								</c:if>
								<div class="comment-form-btn">
									<input type="hidden" value="${article.id }" id="articleId">
									<button type="button" class="btn btn-default btn-comment" id="submitButton"
										<c:if test="${user_name == null }">disabled="true"</c:if>
										<%-- onclick="comment(${article.id})" --%>>提交评论</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div id="allComments">
					<c:forEach items="${article.comments }" var="comments">
						<div class="feed-element myshadow ">
							<div style="margin: 10px 10px 10px 10px;">
								<a href="#" class="pull-left" style="margin-right: 10px;"><img
									alt="image" class="img-circle" src="${comments.headUrl }"></a>
								<div class="media-body">
									<c:if test="${user_name != null }">
									<input type="hidden" value="${comments.articleId }" id="articleId">
									<input type="hidden" value="${comments.userName }" id="toUserName">
									<input type="hidden" value="${comments.id }" id="toCommentId">
									<button class="btn btn-info pull-right" style="font-size: 12px;" 
										<%-- onclick="comment(${article.id},'${comments.userName }',${comments.id })" --%>>回复</button>
									</c:if>
									<strong style="font-size: 15px;"><a
										href="<c:url value='/show/blog/${comments.userName}'/>"
										target="_blank">${comments.nickname }</a></strong><br> <small
										class="text-muted"><fmt:formatDate
											value="${comments.time }" pattern="yyyy年MM月dd日  HH:mm:ss"></fmt:formatDate></small>
									<div class="well" style="font-size: 14px; margin-right: 50px;">${comments.content }</div>
									<div class="pull-right">
										</a>
									</div>
								</div>
							</div>
							<div id="cComment${comments.id }">
							<c:if test="${comments.comments != null }">
								<c:forEach items="${comments.comments }" var="comment">
									<div class="feed-element" 
										style="margin-left: 50px; margin-right: 100px">
										<a href="#" class="pull-left"><img alt="image"
											class="img-circle" src="${comment.headUrl }"></a>
										<div class="media-body ">
											<small class="pull-right" style="font-size: 12px;"></small> <strong
												style="font-size: 15px;"><a
												href="<c:url value='/show/blog/${comment.userName}'/>"
												target="_blank">${comment.nickname }</a></strong><br> <small
												class="text-muted"><fmt:formatDate
													value="${comment.time }" pattern="yyyy年MM月dd日  HH:mm:ss"></fmt:formatDate></small>
											<div class="well" style="font-size: 14px;">${comment.content }</div>
											<div class="pull-right">
												</a>
											</div>
										</div>
									</div>
								</c:forEach>
								
							</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="content-block related-content visible-lg visible-md">
					<h2 class="title">
						<strong>相关推荐</strong>
					</h2>
					<div class="list-group">
						<c:if test="${likeArticles !=null && likeArticles.size() != 0 }">

							<c:forEach items="${likeArticles }" var="article">
								<a href="<c:url value='/show/article/${article.id}'/>"
									class="list-group-item">${article.articleTitle }</a>
							</c:forEach>
						</c:if>

					</div>
				</div>
			</div>
		</div>

		<!--/内容-->
		<!-- 右侧的搜索和热门推荐 -->
		<c:import url="../public/right_bar.jsp"></c:import>
		<!--/右侧>992px显示-->
		<c:import url="../public/footer.jsp"></c:import>
	</section>

	<!-- 举报文章 -->
	<div class="modal fade bs-example-modal-sm" id="report_article"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">举报文章</h4>
				</div>
				<div class="modal-body">
					<form action="#" method="post" id="report_article_form">
						<input type="hidden" name="userName" value="${user_name }">
						<input type="hidden" name="reportedUserName"
							value="${article.userName}"> <input type="hidden"
							name="reportedArticleId" value="${article.id}">
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									举&nbsp;&nbsp;&nbsp;报&nbsp;&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;由
							</span>
							</span> <input id="reportContent" name="reportContent"
								class="form-control" type="text" placeholder="你举报这篇文章的理由(必填)" />
						</div>
						<br />
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									被侵权文章URL </span>
							</span> <input id="originalArticleUrl" name="originalArticleUrl"
								class="form-control" type="text" placeholder="必须以http或https开头(可以不填)" />
						</div>
						<br />
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									被侵权文章标题 </span>
							</span> <input id="originalArticleTitle" name="originalArticleTitle"
								class="form-control" type="text" placeholder="(可以不填)"/>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">放弃</button>
					<button type="button" onClick="submitReportArticle()"
						class="btn btn-primary">提交</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade bs-example-modal-sm" id="reply_comment"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">回复评论</h4>
				</div>
				<div class="modal-body">
					<form action="#" method="post" id="report_article_form">
						<input type="hidden" name="userName" value="${user_name }">
						<input type="hidden" name="articleId" value="${article.id}">
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1"> <span>
									回复内容</span>
							</span> <input id="replyCommentContent" name="replyCommentContent"
								class="form-control" type="text" placeholder="说说你的看法吧" />
						</div>
						<br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" onclick="submitReplyComment()"
						class="btn btn-primary">提交</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>
	<!--/返回顶部-->
	<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/js/ajaxfileupload.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/ueditor/ueditor.all.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/js/bootstrap.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/comment.js' />"></script>
	<!--	
	<script src="<c:url value='/js/fileinput.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/fileinput_locale_zh.js'/>" type="text/javascript"></script>
	-->
	<script type="text/javascript">
		//页面加载

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
		//鼠标滑过显示 滑离隐藏
		//banner
		$(function() {
			$(".carousel").hover(function() {
				$(this).find(".carousel-control").show();
			}, function() {
				$(this).find(".carousel-control").hide();
			});
		});
		//本周热门
		$(function() {
			$(".hot-content ul li").hover(function() {
				$(this).find("h3").show();
			}, function() {
				$(this).find("h3").hide();
			});
		});
		//相关推荐
		$(function() {
			$(".related-content ul li").hover(function() {
				$(this).find("h3").show();
			}, function() {
				$(this).find("h3").hide();
			});
		});
		//页面元素智能定位
		$.fn.smartFloat = function() {
			var position = function(element) {
				var top = element.position().top; //当前元素对象element距离浏览器上边缘的距离 
				var pos = element.css("position"); //当前元素距离页面document顶部的距离
				$(window).scroll(function() { //侦听滚动时 
					var scrolls = $(this).scrollTop();
					if (scrolls > top) { //如果滚动到页面超出了当前元素element的相对页面顶部的高度 
						if (window.XMLHttpRequest) { //如果不是ie6 
							element.css({ //设置css 
								position : "fixed", //固定定位,即不再跟随滚动 
								top : 51
							//距离页面顶部为0 
							}).addClass("shadow"); //加上阴影样式.shadow 
						} else { //如果是ie6 
							element.css({
								top : scrolls
							//与页面顶部距离 
							});
						}
					} else {
						element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式 
							position : pos,
							top : top
						});
					}
				});
			};
			return $(this).each(function() {
				position($(this));
			});
		};
		//启用页面元素智能定位
		$(function() {
			$("#search").smartFloat();
		});
		function articleLock(id){
			var articleLock = $("#articleLock");
			var url = "/whatblog/admin/modifyArticleLock";
			var temp = articleLock.text().trim();
			if(confirm("是否将文章"+temp))　{
				jQuery.post(url,{
					'article_id':id
				},function(data){
					if(data.errCode == "0"){
						if(temp == "锁定" ){
							alert(data.msg);
							articleLock.text("解锁");
							/* articleLock.removeClass("label-danger");
							articleLock.addClass("label-info"); */
						}else if(temp == "解锁" ){
							alert(data.msg);
							articleLock.text("锁定");
							/* articleLock.removeClass("label-info");
							articleLock.addClass("label-danger"); */
						}
					}else{
						alert(data.msg);
					}
				},'json').error(function(){
					alert("网络连接错误，请稍后再试");
				});
			}
		}

		// 删除文章
		function deleteArticle(id){
			var url = "/whatblog/admin/deleteArticle";
			if(confirm("是否将文章删除?该操作不可恢复!"))　{
				jQuery.post(url,{
					'article_id':id
				},function(data){
					if(data.errCode == "0"){
						alert(data.msg);
						window.opener=null;
						window.open('','_self');
						window.close();
					}else{
						alert(data.msg);
					}
				},'json').error(function(){
					alert("网络连接错误，请稍后再试");
				});
			}
		}
		
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
		
		function IsURL(str_url){
	        var strRegex = /^(http|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?/;
	        if (strRegex.test(str_url)){
	            return (true);
	        }else{
	            return (false);
	        }
	}
		
		function submitReportArticle(){
			var reportContent = $("#reportContent");
			var originalArticleUrl = $("#originalArticleUrl");
			var originalArticleTitle = $("#originalArticleTitle");
			if(reportContent.val().trim() == ""){
				alert("举报内容不能为空！");
				reportContent.focus();
				return false;
			}
			if(!IsURL(originalArticleUrl.val().trim())&&originalArticleUrl.val().trim()!=""){
				alert("请输入正确的网址");
				originalArticleUrl.focus();
				return false;
			}
			$.ajax({
                type:"post",
                url:"/whatblog/main/reportArticle",
                data:JSON.stringify($("#report_article_form").serializeObject()),
                dataType:"json",
                contentType:"application/json",
                success:function(data){
                    alert(data.msg);
                    $("#report_article").modal('hide');
                }
            });
		}
	</script>
</body>
</html>