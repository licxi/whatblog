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


<!-- 弹出建议框 -->
<div class="modal fade bs-example-modal-sm" id="suggest" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">您有什么 建议，都可以告诉我们</h4>
			</div>
			<div class="modal-body">
				<form action="#" method="post">
					<div class="input-group" id="id">
						<span class="input-group-addon" id="sizing-addon1"> <span>
								内容 </span>
						</span> <input id="suggest_content" name="content" class="form-control"
							onkeyup="check_suggest_content()" onblur="check_suggest_content()"
							placeholder="简要概括就好！" type="text" />
					</div>

					<div style="text-align: center;">
						<span id="input_tip" style="color: red; font-size: 16px;"></span>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="submitSuggest" onclick="submitSuggestContent()">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div id="wrapper">
	<nav style="" class="navbar-default navbar-static-side-write-article">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header" style="text-align: center;">
					<div class="dropdown profile-element">
						<span> <a href="<c:url value='/${user_name }/'/>"> <!--头像-->
								<img alt="image" class="img-circle" src="${headUrl }"
								width="80px;" id="head_image" height="80px;" />
						</a>
						</span> <span class="clear"> <span class="block m-t-xs"
							style="color: #fff;"> <strong class="font-bold">${nickname }</strong>
						</span> <span class="text-muted text-xs block"></span> <!--名字下面的描述-->
						</span>
					</div>
					<div class="logo-element">
						${systemName }
						<!--导航栏缩小时显示文字-->
					</div>
				</li>
				<li><a href="<c:url value='/${user_name}/home'/>"><i
						class="fa fa-globe"></i> <span class="nav-label">主页</span></a></li>
				<li><a href="<c:url value='/${user_name}/userInfo'/>"><i
						class="fa fa-globe"></i> <span class="nav-label">个人信息</span></a></li>
				<li><a href="<c:url value='/${user_name}/writeArticle'/>"><i
						class="fa fa-globe"></i> <span class="nav-label">撰写文章</span></a></li>
				<li><a href="<c:url value='/${user_name}/articleManage'/>"><i
						class="fa fa-globe"></i> <span class="nav-label">管理文章</span></a></li>
				<%-- <li><a href="<c:url value='/${user_name}/commentManage'/>"><i
						class="fa fa-globe"></i> <span class="nav-label">评论管理</span></a></li> --%>
				<li><a href="<c:url value='/${user_name}/attentionManage'/>"><i
						class="fa fa-globe"></i> <span class="nav-label">关注管理</span></a></li>
				<li><a href="<c:url value='/${user_name}/messageManage'/>"><i
						class="fa fa-globe"></i> <span class="nav-label">留言板</span>
					<!-- <span
						class="label label-info pull-right">100</span> --></a></li>
				<li><a data-toggle="modal" data-target="#suggest"><i class="fa fa-globe"></i> <span
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
						style="font-size: 26px; padding-top: 10px; padding-left: 16px;">
						<!-- <input type="text" placeholder="搜索你的文章" class="form-control"
								name="keywords" id="top-search" required> -->
						<a href="../"><strong>${systemName }主页</strong></a>

					</div>
					<!-- </form> -->
				</div>
				<ul class="nav navbar-top-links navbar-right">
					<c:if test="${user_name == null }">
						<li><a href="user/toLogin">登录</a></li>
						<li><a href="user/toReg">注册</a></li>
					</c:if>
					<c:if test="${user_name != null && user_name != '' }">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-hover="dropdown" data-toggle="dropdown" data-delay="100">
								<span id="show_user_name">${nickname }</span><b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a class="btn" href="home" style="text-align: left;">我的博客</a></li>
								<li><a class="btn" href="writeArticle"
									style="text-align: left;">写文章</a></li>
								<li><a class="btn" data-toggle="modal" data-target="#modify_password" style="text-align: left;">修改密码</a></li>
								<li><a class="btn" href="userInfo"
									style="text-align: left;">修改资料</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="<c:url value='/user/logout'/>">退出</a></li>
							</ul></li>
					</c:if>

				</ul>

			</nav>
		</div>