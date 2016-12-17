<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class=" ">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>欢迎来到WhatBlog大家庭</title>
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
</style>
</head>

<body>
	<c:import url="../public/navbar.jsp"></c:import>
	<section class="container">
		<c:import url="../public/header.jsp"></c:import>
		<!--/超小屏幕可见-->
		<div class="content-wrap">
			<!--内容-->
			<div class="content">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!--banner-->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"
							class=""></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"
							class=""></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<a
								href=""
								target="_blank"><img src="img/1.jpg" alt=""></a>
							<div class="carousel-caption">
								欢迎来到WhatBlog</div>
							<span class="carousel-bg"></span>
						</div>
						<div class="item">
							<a href="" target="_blank"><img src="img/1.jpg" alt=""></a>
							<div class="carousel-caption">
								欢迎来到WhatBlog</div>
							<span class="carousel-bg"></span>
						</div>
						<div class="item">
							<a href="" target="_blank"><img src="img/1.jpg" alt=""></a>
							<div class="carousel-caption">
								欢迎来到WhatBlog</div>
							<span class="carousel-bg"></span>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>


				<!-- 热门博主开始 -->
				<div class="content-block hidden-xs">
					<h2 class="title">
						<strong>热门博主</strong>
					</h2>

					<div class="row">
						<c:if test="${hostUsers != null && hostUsers.size() != 0 }">
							<c:forEach items="${hostUsers }" var="hostUser">
								<div class="col-sm-2" style="margin: 0px 10px 10px 10px;">
									<div class="avatar">
										<a 
										<c:if test="${user_name != hostUser.userName }">
										href="<c:url value='/show/blog/${hostUser.userName}'/>" 
										</c:if>
										<c:if test="${user_name == hostUser.userName }">
										href="<c:url value='/${user_name }/home'/>" 
										</c:if>
										target="_blank"
											style="background: url('${hostUser.headUrl}') no-repeat; background-size: 100px 100px;">
											<span>${hostUser.nickname }</span>
										</a>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<!-- 热门博主结束 -->
				<!-- 最新文章开始 -->
				<div class="content-block new-content">
					<h2 class="title">
						<strong>最新文章</strong>
					</h2>
					<div class="row">
						<c:set var="newArticles" value="${pages.list }"/>
						<c:if test="${newArticles != null && newArticles.size() != 0 }">
							<c:forEach items="${newArticles }" var="article">
								<div class="news-list">
									<div class="news-img col-xs-3 col-sm-3 col-md-3">
										<a target="_blank" href=""><img src="${article.showImage }" alt="">
										</a>
									</div>
									<div class="news-info col-xs-9 col-sm-9 col-md-9">
										<dl>
											<dt>
												<a href="<c:url value='/show/article/${article.id }'/>" target="_blank"> ${article.articleTitle } </a>
											</dt>
											<dd>
												<span class="name"><a <c:if test="${user_name != article.userName }">
										href="<c:url value='/show/blog/${article.userName}'/>" 
										</c:if>
										<c:if test="${user_name == article.userName }">
										href="<c:url value='/${user_name }/home'/>" 
										</c:if> target="_black" title=""
													rel="author">${article.nickname }</a></span> <span class="identity"></span> 
													<span><fmt:formatDate value="${article.createTime }" pattern="yyyy-MM-dd"/>
													</span>
											</dd>
											<dd class="text">${article.articleSummary }</dd>
										</dl>
										<div class="news_bot col-sm-7 col-md-8">
											<!-- <span class="tags visible-lg visible-md"> <a href="">本站</a>
												<a href="">异清轩</a>
											</span> --> <span class="look"> 共 <strong>${article.articleClick }</strong> 人查看， <strong>
													${article.commentsCount }</strong> 条评论
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<!-- 最新文章结束 -->
				
					<c:if test="${pages.pages > 1 }">
					<nav style="text-align: center;">
						<ul class="pagination">
							<li><a href="/whatblog/admin/${url }?page=1">首页</a></li>
							<c:forEach var="page" varStatus="status" begin="1"
								end="${pages.pages }">
								<li
									<c:if test="${pages.pageNum == status.index }">class="active"</c:if>><a
									href="/whatblog/admin/${url }?page=${status.index }">${status.index }</a></li>
							</c:forEach>
							<li><a
								href="/whatblog/admin/${url }?page=${pages.lastPage }">尾页</a></li>

						</ul>
					</nav>

				</c:if>


			</div>
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