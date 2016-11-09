function dArticle(id) {
	var url = "deleteArticle";
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
	var url = "deleteArticle";
	var callbackurl = "articleManage"
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

