<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<aside class="sidebar visible-lg">
	<!--右侧>992px显示-->
	<div class="sentence">
		<strong>每日一句</strong>
		<h2>
			<fmt:formatDate value="${nowDate }" pattern="yyyy年MM月dd日 E " />
		</h2>
		<p>${daily }</p>
	</div>
	<div id="search" class="sidebar-block search shadow" role="search"
		style="top: 210px;">
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
			<c:if test="${hostArticles != null && hostArticle.size() != 0}">
				<c:forEach items="${hostArticles }" var="hostArticle">
					<li><a target="_blank" href=""> <span class="thumb"><img
								src="${hostArticle.showImage }" alt=""></span> <span class="text">${hostArticle.articleTitle }</span>
							<span class="text-muted">阅读(${hostArticle.articleClick })</span>
					</a></li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
</aside>