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
	var old_password = $("#old_password");
    var new_password = $("#new_password");
    var re_password = $("#re_password");
    if(old_password.val() == ""){
      alert("原始密码未填写");
      old_password.focus();
      return;
    } if(new_password.val() == ""){
      alert("新密码未填写");
      new_password.focus();
      return;
    } 
    if(re_password.val() == ""){
    	alert("确认密码未填写");
        re_password.focus();
        return;
    }
    if(new_password.val().length>16 || new_password.val().length<6){
      alert("密码必须大于6位或小于16位");
      new_password.focus();
      return;
    } if(new_password.val() != re_password.val()){
    	alert("确认密码不一致");
    	new_password.focus();
        return;
    }
    
    var url = "/whatblog/user/checkPwd";
    jQuery.post(url, {
        old_password : old_password.val(),
      }, function(data) {
        if (data.errCode == '0') {
          var modify_url = "/whatblog/user/modifyPwd";
          jQuery.post(modify_url, {
        	  	old_password : old_password.val(),
                new_password : new_password.val()
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