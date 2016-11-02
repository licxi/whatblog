
$(document).ready(function() {
	//点击头像时，选择头像
	$("#openFile").click(function() {
		$("#imgUpl").click();
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
		url: "/whatblog/util/fileupload.do",
		secureuri: false,
		fileElementId: "imgUpl",
		dataType: "json",
		success: function(data) {
			if(data.error == "0") {
				$("#showimg").attr("src", data.url);
				$("#showImage").val(data.url);
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