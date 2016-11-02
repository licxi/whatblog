var title = $("#articleTitle");
var articleSummary = $("#articleSummary");
var tag = $("#tag");
var type = $("#type");
var showImage = $("#showImage");
var content = $("#content");
var articleType = $("#articleType");
var ue = UE.getEditor('container1');
function checkSubmit(){
		if(title.val() == ""){
			alert("标题不能为空！");
			title.focus();
			return false;
		}
		if(articleSummary.val() == ""){
			alert("概要不能为空！");
			articleSummary.focus();
			return false;
		}
		/*if(tag.val() == ""){
			alert("标签不能为空！");
			tag.focus();
			return false;
		}*/
		if(ue.getContent() == ""){
			alert("正文不能为空！");
			content.focus();
			return false;
		}
		var typelist = $('input:radio[name="typeId"]:checked').val();
        if(typelist == null){
            alert("类型一定要选！");
            type.focus();
            return false;
         }
        return true;
	};