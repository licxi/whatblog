<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<header>
			<div class="hidden-xs header">
				<!--超小屏幕不显示-->
				<!-- <h1 class="logo">
					<a href="" title="WhatBlog" style="height: 80px"></a>
				</h1> -->
				<ul class="nav hidden-xs-nav">
					<li class="active"><a href="<c:url value='/'/>"><span
							class="glyphicon glyphicon-home"></span>网站首页</a></li>
					<c:if test="${types != null && types.size() != 0 }">
					<c:forEach items="${types }" var="type">
					<li><a href="<c:url value='/search/article?wd=${wd }&t=${type.id }'/>"><span class="glyphicon glyphicon-erase"></span>${type.typeName }</a></li>
					</c:forEach>
					</c:if>
				</ul>
				<%-- <div class="feeds">
					<a class="feed feed-xlweibo" href="" target="_blank"><i></i>新浪微博</a>
					<a class="feed feed-txweibo" href="" target="_blank"><i></i>腾讯微博</a>
					<a class="feed feed-rss" href="" target="_blank"><i></i>订阅本站</a> <a
						class="feed feed-weixin" data-toggle="popover"
						data-trigger="hover" title="" data-html="true"
						data-content="&lt;img src=&#39;<c:url value='/img/weixin.png'/>&#39; alt=&#39;&#39;&gt;"
						href="javascript:;" target="_blank" data-original-title="微信扫一扫"><i></i>关注微信</a>
				</div> --%>
				<!-- <div class="wall">
					<a href="" target="_blank">读者墙</a> | <a href="" target="_blank">标签云</a>
				</div> -->
			</div>
			<!--/超小屏幕不显示-->
			<!-- <div class="visible-xs header-xs">
				超小屏幕可见
				<div class="navbar-header header-xs-logo">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#header-xs-menu"
						aria-expanded="false" aria-controls="navbar">
						<span class="glyphicon glyphicon-menu-hamburger"></span>
					</button>
				</div>
				<div id="header-xs-menu" class="navbar-collapse collapse">
					<form class="navbar-form" action="" method="post"
						style="padding: 0 25px;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="请输入关键字">
							<span class="input-group-btn">
								<button class="btn btn-default btn-search" type="submit">搜索</button>
							</span>
						</div>
					</form>
				</div>
			</div> -->
		</header>