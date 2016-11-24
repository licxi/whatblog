function onlyNum() {
    if(!(event.keyCode==46)&&!(event.keyCode==8)&&!(event.keyCode==37)&&!(event.keyCode==39))
    if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105)))
    event.returnValue=false;
}

/* 检查信息是否合法 */
function check_password() {
	var old_password = $("#old_password");
	var new_password = $("#new_password");
	var re_password = $("#re_password");
	if (old_password.val() == "") {
		alert("原始密码未填写");
		old_password.focus();
		return;
	}
	if (new_password.val() == "") {
		alert("新密码未填写");
		new_password.focus();
		return;
	}
	if (re_password.val() == "") {
		alert("确认密码未填写");
		re_password.focus();
		return;
	}

	if (new_password.val().length > 16 || new_password.val().length < 6) {
		alert("密码必须大于6位或小于16位");
		new_password.focus();
		return;
	}
	if (new_password.val() != re_password.val()) {
		alert("确认密码不一致");
		new_password.focus();
		return;
	}

	var url = "/whatblog/admin/checkPwd";
	jQuery.post(url, {
		old_password : old_password.val(),
	}, function(data) {
		if (data.errCode == '0') {
			var modify_url = "/whatblog/admin/modifyPwd";
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

// 修改用户状态
function modifyIsLock(id,userName) {
	var modifyType = $("#modifyType"+id);
	var isLock = $("#isLock"+id);
	var url = "modifyIsLock";
	var status = isLock.text().trim() == "正常"?"锁定":"正常";
	if (confirm("是否修改该用户状态修改为："+status)) {
		jQuery.post(url, {
			'userName' : userName
		}, function(data) {
			if (data.errCode == "0") {
				alert(data.msg);
				// 修改显示内容
				if (isLock.text().trim() == "正常") {
					isLock.text("锁定");
					isLock.removeClass("label-info");
					isLock.addClass("label-danger");
					modifyType.text("启用");
				}else {
					isLock.text("正常");
					isLock.removeClass("label-danger");
					isLock.addClass("label-info");
					modifyType.text("锁定");
				}
			} else {
				alert(data.msg);
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试！");
		});
	}
}

// 修改用户状态
function noLock(id,userName) {
	var total = $("#total");
	var url = "modifyIsLock";
	if (confirm("是否修改该用户状态修改为：正常")) {
		jQuery.post(url, {
			'userName' : userName
		}, function(data) {
			if (data.errCode == "0") {
				alert(data.msg);
				$("#user"+id).remove();
				total.text(total.text()-1);
			} else {
				alert(data.msg);
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试！");
		});
	}
}

// 删除用户
function deleteUser(id,userName,nickname) {
	var url = "deleteUser";
	if (confirm("确定删除用 "+userName+":"+nickname+"?")) {
		jQuery.post(url, {
			'userId' : id
		}, function(data) {
			if (data.errCode == "0") {
				alert(data.msg);
				$("#user"+id).remove();
			} else {
				alert(data.msg);
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试！");
		});
	}
}


// 修改文章是否置顶
function articleUp(id){
	var articleUp = $("#articleUp"+id);
	var articleUpTip = $("#articleUpTip"+id);
	var url="modifyArticleUp";
	var temp = articleUp.text().trim();
	if(confirm("是否将文章"+temp))　{
		jQuery.post(url,{
			'article_id':id
		},function(data){
			if(data.errCode == "0"){
				if(temp == "置顶" ){
					alert(data.msg);
					articleUp.text("取消置顶");
					articleUpTip.text("是");
					articleUpTip.removeClass("label-default");
					articleUpTip.addClass("label-info");
				}else if(temp == "取消置顶" ){
					alert(data.msg);
					articleUp.text("置顶");
					articleUpTip.text("否");
					articleUpTip.removeClass("label-info");
					articleUpTip.addClass("label-default");
				}
			}else{
				alert(data.msg);
			}
		},'json').error(function(){
			alert("网络连接错误，请稍后再试");
		});
	}
}


function articleLock(id){
	var articleLock = $("#articleLock"+id);
	var url = "modifyArticleLock";
	var articleLockTip = $("#articleLockTip"+id);
	var temp = articleLock.text().trim();
	if(confirm("是否将文章"+temp))　{
		jQuery.post(url,{
			'article_id':id
		},function(data){
			if(data.errCode == "0"){
				if(temp == "锁定" ){
					alert(data.msg);
					articleLock.text("解锁");
					articleLockTip.text("是");
					articleLockTip.removeClass("label-info");
					articleLockTip.addClass("label-danger");
				}else if(temp == "解锁" ){
					alert(data.msg);
					articleLock.text("锁定");
					articleLockTip.text("否");
					articleLockTip.removeClass("label-danger");
					articleLockTip.addClass("label-info");
				}
			}else{
				alert(data.msg);
			}
		},'json').error(function(){
			alert("网络连接错误，请稍后再试");
		});
	}
}

// 删除文章
function deleteArticle(id){
	var total = $("#total");
	var url = "deleteArticle";
	if(confirm("是否将文章删除?该操作不可恢复!"))　{
		jQuery.post(url,{
			'article_id':id
		},function(data){
			if(data.errCode == "0"){
				alert(data.msg);
				$("#article"+id).remove();
				total.text(total.text()-1);
			}else{
				alert(data.msg);
			}
		},'json').error(function(){
			alert("网络连接错误，请稍后再试");
		});
	}
}
// 删除分类
function deleteType(id){
	var total = $("#total");
	var url = "deleteType";
	if(confirm("是否将该分类删除?该操作不可恢复!"))　{
		jQuery.post(url,{
			'type_id':id
		},function(data){
			if(data.errCode == "0"){
				alert(data.msg);
				$("#type"+id).remove();
				total.text(total.text()-1);
			}else{
				alert(data.msg);
			}
		},'json').error(function(){
			alert("网络连接错误，请稍后再试");0
		});
	}
}
$("#addType").click(function() {
	var typeName = $("#typeName");
	var typeDesc = $("#typeDesc");
	var url = "addType";
	if(typeName.val().trim() == ""){
		alert("分类名不能为空");
		typeName.focus();
		return false;
	}
	jQuery.post(url,{
		'typeName':typeName.val().trim(),
		'typeDesc':typeDesc.val().trim()
	},function(data){
		if(data.errCode == "0"){
			alert(data.msg);
			location.href="typeManage";
		} else{
			alert(data.msg);
		}
	},'json').error(function(){
		alert("网络连接错误,请稍后再试");
	});
});

var typeId;
function modifyType(id,typeName,typeDesc){
	this.typeId = id;
	$("#modalTypeName").val(typeName);
	$("#modalTypeDesc").val(typeDesc);
	$("#modify_type").modal("show");
	
}
//提交修改分类
function submitModify(){
	var typeName = $("#modalTypeName");
	var typeDesc = $("#modalTypeDesc");
	if(typeName.val().trim() == ""){
		alert("分类名不能为空！");
		typeName.focus();
		return false;
	}
	$("#modify_type").modal("hide");
	var url="modifyType";
	jQuery.post(url,{
		'id':typeId,
		'typeName':typeName.val().trim(),
		'typeDesc':typeDesc.val().trim()
	},function(data){
		if(data.errCode == "0"){
			alert(data.msg);
			$("#typeName"+typeId).text(typeName.val().trim());
			$("#typeDesc"+typeId).text(typeDesc).val().trim();
		}else{
			alert(data.msg);
		}
	},'json').error(function(){
		alert("网络连接错误,请稍后再试");
	});
}

$("#submitModifySystemSetup").click(function(){
	var systemName = $("#systemName");
	var daily = $("#daily");
	var writeArticleMark = $("#writeArticleMark");
	var writeCommentMark = $("#writeCommentMark");
	var receiveCommentMark = $("#receiveCommentMark");
	if(systemName.val().trim() == ""){
		alert("网站名不能空");
		systemName.focus();
		return false;
	}
	if(writeArticleMark.val().trim()=="" || parseInt(writeArticleMark.val().trim()) < 0){
		alert("发表文章积分参数不合法，必须为大于或等于零的整数");
		writeArticleMark.focus();
		return false;
	}
	if(writeCommentMark.val().trim()=="" || parseInt(writeCommentMark.val().trim()) < 0){
		alert("发表评论积分参数不合法，必须为大于或等于零的整数");
		writeCommentMark.focus();
		return false;
	}
	if(receiveCommentMark.val().trim()=="" || parseInt(receiveCommentMark.val().trim()) < 0){
		alert("收到评论积分参数不合法，必须为大于或等于零的整数");
		receiveCommentMark.focus();
		return false;
	}
	var url = "modifySystemSetup";
	$.ajax({
        type:"post",
        url:url,
        data:JSON.stringify($("#systemSetup").serializeObject()),
        dataType:"json",
        contentType:"application/json",
        success:function(data){
            alert(data.msg);
        },
        error:function(){
        	alert("网络连接失败，请重试");
        }
    });
});

//删除评论
function deleteComment(commentId){
	var url="deleteComment";
	var data = {comment_id:commentId};
	if(confirm("是否删除该评论，删除后不可恢复")){
		jQuery.post(url,data,function(data){
			if(data.errCode == "0"){
				alert(data.msg);
				$("#comment"+commentId).remove();
				$("#total").text($("#total").text()-1);
			}else{
				alert(data.msg);
			}
		},'json').error(function(){
			alert("网络连接失败，请重试");
		});
	}
}
//删除评论
function deleteMessage(messageId){
	var url="deleteMessage";
	var data = {message_id:messageId};
	if(confirm("是否删除该留言，删除后不可恢复")){
		jQuery.post(url,data,function(data){
			if(data.errCode == "0"){
				alert(data.msg);
				$("#message"+messageId).remove();
				$("#total").text($("#total").text()-1);
			}else{
				alert(data.msg);
			}
		},'json').error(function(){
			alert("网络连接失败，请重试");
		});
	}
}
//删除建议
function deleteSuggest(suggestId){
	var url="deleteSuggest";
	var data = {suggest_id:suggestId};
	if(confirm("是否删除该建议，删除后不可恢复")){
		jQuery.post(url,data,function(data){
			if(data.errCode == "0"){
				alert(data.msg);
				$("#suggest"+suggestId).remove();
				$("#total").text($("#total").text()-1);
			}else{
				alert(data.msg);
			}
		},'json').error(function(){
			alert("网络连接失败，请重试");
		});
	}
}


//将表单数据转换成json对象
$.fn.serializeObject = function() {    
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o; 
};