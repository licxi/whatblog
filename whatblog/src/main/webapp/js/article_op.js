function dArticle(id) {
	var url = "deleteArticle.do";
	if (confirm("删除后不可恢复！确定删除该文章吗？")) {
		jQuery.post(url, {
			"article_id" : id
		}, function(data) {
			if (data.errcode == '0') {
				$("#content" + id).remove();
				alert("删除成功!");
			} else {
				alert("删除失败！");
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试");
		});
	}
}
// 在浏览文章时删除该文章，然后跳转到 管理文章页面
function deleteArticleInShowArticle(id) {
	var url = "deleteArticle.do";
	var callbackurl = "articleManage.do"
	if (confirm("删除后不可恢复！确定删除该文章吗？")) {
		jQuery.post(url, {
			"article_id" : id
		}, function(data) {
			if (data.errcode == '0') {
				alert("删除成功！跳转到管理文章页面");
				window.location.href = callbackurl;
			} else {
				alert("删除失败！请重试！");
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试");
		});
	}
}

function setIsPublic(article_id){
	var url = "setIsPublic.do";
	var isPublic = $("#isPublic");
	if(isPublic.text().trim()=="设为公开"){
	 	var tip = "执行该操作，文章将会公开？确定要继续吗？";
	} else{
		var tip = "执行该操作，文章只有你自己可以看了。确定要继续吗？";
	}
	if (confirm(tip)) {
		jQuery.post(url, {
			"id" : article_id
		}, function(data) {
			if (data.errcode == '0') {
				
				if(isPublic.text().trim() == "设为公开"){
					$("#isPublic").text("设为仅自己可看");
				}else{
					$("#isPublic").text("设为公开");
				}
				alert("更改成功");
			} else {
				alert("修改失败！请重试！");
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试");
		});
	}
}