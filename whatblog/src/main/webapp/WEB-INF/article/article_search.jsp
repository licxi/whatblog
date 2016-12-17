<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class=" ">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WhatBlog搜索</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" type="text/css"
	rel="stylesheet">
<link href="<c:url value='/css/style.css'/>" type="text/css"
	rel="stylesheet">

<!--[if lt IE 9]>
    <script src="js/html5shiv.min.js" type="text/javascript"></script>
    <script src="js/respond.min.js" type="text/javascript"></script>
    <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<link rel="apple-touch-icon-precomposed"
	href="<c:url value='/img/icon.jpg'/>">
<meta name="Keywords" content="whatblog WhatBlg">
<meta name="description" content="">
<script type="text/javascript">
	//判断浏览器是否支持HTML5
	window.onload = function() {
		if (!window.applicationCache) {
			//window.location.href="ie.html";
			alert("你的浏览器不支持html5,快升级或更换浏览器吧！！");
		}
	}
</script>
<style type="text/css">
.avatar {
	margin: 10px auto;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
}

.avatar a {
	display: block;
	padding-top: 60px;
	width: 100px;
	background-size: 100px 100px;
	margin-left: 0px;
}

.avatar a span {
	display: block;
	margin-top: 60px;
	padding-top: 8px;
	width: 100px;
	height: 55px;
	text-align: center;
	line-height: 20px;
	color: #fff;
	background: rgba(0, 0, 0, .5);
	-webkit-transition: margin-top .2s ease-in-out;
	-moz-transition: margin-top .2s ease-in-out;
	-o-transition: margin-top .2s ease-in-out;
	transition: margin-top .2s ease-in-out;
}

.avatar a:hover {
	text-decoration: none;
}

.avatar a:hover span {
	display: block;
	margin-top: 0;
}
.article li{
float: left;
margin-right: 20px;
}
</style>
</head>

<body>
	<c:import url="../public/navbar.jsp"></c:import>
	<section class="container">
		<c:import url="../public/header.jsp"></c:import>
		<!--/超小屏幕可见-->
		<div class="content-wrap">
			<div class="content">
				<div class="row" style="margin-left: 5px;">
					<ul class="nav nav-pills" role="tablist">
						<li role="presentation" class="active"><a href="<c:url value='/search/article?wd=${search }&t=${type }'/>">文章</a></li>
						<li role="presentation"><a href="<c:url value='/search/user?wd=${wd }'/>">博主</a></li>
					</ul>
				</div>
				<hr>
				<!-- start search -->
				<div class="row"  style="margin-left: 5px;">
					<form action="article" method="get">
						<div class="row">
							<div class="col-lg-10">
								<input class="form-control" type="text" name="wd"
									value="${wd }">
							</div>
							<div class="col-lg-2">
								<input class="btn btn-info" type="submit" value="搜索文章">
							</div>
						</div>
					</form>
				</div>
				<hr>
				<!-- end search -->
				<!-- start search result -->
				<div class="row">
					<c:if test="${pages != null }">
					<c:set var="articles" value="${pages.list }"/>
					<c:if test="${articles != null }">
					<c:forEach items="${articles }" var="article">
					<div class="col-sm-12 article">
						<h4><a href="<c:url value='/show/article/${article.id }'/>" target="_blank">${article.articleTitle }</a></h4>
						<ul style="margin-top: 5px;margin-bottom: 5px;">
							<li>作者：<a href="<c:url value='/show/blog/${article.userName }'/>" target="_blank">${article.nickname }</a>
							</li>
							<li>时间：<fmt:formatDate
									value="${article.createTime }" />
							</li>
							<li>分类：<a href="<c:url value='/search/article?t=${article.typeId }'/>" target="_blank">${article.typeName }</a></li>
							<li>共 <strong>${article.articleClick }</strong> 查看
							</li>
							<li><strong>${article.commentsCount }</strong> 条评论</li>
						</ul><br><br>
						<h4>${article.articleSummary }</h4>
						<hr>				
					</div>
					</c:forEach>
					</c:if>
					<c:if test="${articles == null || articles.size() ==0 }">
						非常抱歉，没有相关的文章！
					</c:if>
					</c:if>
				</div>
				<!-- end search result -->
				
			</div>


			<c:if test="${pages.pages > 1 }">
				<nav style="text-align: center;">
					<ul class="pagination">
						<li><a href="${url }&page=1">首页</a></li>
						<c:forEach var="page" varStatus="status" begin="1"
							end="${pages.pages }">
							<li
								<c:if test="${pages.pageNum == status.index }">class="active"</c:if>><a
								href="${url }&page=${status.index }">${status.index }</a></li>
						</c:forEach>
						<li><a href="${url }&page=${pages.lastPage }">尾页</a></li>

					</ul>
				</nav>
			</c:if>

		</div>
		<c:import url="../public/right_bar.jsp"></c:import>
		<!--/右侧>992px显示-->
		<c:import url="../public/footer.jsp"></c:import>
	</section>
	<div>
		<a href="javascript:;" class="gotop"
			style="display: block; z-index: 2000"></a>
	</div>
	<!--/返回顶部-->
	<script src="<c:url value='/js/jquery.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"
		type="text/javascript"></script>
	<!-- 鼠标进过时，展开下拉栏 -->
	<script type="text/javascript"
		src="<c:url value='/js/bootstrap-hover-dropdown.js'/>"></script>
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
						});//移除阴影样式.shadow 
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
	</script>

</body>
</html>