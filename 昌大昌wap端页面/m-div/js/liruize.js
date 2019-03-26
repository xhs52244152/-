$(function(){
	$("#indextab li").click(function(){
		var tindex=$("#indextab li").index(this);
		$("#indextab li").removeClass("active").eq(tindex).addClass("active");
		$(".indextab_conbox .indextab_con").hide().eq(tindex).show();
	})
	$(".questionlist_title").click(function(){
		if($(this).hasClass("questionlist_title_active")){
			$(this).removeClass("questionlist_title_active");
			$(this).next(".questionlist_con").hide();
		}else{
			$(this).addClass("questionlist_title_active");
			$(this).next(".questionlist_con").show();
		}
	})
	$(".jjchoose_title div").click(function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			$(".jjchoose_box .jjchoose_con").hide();
			$(".jjchoose_yy").hide();
		}else{
			var jindex=$(".jjchoose_title div").index(this);
			$(".jjchoose_yy").show();
			$(".jjchoose_title div").removeClass("active").eq(jindex).addClass("active");
			$(".jjchoose_box .jjchoose_con").hide().eq(jindex).show();
		}
	})
	$(".jjchoose_yy").click(function(){
		$(".jjchoose_title div").removeClass("active");
		$(".jjchoose_box .jjchoose_con").hide();
		$(".jjchoose_yy").hide();
	})
})
