function cancelAttention(id) {
	var url = "cancelAttention";
	if (confirm("确定取消关注吗？")) {
		jQuery.post(url, {
			"id" : id
		}, function(data) {
			if (data.errCode == '0') {
				$("#att" + id).remove();
				alert(data.msg);
			} else {
				alert(data.msg);
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试");
		});
	}
}