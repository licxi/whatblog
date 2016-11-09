function check_suggest_content(){
	if($("#suggest_content").val()==""){
		$("#input_tip").text("内容不能为空");
		$("#submitSuggest").attr("disabled",true);
	}else{
		$("#input_tip").text("");
		$("#submitSuggest").attr("disabled",false);
	}
}
function submitSuggestContent(){
	var url = "saveSuggest";
	jQuery.post(url, {
		"content":$("#suggest_content").val()
	}, function(data) {
		if (data.errCode == '0') {
			alert(data.msg);
			$("#suggest").modal("hide");
		} else {
			alert(data.msg);
		}
	}, 'json').error(function() {
		alert("网络连接错误，请稍后再试");
	});
}
/*检查信息是否合法*/
function check_password() {
    var old_password = $("#old_password").val();
    var new_password = $("#new_password").val();
    if(old_password == ""){
      alert("旧密码未填写");
      $("#old_password").focus();
      return;
    } if(new_password == ""){
      alert("新密码未填写");
      $("#new_password").focus();
      return;
    } if(new_password.length>16 || new_password.length<6){
      alert("密码必须大于6位或小于16位");
      $("#new_password").focus();
      return;
    }
    
    var url = "/whatblog/user/checkPwd";
    jQuery.post(url, {
        old_password : old_password,
      }, function(data) {
        if (data.errCode == '0') {
          var modify_url = "/whatblog/user/modifyPwd";
          jQuery.post(modify_url, {
        	  	old_password : old_password,
                new_password : new_password
                }, function(data) {
                if (data.errCode == '0') {
                    alert(data.msg);
                    $("#modify_password").modal("hide");
                } else {
                    alert(data.msg);
                }
                }, 'json').error(function() {
                    alert("网络连接错误，请稍后再试");
          });
        } else {
          alert(data.msg);
          $("#old_password").focus();
        }
      }, 'json').error(function() {
        alert("网络连接错误，请稍后再试");
      });
}