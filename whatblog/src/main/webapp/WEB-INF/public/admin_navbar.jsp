<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-header">
    <button class="navbar-toggle" data-target="#example-navbar-collapse" data-toggle="collapse" type="button">
      <span class="sr-only">
          切换导航
      </span>
      <span class="icon-bar">
      </span>
      <span class="icon-bar">
      </span>
      <span class="icon-bar">
      </span>
    </button>
    <a class="navbar-brand" href="<c:url value='/admin/home'/>"><strong>WhatBlog</strong></a>
  </div>
  <div class="collapse navbar-collapse" id="example-navbar-collapse">
     <ul class="nav navbar-nav">
     <li><a href="#">item</a></li>
     <li><a href="#">item</a></li>
   	 </ul>
    <ul class="nav navbar-nav navbar-right" style="padding-right: 20px;">
      	<!-- <li class="dropdown">
      	  <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-delay="100">
      	       <span id="show_user_name"></span><b class="caret"></b>
      	    </a>
      	  <ul class="dropdown-menu">
      	    <li><a class="btn" data-toggle="modal" data-target="#modify_password" data-toggle="dropdown" style="text-align: left;">修改密码</a></li>
      	    <li><a class="btn" href="" style="text-align: left;">修改资料</a></li>
      	    <li role="separator" class="divider"></li>
      	    <li><a href="">退出</a></li>
      	  </ul>
      	</li> -->
      	<c:if test="${user_name == null }">
      		<li><a href="<c:url value='/user/toLogin'/>">登录</a></li>
      		<li><a href="<c:url value='/user/toReg'/>">注册</a></li>
      	</c:if>
      	<c:if test="${user_name != null && user_name != '' }">
      		<li class="dropdown">
      	  <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-delay="100">
      	       <span id="show_user_name">${nickname }</span><b class="caret"></b>
      	    </a>
      	  <ul class="dropdown-menu">
      	  	<li><a class="btn" href="${user_name }/home" style="text-align: left;">我的博客</a></li>
      	  	<li><a class="btn" href="${user_name }/writeArticle" style="text-align: left;">写文章</a></li>
      	    <!-- <li><a class="btn" href="#" style="text-align: left;">修改密码</a></li> -->
      	    <li><a class="btn" href="${user_name }/userInfo" style="text-align: left;">修改资料</a></li>
      	    <li role="separator" class="divider"></li>
      	    <li><a href="user/logout">退出</a></li>
      	  </ul>
      	</li>
      	</c:if>
    </ul>
  </div>
</nav>

<nav class="navbar-default navbar-static-side" role="navigation" style="margin-top: 50px;">
	<div class="sidebar-collapse">
		<ul class="nav" id="side-menu">
			<!-- <li class="nav-header">
				<div class="dropdown profile-element">
					<span> </span> <a data-toggle="dropdown" class="dropdown-toggle"
						href="#"> <span class="clear"> <span
							class="block m-t-xs"> <strong class="font-bold">里程密</strong>
						</span> <span class="text-muted text-xs block">我是管理员<b
								class="caret"></b></span>
					</span>
					</a>
				</div>
				<div class="logo-element">里程密</div>
			</li> -->
			<li class="active"><a
				href="/whatblog/user/test"><i
					class="fa fa-diamond"></i> <span class="nav-label">后台首页</span></a></li>
			<li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">网站设置</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">网站管理</a></li>
					<li><a href="">管理员管理</a></li>
				</ul></li>
			<li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">会员管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">会员查看</a></li>
					<li><a href="">被锁会员</a></li>
				</ul></li>
			
			<!-- <li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">网站公告</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">查看公告</a></li>
					<li><a href="">添加公告</a></li>
				</ul></li> -->
			<li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">文章管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">查看文章</a></li>
					<li><a href="">置顶文章</a></li>
					<li><a href="">被禁文章</a></li>
				</ul></li>
			<!-- <li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">文章推荐</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">查看文章</a></li>
					<li><a href="">添加文章</a></li>
				</ul></li> -->
			<!-- <li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">评论管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">评论查看</a></li>
				</ul></li> -->
			<li><a
				href=""><i
					class="fa fa-th-large"></i> <span class="nav-label">评论管理</span></a></li>
			<li><a
				href=""><i
					class="fa fa-th-large"></i> <span class="nav-label">留言管理</span></a></li>
			<!-- <li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">留言管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">留言查看</a></li>
				</ul></li> -->
				<li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">分类管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">查看分类</a></li>
					<li><a href="">添加分类</a></li>
				</ul></li>
			
			<li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">举报管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">文章举报</a></li>
					<li><a href="">用户举报</a></li>
				</ul></li>
			<li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">建议管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">用户建议</a></li>
				</ul></li>
			<!-- <li><a href="/blog/index.php?m=Admin&c=Login&a=logout"> <i
					class="fa fa-sign-out"></i>退出
			</a></li> -->
		</ul>
</nav>
