<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapper">
	<nav style="" class="navbar-default navbar-static-side-write-article">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header" style="text-align: center;">
					<div class="dropdown profile-element">
						<span> <a href=""> <!--头像--> <img alt="image"
								class="img-circle" src="${headUrl }" width="80px;"
								id="head_image" height="80px;" />
						</a>
						</span> <span class="clear"> <span class="block m-t-xs"
							style="color: #fff;"> <strong class="font-bold">${nickname }</strong>
						</span> <span class="text-muted text-xs block"></span> <!--名字下面的描述-->
						</span>
					</div>
					<div class="logo-element">
						WhatBlog
						<!--导航栏缩小时显示文字-->
					</div>
				</li>
				<li><a href="home.do"><i class="fa fa-globe"></i> <span
						class="nav-label">主页</span></a></li>
				<li><a href="userInfo.do"><i class="fa fa-globe"></i> <span
						class="nav-label">个人信息</span></a></li>
				<li><a href="writeArticle.do"><i class="fa fa-globe"></i> <span
						class="nav-label">撰写文章</span></a></li>
				<li><a href="articleManage.do"><i class="fa fa-globe"></i>
						<span class="nav-label">管理文章</span></a></li>
				<li><a href=""><i class="fa fa-globe"></i> <span
						class="nav-label">评论管理</span></a></li>
				<li><a href=""><i class="fa fa-globe"></i> <span
						class="nav-label">关注管理</span></a></li>
				<li><a href=""><i class="fa fa-globe"></i> <span
						class="nav-label">留言板</span><span
						class="label label-info pull-right">100</span></a></li>
				<li><a href=""><i class="fa fa-globe"></i> <span
						class="nav-label">建议</span></a></li>
			</ul>
		</div>
	</nav>
	<div id="page-wrapper" class="gray-bg">
		<div class="row border-bottom">
			<nav class="navbar navbar-static-top" role="navigation"
				style="margin-bottom: 0">
				<div class="navbar-header">
					<!--目前不需要缩小-->
					<!-- <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>-->
					<!-- <form role="search" class="navbar-form-custom" action=""
						method="post"> -->
					<div class="form-group"
						style="font-size: 26px; padding-top: 10px; padding-left: 10px;">
						<!-- <input type="text" placeholder="搜索你的文章" class="form-control"
								name="keywords" id="top-search" required> -->
						<a href="../"><strong>WhatBlog主页</strong></a>

					</div>
					<!-- </form> -->
				</div>
				<ul class="nav navbar-top-links navbar-right">
					<c:if test="${user_name == null }">
						<li><a href="user/toLogin.do">登录</a></li>
						<li><a href="user/toReg.do">注册</a></li>
					</c:if>
					<c:if test="${user_name != null && user_name != '' }">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-hover="dropdown" data-toggle="dropdown" data-delay="100">
								<span id="show_user_name">${nickname }</span><b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a class="btn" href="home.do" style="text-align: left;">我的博客</a></li>
								<li><a class="btn" href="writeArticle.do"
									style="text-align: left;">写文章</a></li>
								<li><a class="btn" href="#" style="text-align: left;">修改密码</a></li>
								<li><a class="btn" href="userInfo.do"
									style="text-align: left;">修改资料</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="<c:url value='/user/logout.do'/>">退出</a></li>
							</ul></li>
					</c:if>

				</ul>

			</nav>
		</div>