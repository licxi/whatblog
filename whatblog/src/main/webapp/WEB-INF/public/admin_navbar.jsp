<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 修改密码框 -->
<div class="modal fade bs-example-modal-sm" id="modify_password" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改密码</h4>
      </div>
      <div class="modal-body">
        <form action="#" method="post">
          <div class="input-group " id="id">
            <span class="input-group-addon" id="sizing-addon1">
              <span > 原始密码
              </span>
            </span>
            <input id ="old_password" name="old_password" class="form-control" type="password"/>
          </div>
            <br/>
          <div class="input-group " id="id">
            <span class="input-group-addon" id="sizing-addon1">
              <span > 新的密码
              </span>
            </span>
            <input id ="new_password" name="new_password" class="form-control" type="password"/>
          </div>
          <br/>
           <div class="input-group " id="id">
            <span class="input-group-addon" id="sizing-addon1">
              <span > 确认密码
              </span>
            </span>
            <input id ="re_password" name="re_password" class="form-control" type="password"/>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" onClick="check_password()" class="btn btn-primary">修改</button>
        </form>
      </div>
    </div>
  </div>
</div>


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
    <a class="navbar-brand" href="<c:url value='/admin/index'/>"><strong>WhatBlog</strong></a>
  </div>
  <div class="collapse navbar-collapse" id="example-navbar-collapse">
     <ul class="nav navbar-nav">
     <li><a href="#">item</a></li>
     <li><a href="#">item</a></li>
   	 </ul>
    <ul class="nav navbar-nav navbar-right" style="padding-right: 34px;">
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
      	<c:if test="${adminAccount == null }">
      		<c:redirect url="toLogin"/>	
      	</c:if>
      	<c:if test="${adminAccount != null && adminAccount != '' }">
      		<li class="dropdown">
      	  <a  class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-delay="100">
      	       <span id="show_user_name">${adminName }</span><b class="caret"></b>
      	    </a>
      	  <ul class="dropdown-menu" style="min-width: 100px;">
      	  	<li><a class="btn" data-toggle="modal" data-target="#modify_password" style="text-align: left;">修改密码</a></li>
      	    <li><a href="logout">退出</a></li>
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
				href="<c:url value='/admin/index'/>"><i
					class="fa fa-diamond"></i> <span class="nav-label">后台首页</span></a></li>
			<li ><a
				href="<c:url value='/admin/systemManage'/>"><i
					class="fa fa-th-large"></i> <span class="nav-label">系统设置</span></a></li>		
			<!-- <li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">网站设置</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">网站管理</a></li>
					<li><a href="">管理员管理</a></li>
				</ul></li> -->
			<%-- <li><a
				href="<c:url value='/admin/modifyPassword'/>"><i
					class="fa fa-th-large"></i> <span class="nav-label">修改密码</span></a></li> --%>
			<li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">会员管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="<c:url value='/admin/userManage'/>">会员查看</a></li>
					<li><a href="<c:url value='/admin/lockedUserManage'/>">被锁会员</a></li>
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
					<li><a href="<c:url value='/admin/articleManage'/>">所有文章</a></li>
					<li><a href="<c:url value='/admin/hostArticleManage'/>">热门文章</a></li>
					<li><a href="<c:url value='/admin/upArticleManage'/>">置顶文章</a></li>
					<li><a href="<c:url value='/admin/lockArticleManage'/>">被禁文章</a></li>
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
				<!-- <li><a href="#"><i class="fa fa-th-large"></i> <span
					class="nav-label">分类管理</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="">查看分类</a></li>
					<li><a href="">添加分类</a></li>
				</ul></li> -->
			
			<li><a
				href="<c:url value='/admin/typeManage'/>"><i
					class="fa fa-th-large"></i> <span class="nav-label">分类管理</span></a></li>
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

