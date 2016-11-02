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
<link href="<c:url value='/css/bootstrap.min.css'/>" type="text/css" rel="stylesheet">
<link href="<c:url value='/css/style.css'/>" type="text/css" rel="stylesheet">
<link href="<c:url value='/css/nprogress.css'/>" type="text/css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.min.js" type="text/javascript"></script>
    <script src="js/respond.min.js" type="text/javascript"></script>
    <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<link rel="apple-touch-icon-precomposed" href="<c:url value='/img/icon.jpg'/>">
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
object, embed {
	-webkit-animation-duration: .001s;
	-webkit-animation-name: playerInserted;
	-ms-animation-duration: .001s;
	-ms-animation-name: playerInserted;
	-o-animation-duration: .001s;
	-o-animation-name: playerInserted;
	animation-duration: .001s;
	animation-name: playerInserted;
}

@
-webkit-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-ms-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-o-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}
}
</style>
</head>

<body>
	<section class="container user-select">
		<header>
			<div class="hidden-xs header">
				<!--超小屏幕不显示-->
				<h1 class="logo">
					<a href="" title="WhatBlog"></a>
				</h1>
				<ul class="nav hidden-xs-nav">
					<li class="active"><a
						href=""><span
							class="glyphicon glyphicon-home"></span>网站首页</a></li>
					<li><a
						href=""><span
							class="glyphicon glyphicon-erase"></span>网站前端</a></li>
					<li><a
						href=""><span
							class="glyphicon glyphicon-inbox"></span>后端技术</a></li>
					<li><a
						href=""><span
							class="glyphicon glyphicon-globe"></span>管理系统</a></li>
					<li><a
						href=""><span
							class="glyphicon glyphicon-user"></span>关于我们</a></li>
					<li><a
						href=""><span
							class="glyphicon glyphicon-tags"></span>友情链接</a></li>
				</ul>
				<div class="feeds">
					<a class="feed feed-xlweibo"
						href=""
						target="_blank"><i></i>新浪微博</a> <a class="feed feed-txweibo"
						href=""
						target="_blank"><i></i>腾讯微博</a> <a class="feed feed-rss"
						href=""
						target="_blank"><i></i>订阅本站</a> <a class="feed feed-weixin"
						data-toggle="popover" data-trigger="hover" title=""
						data-html="true"
						data-content="&lt;img src=&#39;<c:url value='/img/weixin.png'/>&#39; alt=&#39;&#39;&gt;"
						href="javascript:;" target="_blank" data-original-title="微信扫一扫"><i></i>关注微信</a>
				</div>
				<div class="wall">
					<a
						href=""
						target="_blank">读者墙</a> | <a
						href=""
						target="_blank">标签云</a>
				</div>
			</div>
			<!--/超小屏幕不显示-->
			<div class="visible-xs header-xs">
				<!--超小屏幕可见-->
				<div class="navbar-header header-xs-logo">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#header-xs-menu"
						aria-expanded="false" aria-controls="navbar">
						<span class="glyphicon glyphicon-menu-hamburger"></span>
					</button>
				</div>
				<div id="header-xs-menu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav header-xs-nav">
						<li class="active"><a
							href=""><span
								class="glyphicon glyphicon-home"></span>网站首页</a></li>
						<li><a
							href=""><span
								class="glyphicon glyphicon-erase"></span>网站前端</a></li>
						<li><a
							href=""><span
								class="glyphicon glyphicon-inbox"></span>后端技术</a></li>
						<li><a
							href=""><span
								class="glyphicon glyphicon-globe"></span>管理系统</a></li>
						<li><a
							href=""><span
								class="glyphicon glyphicon-user"></span>关于我们</a></li>
						<li><a
							href=""><span
								class="glyphicon glyphicon-tags"></span>友情链接</a></li>
					</ul>
					<form class="navbar-form"
						action=""
						method="post" style="padding: 0 25px;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="请输入关键字">
							<span class="input-group-btn">
								<button class="btn btn-default btn-search" type="submit">搜索</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</header>
		<!--/超小屏幕可见-->
		<div class="content-wrap">
			<!--内容-->
			<div class="content">
				<header class="news_header">
					<h2>欢迎来到异清轩技术博客</h2>
					<ul>
						<li>admin 发布于 2015-06-29</li>
						<li>栏目：<a
							href=""
							title="" target="_blank">网站前端</a></li>
						<li>来源：<a
							href=""
							title="" target="_blank">互联网</a></li>
						<li>共 <strong>2345</strong> 人围观
						</li>
						<li><strong>123</strong> 个不明物体</li>
					</ul>
				</header>
				<!-- 推荐 -->
				<div class="reprint">
					转载请说明出处：<a
						href=""
						title="" target="_blank">WhatBlog</a> » <a
						href=""
						title="" target="_blank">欢迎来到WhatBlog</a>
				</div>
				<div class="zambia">
					<a href="javascript:;" name="zambia" rel=""><span
						class="glyphicon glyphicon-thumbs-up"></span> 赞（0）</a>
				</div>
				<nav class="page-nav">
					<span class="page-nav-prev">上一篇<br> <a
						href=""
						rel="prev">欢迎来到WhatBlog</a></span> <span class="page-nav-next">下一篇<br>
						<a
						href=""
						rel="next">欢迎来到WhatBlog</a></span>
				</nav>
				<div class="content-block related-content visible-lg visible-md">
					<h2 class="title">
						<strong>相关推荐</strong>
					</h2>
					<div class="list-group">
			
				<a href=""  class="list-group-item">欢迎来到WhatBlog</a>
					<a href=""  class="list-group-item">欢迎来到WhatBlog</a>
					<a href=""  class="list-group-item">
					欢迎来到WhatBlog</a>
					<a href=""  class="list-group-item">欢迎来到WhatBlog</a>
				</if>
			</div>
					<!-- <ul>
						<li><a target="_blank"
							href="">
								<h3>欢迎来到WhatBlog</h3> </a></li>
						<li><a target="_blank"
							href="">
								<h3>欢迎来到WhatBlog</h3> </a></li>
						<li><a target="_blank"
							href="">
								<h3>欢迎来到WhatBlog</h3> </a></li>
						<li><a target="_blank"
							href="">
								<h3>欢迎来到WhatBlog</h3> </a></li>
						<li><a target="_blank"
							href="">
								<h3>欢迎来到WhatBlog</h3> </a></li>
						<li><a target="_blank"
							href="">
								<h3>欢迎来到WhatBlog</h3> </a></li>
						<li><a target="_blank"
							href="">
								<h3 style="display: none;">欢迎来到WhatBlog</h3> </a></li>
						<li><a target="_blank"
							href="">
								<h3>欢迎来到WhatBlog</h3> </a></li>
					</ul> -->
				</div>
				<div class="content-block comment">
					<h2 class="title">
						<strong>评论</strong>
					</h2>
					<form
						action=""
						method="post" class="form-inline" id="comment-form">
						<div class="comment-title">
							<div class="form-group">
								<label for="commentName">昵称：</label> <input type="text"
									name="commentName" class="form-control" id="commentName"
									placeholder="刘岑溪">
							</div>
							<div class="form-group">
								<label for="commentEmail">邮箱：</label> <input type="email"
									name="commentEmail" class="form-control" id="commentEmail"
									placeholder="417708459@qq.com">
							</div>
						</div>
						<div class="comment-form">
							<textarea placeholder="你的评论可以一针见血" name="commentContent"></textarea>
							<div class="comment-form-footer">
								<div class="comment-form-text">
									请先 <a href="javascript:;">登录</a> 或 <a href="javascript:;">注册</a>，也可匿名评论
								</div>
								<div class="comment-form-btn">
									<button type="submit" class="btn btn-default btn-comment">提交评论</button>
								</div>
							</div>
						</div>
					</form>
					<div class="comment-content">
						<ul>
							<li><span class="face"><img
									src=""
									alt=""></span> <span class="text"><strong>异清轩站长</strong>
									(2015-10-18) 说：<br>
									欢迎来WhatBlog
									...</span></li>
							<li><span class="face"><img
									src=""
									alt=""></span> <span class="text"><strong>异清轩编辑</strong>
									(2015-10-18) 说：<br> 欢迎来WhatBlog</span></li>
							<li><span class="face"><img
									src=""
									alt=""></span> <span class="text"><strong>令狐冲</strong>
									(2015-10-18) 说：<br>
									欢迎来WhatBlog
									...</span></li>
							<li><span class="face"><img
									src=""
									alt=""></span> <span class="text"><strong>任盈盈</strong>
									(2015-10-18) 说：<br>
									欢迎来WhatBlog</span></li>
							<li><span class="face"><img
									src=""
									alt=""></span> <span class="text"><strong>异清轩站长</strong>
									(2015-10-18) 说：<br> 欢迎来WhatBlog</span></li>
						</ul>
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
				style="position: fixed; top: 220px;">
				<h2 class="title">
					<strong>搜索</strong>
				</h2>
				<form class="navbar-form"
					action=""
					method="post">
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
					<li><a target="_blank"
						href="">
							<span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>"
								alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标
								...</span> <span class="text-muted">阅读(2165)</span>
					</a></li>
					<li><a target="_blank"
						href="">
							<span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>"
								alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标
								...</span> <span class="text-muted">阅读(2165)</span>
					</a></li>
					<li><a target="_blank"
						href="">
							<span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>"
								alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标
								...</span> <span class="text-muted">阅读(2165)</span>
					</a></li>
					<li><a target="_blank"
						href="">
							<span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>"
								alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标
								...</span> <span class="text-muted">阅读(2165)</span>
					</a></li>
					<li><a target="_blank"
						href="">
							<span class="thumb"><img
								src="<c:url value='/img/icon.jpg'/>"
								alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标
								...</span> <span class="text-muted">阅读(2165)</span>
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
		<footer class="footer">
			POWERED BY ©<a href="">刘岑溪</a> ALL
			RIGHTS RESERVED &nbsp;&nbsp;&nbsp;<span><a
				href="#" target="_blank">WhatBlog</a></span>
			<span style="display: none"><a
				href="">网站统计</a></span>
		</footer> 
	</section>
	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>
	<!--/返回顶部-->
	<script
		src="<c:url value='/js/nprogress.js'/>"
		type="text/javascript"></script>
	<script
		src="<c:url value='/js/bootstrap.min.js'/>"
		type="text/javascript"></script>
	<script type="text/javascript">
