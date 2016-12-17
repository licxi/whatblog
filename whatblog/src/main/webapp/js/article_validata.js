var title = $("#articleTitle");
var articleSummary = $("#articleSummary");
var tag = $("#tag");
var type = $("#type");
var showImage = $("#showImage");
var content = $("#content");
var articleType = $("#articleType");
var ue = UE.getEditor('container1');
var url = window.location.pathname;
var root = url.substring(0,url.lastIndexOf('/'));
function checkSubmit() {
	if (title.val() == "") {
		alert("标题不能为空！");
		title.focus();
		return false;
	}
	if (ue.getContent() == "") {
		alert("正文不能为空！");
		content.focus();
		return false;
	}
	var typelist = $('input:radio[name="typeId"]:checked').val();
	if (typelist == null) {
		alert("类型一定要选！");
		type.focus();
		return false;
	}
	if (articleSummary.val() == "") {
		/*
		 * alert("概要不能为空！"); articleSummary.focus(); return false;
		 */
		var content = ue.getContentTxt().trim();
		var length = content.length;
		var subLength = length > 100 ? 100 : length;
		articleSummary.val(content.substring(0, subLength));
	}
	 $.ajax({
         type:"post",
         url:"saveArticle",
         data:JSON.stringify($("#form").serializeObject()),
         dataType:"json",
         contentType:"application/json",
         success:function(data){
             //alert(data);
        	 if(data.errCode=="0"){
        		 alert(data.msg);
        		 window.location.href="articleManage";
        	 }else{
        		 alert(data.msg);
        	 }
         }
     });
	
}
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