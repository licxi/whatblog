<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>博客创作ing</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/font-awesome/css/font-awesome.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/animate.css" rel="stylesheet'/>"
	rel="stylesheet">
<link href="<c:url value='/css/mystyle.css" rel="stylesheet'/>"
	rel="stylesheet">
</head>
<body>
	<c:import url="../public/user_sidebar.jsp"></c:import>
	<div class="wrapper wrapper-content animated fadeInRight">
		<!-- 幻灯片开始 -->
		<div class="row">
			<div class="col-sm-12">
				<h3>撰写文章</h3>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
		<input type="file" id="imgUpl" name="imgUpl"
					onchange="fileSelectd()" style="display: none;" />
			<div class="ibox">
				<!--  <foreach name= "list" item = "vo">-->
				<!--循环取出-->
				<div class="ibox-content">
					<div style="text-align: center; padding-top: 0px;">
						<form class="form-horizontal" role="form" id="form" method="post" action="saveArticle.do" onsubmit="return checkSubmit()">
							<input type="hidden" value="${userName }" name="userName"/>
							
							<div class="form-group">
								<label style="font-size: 18px">标题</label>
							</div>
							<div class="form-group ">
								<div class="col-sm-offset-1 col-sm-10">
									<input type="text" class="form-control" id="articleTitle" name="articleTitle"
										placeholder="最多30个字符" value="${articleTitle }">
								</div>
							</div>

							<div class="form-group">
								<label style="font-size: 18px">文章概要</label>
							</div>
							<div class="form-group ">
								<div class="col-sm-offset-1 col-sm-10">
									<input type="text" class="form-control" id="articleSummary" 
										name="articleSummary" value="${articleSummary }" placeholder="最多一百个字符，不填则在正文截取一百个字符">
								</div>
							</div>

							<!-- <div class="form-group">
								<label style="font-size: 18px">文章标签</label>
							</div>
							<div class="form-group ">
								<div class="col-sm-offset-1 col-sm-10">
									<input type="text" class="form-control" id="tag" name="tag"
										placeholder="多个标签用之间用‘,’分割，最多4个">
								</div>
							</div> -->

							<div class="form-group">
								<label style="font-size: 18px">文章分类</label>
							</div>
							<div class="form-group ">
								<div class="col-sm-offset-1 col-sm-10">
									<div class="radio" align="left">
										<!-- <label> <input type="radio" value="" name="type"
											id="math"> 数学世界&nbsp;&nbsp;
										</label> <label> <input type="radio" value="" name="type"
											id="internet"> 移动开发&nbsp;&nbsp;
										</label> <label> <input type="radio" value="" name="type"
											id="hardware"> 硬件设计&nbsp;&nbsp;
										</label> <label> <input type="radio" value="" name="type"
											id="math"> 编程语言&nbsp;&nbsp;
										</label> <label> <input type="radio" value="" name="type"
											id="math"> 运营管理&nbsp;&nbsp;
										</label> <label> <input type="radio" value="" name="type"
											id="math" checked> 其他
										</label> -->
										<c:if test="${types != null }">
											<c:forEach items="${types }" var="type">
												<label> <input type="radio" value="${type.id }" name="typeId" <c:if test="${type.id == typeId }">checked</c:if>
											id="typeId">${type.typeName }&nbsp;&nbsp;</label>
											</c:forEach>
										</c:if>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label style="font-size: 18px">文章正文</label>
							</div>
							<div align="left" class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<script id="container1" name="articleContent" type="text/plain"></script>
								</div>
							</div>
							
							<div class="form-group">
								<label style="font-size: 18px">图片展示</label>
							</div>
							<div class="form-group ">
								<input type="text"  <c:if test="${showImage == null }">value="/whatblog/img/logo.png"</c:if>
									<c:if test="${showImage != null }">value="${showImage }"</c:if>  
									id="showImage" name="showImage" style="display: none;"/>
								<img alt="展示图片" src="/whatblog/img/logo.png" id="showimg" style="width: 120px;height: 120px;">
								<br><br>
								<a class="btn btn-primary" id="openFile" class="img">更换图片</a>
							</div>

							<div class="form-group">

								<div class="col-sm-offset-5 col-sm-4">
									<label for="radio" class="col-sm-3 control-labell">是否公开</label>
									<div style="padding-top: 0px;" class="radio col-sm-4">
										<c:if test="${articleType == 1 }">
											<label> <input type="radio" value="1" name="articleType"
											id="articleType" checked> 是
										</label> <label> <input type="radio" value="0" name="articleType"
											id="articleType"> 否
										</label>
										</c:if>
										<c:if test="${articleType == 0 }">
											<label> <input type="radio" value="1" name="articleType"
											id="articleType" > 是
										</label> <label> <input type="radio" value="0" name="articleType"
											id="articleType" checked> 否
										</label>
										</c:if>
										
									</div>

								</div>
							</div>
							<div class="form-group">
								<div class="">
									<a class="btn btn-default" href="#">取消</a>
									<button type="submit" id="submit" class="btn btn-info">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<br />
				<!--</foreach>-->
			</div>
		</div>
		<!-- 首页文章结束 -->
	</div>
	<!-- 正文结束 -->

	<div>
		<a href="javascript:;" class="gotop" style="display: block;"></a>
	</div>


	<script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/jquery-ui-1.10.4.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<!-- 手风琴菜单 -->
	<script
		src="<c:url value='/js/plugins/metisMenu/jquery.metisMenu.js'/>"></script>
	<!-- 滚动条 -->
	<script
		src="<c:url value='/js/plugins/slimscroll/jquery.slimscroll.min.js'/>"></script>
	<!-- 导航菜单 -->
	<script src="<c:url value='/js/inspinia.js'/>"></script>
	<!-- 进度条 -->
	<script src="<c:url value='/js/plugins/pace/pace.min.js'/>"></script>

	<script type="text/javascript"
		src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/ueditor/ueditor.all.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ajaxfileupload.js'/>"></script>
	<script src="<c:url value='/js/upload_img.js'/>"></script>
	<script src="<c:url value='/js/article_validata.js'/>"></script>


	<script type="text/javascript">
		var ue = UE.getEditor('container1', {
			toolbars : [ [ 'source', //源代码
			'undo', 'redo', 'bold', 'indent', //首行缩进
			'snapscreen', //截图
			'italic', //斜体
			'underline', //下划线
			'strikethrough', //删除线
			'subscript', //下标
			'fontborder', //字符边框
			'superscript', //上标
			'formatmatch', //格式刷
			'selectall', //全选
			'fontborder', //字符边框
			'superscript', //上标
			'formatmatch', //格式刷
			'blockquote', //引用
			'pasteplain', //纯文本粘贴模式
			'selectall', //全选
			'preview', //预览
			'horizontal', //分隔线
			'removeformat', //清除格式
			'time', //时间
			'date', //日期
			'unlink', //取消链接
			'deletetable', //删除表格
			'cleardoc', //清空文档
			'insertparagraphbeforetable', //"表格前插入行"
			'insertcode', //代码语言
			'justifyleft', //居左对齐
			'justifyright', //居右对齐
			'justifycenter', //居中对齐
			'fontfamily', //字体
			'fontsize', //字号
			'paragraph', //段落格式
			'simpleupload', //单图上传
			'insertimage', //多图上传
			'link', //超链接
			'emotion', //表情
			'searchreplace', //查询替换
			'justifyleft', //居左对齐
			'justifyright', //居右对齐
			'justifycenter', //居中对齐
			'justifyjustify', //两端对齐
			'forecolor', //字体颜色
			'insertorderedlist', //有序列表
			'insertunorderedlist', //无序列表
			'fullscreen', //全屏
			'rowspacingtop', //段前距
			'rowspacingbottom', //段后距
			'imagenone', //默认
			'imageleft', //左浮动
			'imageright', //右浮动
			'imagecenter', //居中
			'wordimage', //图片转存
			'lineheight', //行间距
			'edittip ', //编辑提示
			'autotypeset', //自动排版
			'touppercase', //字母大写
			'tolowercase', //字母小写
			'inserttable', //插入表格
			'drafts', // 从草稿箱加载
			'charts', // 图表
			'help' //帮助
			] ],
			autoHeightEnabled : true,
			autoFloatEnabled : true,
			allowDivTransToP : false,
			/* 设置高度 */
			initialFrameWidth : '100%' /* 设置宽度 *///占屏幕的一半
		});
		ue.setContent(${articleContent });
	</script>

	<script>
		var s_url = window.location.pathname;
		var now_url = '';
		for (var i = 0; i < $("#side-menu li").length; i++) {
			now_url = $("#side-menu li a").eq(i).attr("href");
			if (now_url == s_url) {
				$("#side-menu a").eq(i).parent().addClass("active");
				$("#side-menu a").eq(i).parent().parent().parent().addClass(
						"active");
				$("#side-menu a").eq(i).parent().parent().addClass("in");
			} else {
				$("#side-menu a").eq(i).parent().removeClass("active");
			}
		}
	</script>
	<!-- 返回顶部 -->
	<script>
		//返回顶部按钮
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
</body>
</html>