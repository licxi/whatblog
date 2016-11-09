var s_url = window.location.pathname;
var now_url = '';
for (var i = 0; i < $("#side-menu li").length; i++) {
	now_url = $("#side-menu li a").eq(i).attr("href");
	if (now_url == s_url) {
		$("#side-menu a").eq(i).parent().addClass("active");
		$("#side-menu a").eq(i).parent().parent().parent().addClass("active");
		$("#side-menu a").eq(i).parent().parent().addClass("in");
	} else {
		$("#side-menu a").eq(i).parent().removeClass("active");
	}
}
