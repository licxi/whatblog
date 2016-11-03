$(function(){
	
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		document.title="用户注册";
		});
	$('#switch_login').click(function(){
		
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
		document.title="用户登录";
		});
if(getParam("a")=='0')
{
	$('#switch_login').trigger('click');
}

	});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}

function checkUserName(){
    var userName = $("#userName");
    if ( userName.val() == "") { //判断学号是否为空或者空格？
      $('#userCue').html("<font color='red'><b>用户名不能空</b></font>");
      $("#reg_password").attr("readOnly",false);
      $("#reg_repassword").attr("readOnly",false);
      $("#qq").attr("readOnly",false);
      $("#nickname").attr("readOnly",false);
      $('#reg').attr("disabled",false);
      return false;
    } else if (userName.val().length<8 || userName.val().length>16){
    	$('#userCue').html("<font color='red'><b>只能是8到16位的账号</b></font>");
    	$("#reg_password").attr("readOnly",true);
        $("#reg_repassword").attr("readOnly",true);
        $("#qq").attr("readOnly",true);
        $("#nickname").attr("readOnly",true);
        $('#reg').attr("disabled",true);
    	return false;
    }else{
    	 $('#userCue').text("");
    }
    /*检查账号是否已经注册*/
     var url = "checkUserName";
     jQuery.post(url,{"userName" : userName.val()},
            function(data) {
              if (data.code == 'ok') {
                $("#userCue").css("color","blue");
                $("#userCue").text("可以注册");
                $("#reg_password").attr("readOnly",false);
                $("#reg_repassword").attr("readOnly",false);
                $("#qq").attr("readOnly",false);
                $("#nickname").attr("readOnly",false);
                $('#reg').attr("disabled",false);
              } else {
                $("#userCue").css("color","red");
                $("#userCue").text("已被注册！不可以注册");
                $("#reg_password").attr("readOnly",true);
                $("#reg_repassword").attr("readOnly",true);
                $("#qq").attr("readOnly",true);
                $("#nickname").attr("readOnly",true);
                $('#reg').attr("disabled",true);
              }
            }, 'json').error(function() {
              alert("网络连接错误，请稍后再试");
        }); 

  }

function checkPassword() {
    var pw1 = $("#reg_password").val();
    var pw2 = $("#reg_repassword").val();
    if(pw1.length<6 || pw1.length>16){
      $("#userCue").text("");
    }else{
    	$("#userCue").css("color","red");
        $("#userCue").text("请输入6到16位的密码");
    }
    if (pw1 == pw2) {
      $("#userCue").css("color","green");
      $("#userCue").text("两次密码相同");
      //$("submit").disabled = false;
      $('#reg').attr("disabled",false);
    } else {
      $("#userCue").css("color","red");
      $("#userCue").text("两次密码不相同");
      //$("submit").disabled = true;
      $('#reg').attr("disabled",true);
    }
  }

function refalsh_code(){
	var captcha_img = $('#vc') 
	var verifyimg = captcha_img.attr("src");  
	captcha_img.attr('title', '点击刷新');  
	captcha_img.attr("src", verifyimg.replace(/\?.*$/,'')+'?'+Math.random());   
}



//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  


var reMethod = "GET";
var	pwdmin = 6;
var loginUrl = "doLogin"

$(document).ready(function() {

	$("#login").click(function(){
		var username = $("#username");
		var password = $("#password");
		if(username.val() == ""){
			alert("用户名不能为空");
			username.focus();
			return false;
		}
		if(password.val() == ""){
			alert("密码不能为空");
			password.focus();
			return false;
		}
		jQuery.post(loginUrl, {
			username : username.val(),
			password : password.val()
		}, function(data) {
			if (data.code == 'ok') {
				 //alert('登录成功！');
				window.location.href = data.callback;
			} else {
				alert(data.msg);
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试");
		});
	});
	
	$('#reg').click(function() {
		var userNmae = $('#userName');
		var password = $("#reg_password");
		var repassword = $("#reg_repassword");
		var nickname = $("#nickname");
		if (userNmae.val() == "") {
			userNmae.focus();
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}

		if (userNmae.val().length < 8 || userNmae.val().length > 16) {

			userNmae.focus();
			$('#userCue').html("<font color='red'><b>×用户名只能8-16字符</b></font>");
			return false;

		}
		if (password.val().length < pwdmin) {
			password.focus();
			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
			$('#reg').attr("disabled",true);
			return false;
		}
		if (password.val() != repassword.val()) {
			repassword.focus();
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			$('#reg').attr("disabled",true);
			return false;
		}

		/*var sqq = /^[1-9]{1}[0-9]{4,9}$/;
		if (!sqq.test($('#qq').val()) || $('#qq').val().length < 5 || $('#qq').val().length > 12) {
			$('#qq').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×QQ号码格式不正确</b></font>");
			return false;
		} else {
			$('#qq').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
			
		}*/
		var vc = "../util/vc";
		jQuery.post(vc, {
			vc : $("#reg_vc").val()
		}, function(data) {
			if (data.msg == 'ok') {
				$('#regUser').submit();
				//window.location.href = msg.callback;
			} else {
				alert("验证码输入错误！");
				refalsh_code();
				$("#reg_vc").val("");
				$("#vc").focus();
				return false;
			}
		}, 'json').error(function() {
			alert("网络连接错误，请稍后再试");
		});

		
	});
	

});