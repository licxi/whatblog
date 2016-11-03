<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript"
		src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
	<script type="text/javascript" src="/whatblog/ueditor/ueditor.all.js"></script>
	
</head>
<body>
	<!-- 加载编辑器的容器 -->
	<form action="user/getUeditorContent" method="post">
		<script id="container" name="content" type="text/plain"></script>
		<input type="submit" value="提交">
	</form>
	
    
	
	<script type="text/javascript">
		var ue = UE.getEditor('container',{
			 toolbars: [
			            ['source', //源代码
			             'undo', 'redo', 'bold','indent', //首行缩进
			             'snapscreen', //截图
			             'italic', //斜体
			             'underline', //下划线
			             'strikethrough', //删除线
			             'subscript', //下标
			             'fontborder', //字符边框
			             'superscript', //上标
			             'formatmatch', //格式刷
			             'selectall', //全选
			             'fontborder',//字符边框
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
			             'inserttitle', //插入标题
			             'deletetable', //删除表格
			             'cleardoc', //清空文档
			             'insertparagraphbeforetable', //"表格前插入行"
			             'insertcode', //代码语言
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
			             'pagebreak', //分页
			             'insertframe', //插入Iframe
			             'imagenone', //默认
			             'imageleft', //左浮动
			             'imageright', //右浮动
			             'imagecenter', //居中
			             'wordimage', //图片转存
			             'lineheight', //行间距
			             'edittip ', //编辑提示
			             'customstyle', //自定义标题
			             'autotypeset', //自动排版
			             'touppercase', //字母大写
			             'tolowercase', //字母小写
			             'inserttable', //插入表格
			             'drafts', // 从草稿箱加载
			             'charts', // 图表
			             'help' //帮助
			        ]],
			        autoHeightEnabled: true,
			        autoFloatEnabled: true,
			        allowDivTransToP: false,
			        //initialFrameHeight:100, /* 设置高度 */
			        initialFrameWidth:'50%'/* 设置宽度 */ //占屏幕的一半
		});
		
	</script>
</body>
</html>