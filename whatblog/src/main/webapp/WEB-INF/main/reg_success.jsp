<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="<c:url value='/css/nprogress.css'/>" type="text/css"
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
</head>

<body>
	<c:import url="../public/navbar.jsp"></c:import>
	<section class="container user-select">
		<c:import url="../public/header.jsp"></c:import>
		<!--/超小屏幕可见-->
		<div class="content-wrap">
			<!--内容-->
			<div class="content">
				<header class="news_header">
					<h2>欢迎成为WhatBlog的成员</h2>
				</header>
				<div style="text-align: center;padding-top: 50px;">
					<h4>嗨，你现在可以：</h4><hr>
					<a class="btn btn-primary">现在就去完善个人信息，让更多人认识你吧！</a><br><br>
					<a class="btn btn-primary">现在就进入你自己的博客吗？点我有惊喜喔！</a><br><br>
					<a class="btn btn-primary">现在就进入到首页，寻找耐人寻味的博文吧！</a>
				</div>
				<h2>温馨提示：</h2>
				 <div class="jumbotron">
			        <p>1. 发布博客，评论能获得积分，以后会很有用处喔。</p>
			        <p>2. 注意您的言论，不能发表违法的言论和谩骂、诋毁他人。</p>
			        <p>3. 禁止发布不良消息，营造良好的博客环境。</p>
			        
      			</div>
				
				<div class="content-block related-content visible-lg visible-md">
					<h2 class="title">
						<strong>相关推荐</strong>
					</h2>
					<div class="list-group">
						<a href="" class="list-group-item">欢迎来到WhatBlog</a> 
						<a href="" class="list-group-item">欢迎来到WhatBlog</a> 
						<a href="" class="list-group-item"> 欢迎来到WhatBlog</a>
						<a href="" class="list-group-item">欢迎来到WhatBlog</a>
					</div>
				</div>
			</div>
		</div>

		<!--/内容-->
		<aside class="sidebar visible-lg">
			<!--右侧>992px显示-->
			<div class="sentence">
				<strong>每日一句</strong>
				<h2>2015年11月1日 星期日</h2>
				<p>你是我人生中唯一的主角，我却只能是你故事中的一晃而过得路人甲。</p>
			</div>
			<div id="search" class="sidebar-block search shadow" role="search"
				style="top: 220px;">
				<h2 class="title">
					<strong>搜索</strong>
				</h2>
				<form class="navbar-form" action="" method="post">
					<div class="input-group">
						<input type="text" class="form-control" size="35"
							placeholder="请输入关键字"> <span class="input-group-btn">
							<button class="btn btn-default btn-search" type="submit">搜索</button>
						</span>
					</div>
				</form>
			</div>
			<div class="sidebar-block recommend">
				<h2 class="title">
					<strong>热门推荐</strong>
				</h2>
				<ul>
					<li><a target="_blank" href=""> <span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>" alt=""></span> <span
							class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span
							class="text-muted">阅读(2165)</span>
					</a></li>
					<li><a target="_blank" href=""> <span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>" alt=""></span> <span
							class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span
							class="text-muted">阅读(2165)</span>
					</a></li>
					<li><a target="_blank" href=""> <span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>" alt=""></span> <span
							class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span
							class="text-muted">阅读(2165)</span>
					</a></li>
					<li><a target="_blank" href=""> <span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>" alt=""></span> <span
							class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span
							class="text-muted">阅读(2165)</span>
					</a></li>
					<li><a target="_blank" href=""> <span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>" alt=""></span> <span
							class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span
							class="text-muted">阅读(2165)</span>
					</a></li>
				</ul>
			</div>
			<!-- <div class="sidebar-block comment">
				<h2 class="title">
					<strong>最新评论</strong>
				</h2>
				<ul>
					<li data-toggle="tooltip" data-placement="top" title=""
						data-original-title="站长的评论"><a target="_blank"
						href="http://www.17sucai.com/preview/512263/2016-04-05/%E5%BC%82%E6%B8%85%E8%BD%A9%E5%8D%9A%E5%AE%A28/content.html"><span
							class="face"><img
								src="./欢迎来到异清轩技术博客 - 异清轩技术博客 - POWERED BY WY ALL RIGHTS RESERVED_files/icon.png"
								alt=""></span> <span class="text"><strong>异清轩站长</strong>
								(2015-10-18) 说：<br> 欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
					<li data-toggle="tooltip" data-placement="top" title=""
						data-original-title="读者墙上的评论"><a target="_blank"
						href="http://www.17sucai.com/preview/512263/2016-04-05/%E5%BC%82%E6%B8%85%E8%BD%A9%E5%8D%9A%E5%AE%A28/content.html"><span
							class="face"><img
								src="./欢迎来到异清轩技术博客 - 异清轩技术博客 - POWERED BY WY ALL RIGHTS RESERVED_files/icon.png"
								alt=""></span> <span class="text"><strong>异清轩站长</strong>
								(2015-10-18) 说：<br> 欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
					<li data-toggle="tooltip" data-placement="top" title=""
						data-original-title="异清轩技术博客的SHORTCUT和ICON图标...的评论"><a
						target="_blank"
						href="http://www.17sucai.com/preview/512263/2016-04-05/%E5%BC%82%E6%B8%85%E8%BD%A9%E5%8D%9A%E5%AE%A28/content.html"><span
							class="face"><img
								src="./欢迎来到异清轩技术博客 - 异清轩技术博客 - POWERED BY WY ALL RIGHTS RESERVED_files/icon.png"
								alt=""></span> <span class="text"><strong>异清轩站长</strong>
								(2015-10-18) 说：<br> 欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
					<li data-toggle="tooltip" data-placement="top" title=""
						data-original-title="异清轩技术博客的SHORTCUT和ICON图标...的评论"><a
						target="_blank"
						href="http://www.17sucai.com/preview/512263/2016-04-05/%E5%BC%82%E6%B8%85%E8%BD%A9%E5%8D%9A%E5%AE%A28/content.html"><span
							class="face"><img
								src="./欢迎来到异清轩技术博客 - 异清轩技术博客 - POWERED BY WY ALL RIGHTS RESERVED_files/icon.png"
								alt=""></span> <span class="text"><strong>异清轩站长</strong>
								(2015-10-18) 说：<br> 欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
					<li data-toggle="tooltip" data-placement="top" title=""
						data-original-title="异清轩技术博客的SHORTCUT和ICON图标...的评论"><a
						target="_blank"
						href="http://www.17sucai.com/preview/512263/2016-04-05/%E5%BC%82%E6%B8%85%E8%BD%A9%E5%8D%9A%E5%AE%A28/content.html"><span
							class="face"><img
								src="./欢迎来到异清轩技术博客 - 异清轩技术博客 - POWERED BY WY ALL RIGHTS RESERVED_files/icon.png"
								alt=""></span> <span class="text"><strong>异清轩站长</strong>
								(2015-10-18) 说：<br> 欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
				</ul>
			</div> -->
		</aside>
		<!--/右侧>992px显示-->
		<c:import url="../public/footer.jsp"></c:import>
	</section>
	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>
	<!--/返回顶部-->
	<script src="<c:url value='/js/nprogress.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"
		type="text/javascript"></script>
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
				var top = element.position().top
				; //当前元素对象element距离浏览器上边缘的距离 
				var pos = element.css("position"); //当前元素距离页面document顶部的距离
				$(window).scroll(function() { //侦听滚动时 
					var scrolls = $(this).scrollTop();
					if (scrolls > top) { //如果滚动到页面超出了当前元素element的相对页面顶部的高度 
						if (window.XMLHttpRequest) { //如果不是ie6 
							element.css({ //设置css 
								position : "fixed", //固定定位,即不再跟随滚动 
								top : 50
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
						}).removeClass("shadow");//移除阴影样式.shadow 
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