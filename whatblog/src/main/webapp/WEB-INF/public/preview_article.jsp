<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="ibox-content myshadow" id="content${article.id }">

	<div class="row">
		<div class="col-lg-2">
			<a href="${article.showImage }" class="button_link" target="_black">
				<img alt="image" class="img-responsive" src="${article.showImage }"
				style="max-height: 150px; min-height: 120px;"> <span
				class="line line_top"></span> <span class="line line_right"></span>
				<span class="line line_bottom"></span> <span class="line line_left"></span>
			</a>
		</div>
		<div class="col-lg-10">
			<a href="showArticle/${article.id }" class="btn-link">
				<!--跳转全文-->
				<h2>${article.articleTitle }</h2>
			</a>
			<p>${article.articleSummary }</p>
		</div>

	</div>
	<div class="row">
		<div class="col-md-7 " style="margin-bottom: 5px;">
			<c:if test="${article.articleSupport == 1}">
				<span class="label label-danger" style="font-size: 12px;">被禁</span>
			</c:if>
			<span class="label label-success" style="font-size: 12px;">分类:${article.typeName }</span>
			<span class="label label-primary" style="font-size: 12px;">评论:${article.commentsCount }</span>
			<span class="label label-info" style="font-size: 12px;">查看:${article.articleClick }</span>
			<span class="label label-warning" style="font-size: 12px;">发布于:<fmt:formatDate
					value="${article.createTime }" pattern="yyyy年MM月dd日  HH:mm:ss"></fmt:formatDate></span>
		</div>
		<div class="col-md-5">
			<div class="small text-right">
				<a href="showArticle/${article.id }"
					class="btn btn-primary">查看全文</a>
				<a href="modifyArticle/${article.id }"
					class="btn btn-primary">修改</a>
				<button class="btn btn-danger" onclick="dArticle(${article.id})">删除</button>
				
				<c:if test="${article.articleType == 1 }">
					<button class="btn btn-info" onclick="setIsPublic(${article.id })" id="isPublic"> 设为仅自己可看</button>
				</c:if>
				<c:if test="${article.articleType == 0 }">
					<button class="btn btn-info" onclick="setIsPublic(${article.id })" id="isPublic"> 设为公开</button>
				</c:if>
				

			</div>
		</div>
	</div>
</div>
<c:remove var="article"/>
<br />