//页面加载

//返回顶部按钮
$(function(){
	$(window).scroll(function(){
		if($(window).scrollTop()>100){
			$(".gotop").fadeIn();	
		}
		else{
			$(".gotop").hide();
		}
	});
	$(".gotop").click(function(){
		$('html,body').animate({'scrollTop':0},500);
	});
});
//提示插件启用
$(function () {
  $('[data-toggle="popover"]').popover();
});
$(function () {
	$('[data-toggle="tooltip"]').tooltip();
});
//鼠标滑过显示 滑离隐藏
	//banner
$(function(){
	$(".carousel").hover(function(){
		$(this).find(".carousel-control").show();
	},function(){
		$(this).find(".carousel-control").hide();
	});
});
	//本周热门
$(function(){
	$(".hot-content ul li").hover(function(){
		$(this).find("h3").show();
	},function(){
		$(this).find("h3").hide();
	});
});
	//相关推荐
$(function(){
	$(".related-content ul li").hover(function(){
		$(this).find("h3").show();
	},function(){
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
						position: "fixed", //固定定位,即不再跟随滚动 
						top: 51 //距离页面顶部为0 
					}).addClass("shadow"); //加上阴影样式.shadow 
				} else { //如果是ie6 
					element.css({ 
						top: scrolls  //与页面顶部距离 
					});     
				} 
			}else { 
				element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式 
					position: pos, 
					top: top 
				}).removeClass("shadow");//移除阴影样式.shadow 
			} 
		}); 
	}; 
	return $(this).each(function() { 
		position($(this));                          
	}); 
}; 
//启用页面元素智能定位
$(function(){
	$("#search").smartFloat();
});


//ajax更新点赞值
$(function(){   
    $(".content .zambia a").click(function(){   
        var zambia = $(this);   
        var id = zambia.attr("rel"); //对应id   
        zambia.fadeOut(1000); //渐隐效果   
        $.ajax({   
            type:"POST",   
            url:"zambia.php",   
            data:"id="+id,   
            cache:false, //不缓存此页面   
            success:function(data){   
                zambia.html(data);   
                zambia.fadeIn(1000); //渐显效果   
            }   
        });   
        return false;   
    });   
})
</script>


</body>
</html>