/**
 * 
 */
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

// 修改用户状态
function modifyIsLock(id, userName) {
	var isLock = $("#modifyType" + id);
	var url = "/whatblog/admin/modifyIsLock";
	if (confirm("是否修改该用户状态修改为：" + isLock.text().trim())) {
		jQuery.post(url, {
			'userName' : userName
		}, function(data) {
			if (data.errCode == "0") {
				alert(data.msg);
				// 修改显示内容
				if (isLock.text().trim() == "启用") {
					isLock.text("锁定");
					isLock.removeClass("btn-info");
					isLock.addClass("btn-danger");
				} else {
					isLock.text("启用");
					isLock.removeClass("btn-danger");
					isLock.addClass("btn-info");
				}
			} else {
				alert(data.msg);
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试！");
		});
	}
}

//提交留言内容
function submit() {
	var content = $("#content");
	var toUser = $("#toUser");
	if (content.val().trim() == "") {
		alert("留言内容不能为空！");
		content.focus();
		return false;
	}
	if (toUser.val().trim() == "") {
		alert("你不能留言");
		return false;
	}
	var url = "/whatblog/main/replyMessage";
	jQuery.post(url, {
		toUser : toUser.val(),
		content : content.val().trim()
	}, function(data) {
		if (data.errCode == "0") {
			alert("留言成功");
			content.val("");
			$("#reply_message").modal("hide");
		} else if (data.errCode == "-1") {
			alert(data.msg);

		}
	}, 'json').error(function() {
		alert("网络连接失败，请重试");
	});
}
//关注用户
function attentionUser(userName){
	var url = "/whatblog/main/attentionUser";
	var attention = $("#attention");
	jQuery.post(url,{
		attentionUserName:userName.trim()
	},function(data){
		if(data.errCode=="0"){
			alert(data.msg);
			attention.text("已关注");
		}else{
			alert(data.msg);
		}
	},'json').error(function(){
		alert("网络连接失败，请重试！");
	});
}