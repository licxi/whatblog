/**
 * 评论相关
 */
$("#submitButton").on("click",function(){
	//alert("评论按钮被点击");
	//console.log($(this).parent());
	var articleId =$(this).parent().find('#articleId').val();
	//alert(articleId);
	doComment(articleId);
	
});
$("#allComments").on("click","button",function(){
	//alert("回复按钮被点击");
	var articleId =$(this).parent().find('#articleId').val();
	var toUserName =$(this).parent().find('#toUserName').val();
	var toCommentId =$(this).parent().find('#toCommentId').val();
	doComment(articleId,toUserName,toCommentId);
});


var url = window.location.pathname;
var root = url.substring(0,url.indexOf('/',1));

function post(url,param,successComment){
	jQuery.post(url,param,function(data){
		successComment(data);
	},'json').error(function(){
		alert("网络连接错误，请重试！");
	});
}
var CarticleId;
var CtoUserName;
var CtoCommentId;
function doComment(articleId,toUserName,toCommentId){
	if(toUserName == null && toCommentId==null){ //评论文章
		var commentContent = $("#commentContent");
		var url = root+"/comment/saveComment";
		if(commentContent.val().trim() == ""){
			alert("评论内容不能为空");
			return false;
		}
		var param = {articleId:articleId,content:commentContent.val().trim()};
		post(url,param,successComment);
	}else{ //回复评论
		CarticleId = articleId;
		CtoUserName = toUserName;
		CtoCommentId = toCommentId;
		$("#reply_comment").modal("show");
		//var param = {articleId:articleId,content:commentContent.val().trim(),toUserName:toUserName,toCommentId:toCommentId};
		//post(url,param,successReplyComment);
	}
	
}
function submitReplyComment(){
	var replyCommentContent = $("#replyCommentContent");
	var url = root+"/comment/saveComment";
	if(replyCommentContent.val().trim() == ""){
		alert("回复内容不能为空！");
	}
	$("#reply_comment").modal("hide");
	var param = {articleId:CarticleId,content:replyCommentContent.val().trim(),toUserName:CtoUserName,toCommentId:CtoCommentId};
	post(url,param,successReplyComment);
	
}

function successComment(data){
	if(data.errCode == '0'){
		addPComment(data);
		alert(data.msg);
	}else{
		alert(data.msg);
	}
}

/**
 * 添加一条对文章的评论
 * @returns
 */
function addPComment(data){
	var allComments = $("#allComments");
	var template = 
	'<div class="feed-element myshadow " id="pComment[comment.id]">'+
		'<div style="margin: 10px 10px 10px 10px;">'+
			'<a href="#" class="pull-left" style="margin-right: 10px;">'+
				'<img alt="image" class="img-circle" src="[comment.headUrl]"></a>'+
			'<div class="media-body">'+
			'<input type="hidden" value="[comment.articleId]" id="articleId">'+
			'<input type="hidden" value="[comment.userName]" id="toUserName">'+
			'<input type="hidden" value="[comment.i]" id="toCommentId">'+
				'<button class="btn btn-info pull-right" style="font-size: 12px;">回复</button>'+
				'<strong style="font-size: 15px;">'+
				'<a href="/'+root+'/show/blog/[comment.userName]"'+
					'target="_blank">[comment.nickname]</a></strong><br>'+
				'<small class="text-muted">'+
					'[comment.time]'+
				'</small>'+
		'<div class="well" style="font-size: 14px; margin-right: 50px;">[comment.content]</div>'+
		'<div class="pull-right">'+
			'</a>'+
		'</div>'+
	'</div>';
	if(data.data != null){
		comment = data.data;
		template = template.replace('[comment.id]',comment.id);
		template = template.replace('[comment.headUrl]',comment.headUrl);
		template = template.replace('[comment.userName]',comment.userName);
		template = template.replace('[comment.time]',comment.formatTime);
		template = template.replace('[comment.nickname]',comment.nickname);
		template = template.replace('[comment.content]',comment.content);
		template = $(template);
		allComments.prepend(template);
	}
}

//服务器返回数据成功
function successReplyComment(data){
	if(data.errCode == '0'){
		addCComment(data);
		alert(data.msg);
	}else{
		alert(data.msg);
	}
}

function addCComment(data){
	var cComment = $("#cComment"+CtoCommentId);
	var template = '<div class="feed-element" id="cComment[comment.id]"'+
						'style="margin-left: 50px; margin-right: 100px">'+
						'<a href="#" class="pull-left"><img alt="image"'+
							'class="img-circle" src="[comment.headUrl]"></a>'+
						'<div class="media-body ">'+
							'<small class="pull-right" style="font-size: 12px;"></small>'+
							'<strong style="font-size: 15px;">'+
								'<a href="/'+root+'/show/blog/[comment.userName]"'+
										'target="_blank">[comment.nickname]'+
								'</a>'+
							'</strong><br>'+
							'<small class="text-muted">[comment.time]</small>'+
							'<div class="well" style="font-size: 14px;">[comment.content]</div>'+
							'<div class="pull-right">'+
							'</a>'+
							'</div>'+
						'</div>'+
				'</div>';
	if(data.data != null){
		comment = data.data;
		template = template.replace('[comment.id]',comment.id);
		template = template.replace('[comment.headUrl]',comment.headUrl);
		template = template.replace('[comment.userName]',comment.userName);
		template = template.replace('[comment.time]',comment.formatTime);
		template = template.replace('[comment.nickname]',comment.nickname);
		template = template.replace('[comment.content]',comment.content);
		template = $(template);
		cComment.prepend(template);
	}
}