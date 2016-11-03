<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="navbar-header" style="padding-left: 40px;">
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
    <a class="navbar-brand" href="/"><strong>WhatBlog</strong></a>
  </div>
  <div class="collapse navbar-collapse" id="example-navbar-collapse">
     <ul class="nav navbar-nav">
     <li><a href="#">item</a></li>
     <li><a href="#">item</a></li>
   	 </ul>
    <ul class="nav navbar-nav navbar-right" style="padding-right: 50px;">
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
      		<li><a href="<c:url value='/user/toLogin.do'/>">登录</a></li>
      		<li><a href="<c:url value='/user/toReg.do'/>">注册</a></li>
      	</c:if>
      	<c:if test="${user_name != null && user_name != '' }">
      		<li class="dropdown">
      	  <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-delay="100">
      	       <span id="show_user_name">${nickname }</span><b class="caret"></b>
      	    </a>
      	  <ul class="dropdown-menu">
      	  	<li><a class="btn" href="${user_name }/home.do" style="text-align: left;">我的博客</a></li>
      	  	<li><a class="btn" href="${user_name }/writeArticle.do" style="text-align: left;">写文章</a></li>
      	    <li><a class="btn" href="#" style="text-align: left;">修改密码</a></li>
      	    <li><a class="btn" href="${user_name }/userInfo.do" style="text-align: left;">修改资料</a></li>
      	    <li role="separator" class="divider"></li>
      	    <li><a href="user/logout.do">退出</a></li>
      	  </ul>
      	</li>
      	</c:if>
    </ul>
  </div>
</nav>