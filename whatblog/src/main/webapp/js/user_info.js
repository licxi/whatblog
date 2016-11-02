var nickname = $("#nickname");
var phone = $("#phone");
var email = $("#email");
var qq = $("#qq");
var address = $("#address");
var description = $("#description");
var school = $("#school");
var nickname_tip = $("#nickname_tip");
var phone_tip = $("#phone_tip");
var email_tip = $("#email_tip");
var qq_tip = $("#qq_tip");
var address_tip = $("#address_tip");
var description_tip = $("#description_tip");
var school_tip = $("#school_tip");
var man = $("#man");
var woman = $("#woman");
var modify_btn = $("#modify");
var submit_btn = $("#submit");
var cancel_btn = $("#cancel");
var head_img = $("#head_img");
var modify_head_tip = $("#modify_head_tip");
$(document).ready(function() {
	$("#modify").click(function() {
		nickname.attr("readOnly", false);
		phone.attr("readOnly", false);
		email.attr("readOnly", false);
		qq.attr("readOnly", false);
		address.attr("readOnly", false);
		description.attr("readOnly", false);
		school.attr("readOnly", false);
		man.attr("disabled", false);
		woman.attr("disabled", false);
		modify_btn.css("display", "none");
		cancel_btn.css("display", "inline-block");
		cancel_btn.css("position","static");
		submit_btn.css("display", "inline-block");
		submit_btn.css("position","static");
		modify_head_tip.css("display","block");
		

	});
	//点击头像时，选择头像
	$("#openFile").click(function() {
		//alert(modify_btn.css("display"));
		//if(modify_btn.css("display") == "none"){
			$("#imgUpl").click();
		//}
	});
});

function fileSelectd() {
	if($("#imgUpl").val().length > 0 && validata($("#imgUpl").val())) {
		ajaxFileUpload();
	} else {
		alert("请选择图片，支持'png,jpeg,jpg'格式");
	}
}

/**
 * 验证选择的文件否是jpg，png，jpeg格式的图片
 * @param fileName
 * @returns true 是，false 不是
 */
function validata(fileName) {
	//var reg = /^(\w{1,}\\.(jpg)|(png)|(jpeg))$/;
	//indexOf(".")
	var type = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length); /*获取文件的扩展名*/
	if(type == "jpg" || type == "png" || type == "jpeg") {
		return true;
	}
	return false;
}
/*
 * 上传图片，返回地址，用于图片显示
 * */
function ajaxFileUpload() {
	jQuery.ajaxFileUpload({
		url: "modifyHead.do",
		secureuri: false,
		fileElementId: "imgUpl",
		dataType: "json",
		success: function(data) {
			if(data.error == "0") {
				$("#openFile").attr("src", data.url);
				//$("#headUrl").val(data.url);
				$("#head_image").attr("src",data.url);
				
			} else {
				alert("上传失败");
			}
		},
		error: function(data, status, e) {
			alert(e);
		}
	});
	return false;
}

function check_phone(){
	var phoneReg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
	if(phone.val()==""){
		phone_tip.text("");
		submit_btn.attr("disabled",false);
		return true;
	}
	if(!phoneReg.test(phone.val())){
		phone_tip.text("手机格式不对喔，请重新输入");
		submit_btn.attr("disabled",true);
		return false;
	}else{
		phone_tip.text("");
		submit_btn.attr("disabled",false);
		return true;
	}
}

function check_email(){
	var emailReg = /^[a-zA-Z0-9\_\.\-]+@([a-zA-Z0-9]+\.)+([a-zA-Z0-9]{2,4})$/;
	if(email.val() == ""){
		email_tip.text("");
		submit_btn.attr("disabled",false);
		return true;
	}
	if(!emailReg.test(email.val())){
		email_tip.text("邮箱格式不对喔，请重新输入");
		submit_btn.attr("disabled",true);
		
		return false;
	}else{
		email_tip.text("");
		submit_btn.attr("disabled",false);
		return true;
	}
}
