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
    <a class="navbar-brand" href="<c:url value='/'/>"><strong>${systemName }</strong></a>
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
      		<%-- <li><a href="<c:url value='/user/toLogin'/>">登录</a></li> --%>
      		<li><a onclick="login()">登录</a></li>
      		<li><a href="<c:url value='/user/toReg'/>">注册</a></li>
      	</c:if>
      	<c:if test="${user_name != null && user_name != '' }">
      		<li class="dropdown">
      	  <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-delay="100">
      	       <span id="show_user_name">${nickname }</span><b class="caret"></b>
      	    </a>
      	  <ul class="dropdown-menu">
      	  	<li><a class="btn" href="<c:url value='/${user_name }/home'/>" style="text-align: left;">我的博客</a></li>
      	  	<li><a class="btn" href="<c:url value='/${user_name }/writeArticle'/>" style="text-align: left;">写文章</a></li>
      	    <!-- <li><a class="btn" href="#" style="text-align: left;">修改密码</a></li> -->
      	    <li><a class="btn" href="<c:url value='/${user_name }/userInfo'/>" style="text-align: left;">修改资料</a></li>
      	    <li role="separator" class="divider"></li>
      	    <li><a href="<c:url value='/user/logout'/>">退出</a></li>
      	  </ul>
      	</li>
      	</c:if>
    </ul>
  </div>
  <script type="text/javascript">
  	function login() {
		var now_url = window.location.pathname;
		var root = now_url.substring(0,now_url.indexOf('/',1));
		window.location.href= root+"/user/toLogin?fromurl="+now_url;
	}
  
  </script>
</nav>
