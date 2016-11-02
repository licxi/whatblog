<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/style.css'/>" type="text/css"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<title>用户的博客</title>
</head>
<body>
	<c:import url="../public/navbar.jsp"></c:import>
	<section class="container user-select">
	<c:import url="../public/header.jsp"></c:import>
		<div class="content-wrap">
			<!-- <div class="col-sm-offset-2 col-sm-12" style="margin-top: 5px;">
					<div class="col-sm-1 visible-lg">
						      <img alt="" title="点我更换头像" src="/whatblog/img/logo.png" 
						      	style="border-radius: 50%;width: 80px;height: 80px;"
						      		id="openFile" class="img"/>
					</div>
					<div class="col-sm-offset-1 col-sm-2">
						<h3>用户名</h3>
						<h4>用户博客描述</h4>
					</div>
			</div> -->
			<!--内容-->
			<div class="content">
				<header class="news_header" style="height: 100px;">
				<div class="col-sm-1 visible-lg">
						      <img alt="" title="点我更换头像" src="/whatblog/img/logo.png" 
						      	style="border-radius: 50%;width: 80px;height: 80px;"
						      		id="openFile" class="img"/>
					</div>
					<div class="col-sm-offset-1 col-sm-10">
						<h3>用户名</h3>
						<h4>用户博客描述</h4>
					</div>
					<!-- <p style="font-size: 22px;">用户的博客</p> -->
					<a class="btn btn-info" style="float: right!important;" href="" data-toggle="tooltip" data-placement="top" title="将博主添加到关注列表，来增加博主人气吧">加关注</a>
					<a class="btn btn-info" style="float: right!important;margin-right: 5px;"
					data-toggle="modal" data-target="#modify_info" href="">留言</a>
				</header>
				
				
				<!-- 文章列表 -->
				<div class="ibox-content myshadow" style="background-color: #f6f6f6">
                        <div class="row">
                            <div class="col-lg-11" style="margin-left: 35px;">
                                <a href="" class="btn-link"><!--跳转全文-->
                                    <h2 class="btn-link" align="center">这是文章的标题</h2>
                                
                                <p style="margin-top: 5px;margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要</p>
                                </a>
                                <div class="row">
                                    <div class="col-md-12" align="right" style="margin-bottom: 5px;">
                                        <span class="label label-primary" style="font-size:12px;">评论:100</span>
                                        <span class="label label-info"   style="font-size:12px;">查看:100</span>
                                        <span class="label label-warning"   style="font-size:12px;">时间:2016-7-8</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  <div class="ibox-content myshadow" style="margin-top: 50px;background-color: #f6f6f6">
                        <div class="row">
                            <div class="col-lg-11" style="margin-left: 35px;">
                                <a href="" class="btn-link"><!--跳转全文-->
                                    <h2 class="btn-link" align="center">这是文章的标题</h2>
                                
                                <p style="margin-top: 5px;margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要这是文章概要</p>
                                </a>
                                <div class="row">
                                    <div class="col-md-12" align="right" style="margin-bottom: 5px;">
                                        <span class="label label-primary" style="font-size:12px;">评论:100</span>
                                        <span class="label label-info"   style="font-size:12px;">查看:100</span>
                                        <span class="label label-warning"   style="font-size:12px;">时间:2016-7-8</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
		</div>
		
		
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
		</aside>
	</section>
	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>

<!-- 弹出留言框 -->
<div class="modal fade bs-example-modal-sm" id="modify_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">给博主留言</h4>
      </div>
      <div class="modal-body">
        <form action="#" method="post">
          <div class="input-group" id="id">
            <span class="input-group-addon" id="sizing-addon1">
              <span > 内容
              </span>
            </span>
            <input id ="" name="nickname" class="form-control" placeholder="简要概括就好！" type="text"/>
          </div>         
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onClick="check_nickname()">确认</button>
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
<script type="text/javascript">
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
</html>