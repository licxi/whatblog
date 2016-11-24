<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>博客标题</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value='/css/style.css'/>" type="text/css"
	rel="stylesheet">
<link href="<c:url value='/css/bootstrap.min.css'/>" type="text/css"
	rel="stylesheet">
<!--<link href="<c:url value='/css/fileinput.css'/>" type="text/css"
	rel="stylesheet">-->
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
.uditor{
	margin: 0;
	padding: 0;
	transition: all 0.00s ;
	-webkit-transition: all 0.00s ;
	-moz-transition: all 0.30s ease-in-out;
	-o-transition: all 0.30s ease-in-out;
	-ms-transition: all 0.30s ease-in-out;
}
</style>
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
					<h2>这是博客查看测试</h2>
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
				<div class="content-block comment">
					<h2 class="title">
						<strong>评论</strong>
					</h2>
					<form
						action=""
						method="post" class="form-inline" id="comment-form">
						<!-- <div class="comment-title">
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
						</div> -->
						<div class="comment-form">
							<textarea placeholder="你的评论可以一针见血" name="commentContent"></textarea>
							<div class="comment-form-footer">
								<div class="comment-form-text">
									请先 <a href="javascript:;">登录</a> 或 <a href="javascript:;">注册</a>
								</div>
								<div class="comment-form-btn">
									<button type="submit" class="btn btn-default btn-comment">提交评论</button>
								</div>
							</div>
						</div>
					</form>
				</div>
					<div class="feed-element">
						<a href="#" class="pull-left"><img alt="image" class="img-circle" src="<c:url value='/img/logo.png'/>"></a>
							<div class="media-body ">
								<small class="pull-right" style ="font-size:12px;">1楼</small>
									<strong style = "font-size:15px;">刘岑溪</strong><br>
									<small class="text-muted">2016</small>
									<div class="well" style = "font-size:14px;">你是个什么鬼
									</div>
								<div class="pull-right">游客</a>
									</div>
									</div>
					</div><hr />
					<div class="feed-element">
						<a href="#" class="pull-left"><img alt="image" class="img-circle" src="<c:url value='/img/logo.png'/>"></a>
							<div class="media-body ">
								<small class="pull-right" style ="font-size:12px;">1楼</small>
									<strong style = "font-size:15px;">刘岑溪</strong><br>
									<small class="text-muted">2016</small>
									<div class="well" style = "font-size:14px;">你是个什么鬼
									</div>
								<div class="pull-right">游客</a>
									</div>
									</div>
					</div><hr>
					<div class="feed-element">
						<a href="#" class="pull-left"><img alt="image" class="img-circle" src="<c:url value='/img/logo.png'/>"></a>
							<div class="media-body ">
								<small class="pull-right" style ="font-size:12px;">1楼</small>
									<strong style = "font-size:15px;">刘岑溪</strong><br>
									<small class="text-muted">2016</small>
									<div class="well" style = "font-size:14px;">你是个什么鬼
									</div>
								<div class="pull-right">游客</a>
									</div>
									</div>
					</div>
				<div class="content-block related-content visible-lg visible-md">
					<h2 class="title">
						<strong>相关推荐</strong>
					</h2>
					<div class="list-group">
						<a href="" class="list-group-item">欢迎来到WhatBlog</a> <a href=""
							class="list-group-item">欢迎来到WhatBlog</a> <a href=""
							class="list-group-item"> 欢迎来到WhatBlog</a> <a href=""
							class="list-group-item">欢迎来到WhatBlog</a>
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
	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>
	<!--/返回顶部-->
	<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ajaxfileupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/ueditor/ueditor.all.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/bootstrap.min.js' />"></script>
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
	<script type="text/javascript">
		var ue = UE.getEditor('container1',{
			 toolbars: [
			            ['source', //源代码
			             'undo', 'redo', 'bold','indent', //首行缩进
			             'snapscreen', //截图
			             'italic', //斜体
			             'underline', //下划线
			             'strikethrough', //删除线
			             'subscript', //下标
			             'fontborder', //字符边框
			             'superscript', //上标
			             'formatmatch', //格式刷
			             'selectall', //全选
			             'fontborder',//字符边框
			             'superscript', //上标
			             'formatmatch', //格式刷
			             'blockquote', //引用
			             'pasteplain', //纯文本粘贴模式
			             'selectall', //全选
			             'preview', //预览
			             'horizontal', //分隔线
			             'removeformat', //清除格式
			             'time', //时间
			             'date', //日期
			             'unlink', //取消链接
			             'inserttitle', //插入标题
			             'deletetable', //删除表格
			             'cleardoc', //清空文档
			             'insertparagraphbeforetable', //"表格前插入行"
			             'insertcode', //代码语言
			             'fontfamily', //字体
			             'fontsize', //字号
			             'paragraph', //段落格式
			             'simpleupload', //单图上传
			             'insertimage', //多图上传
			             'link', //超链接
			             'emotion', //表情
			             'searchreplace', //查询替换
			             'justifyleft', //居左对齐
			             'justifyright', //居右对齐
			             'justifycenter', //居中对齐
			             'justifyjustify', //两端对齐
			             'forecolor', //字体颜色
			             'insertorderedlist', //有序列表
			             'insertunorderedlist', //无序列表
			             'fullscreen', //全屏
			             'rowspacingtop', //段前距
			             'rowspacingbottom', //段后距
			             'pagebreak', //分页
			             'insertframe', //插入Iframe
			             'imagenone', //默认
			             'imageleft', //左浮动
			             'imageright', //右浮动
			             'imagecenter', //居中
			             'wordimage', //图片转存
			             'lineheight', //行间距
			             'edittip ', //编辑提示
			             'customstyle', //自定义标题
			             'autotypeset', //自动排版
			             'touppercase', //字母大写
			             'tolowercase', //字母小写
			             'inserttable', //插入表格
			             'drafts', // 从草稿箱加载
			             'charts', // 图表
			             'help' //帮助
			        ]],
			        autoHeightEnabled: true,
			        autoFloatEnabled: true,
			        allowDivTransToP: false,
			        initialFrameHeight:500, /* 设置高度 */
			        initialFrameWidth:'100%'/* 设置宽度 */ //占屏幕的一半
		});
		
	</script>
</body>
</html>