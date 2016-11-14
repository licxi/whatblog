function login() {
	if(event.keyCode == 13){
		$("#login").click();
	}
}

$(document).ready(function() {
	$("#login").click(function(){
		var adminAccount = $("#adminAccount");
		var adminPassword = $("#adminPassword");
		if(adminAccount.val() == ""){
			alert("用户名不能为空");
			adminAccount.focus();
			return false;
		}
		if(adminPassword.val() == ""){
			alert("密码不能为空");
			adminPassword.focus();
			return false;
		}
		jQuery.post("login", {
			'adminAccount' : adminAccount.val(),
			'adminPassword' : $.md5(adminPassword.val())
		}, function(data) {
			if (data.errCode == '0') {
				 //alert('登录成功！');
				//alert(data.callback);
				window.location.href = data.callback;
			} else {
				alert(data.msg);
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试");
		});
	});
});