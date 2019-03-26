$(document).ready(function(){
	$(".nav>ul>li").hover(function(){
		$(this).find("ul").show();
	},function(){
		$(this).find("ul").hide();
	})
	$('.inputtxt').each(function(){  
		var txt = $(this).val();
		$(this).focus(function(){
			if(txt === $(this).val()) $(this).val("");
		}).blur(function(){
			if($(this).val() == "") $(this).val(txt);
		});
	})
	$("#indextab01 a").hover(function(){
		var tindex=$("#indextab01 a").index(this);
		$("#indextab01 a").removeClass("active").eq(tindex).addClass("active");
		$("#indextab01_con .listtablebox").hide().eq(tindex).show();
	})

	$(".userhot_tab_top li").hover(function(){
		var tindex=$(".userhot_tab_top li").index(this);
		$(".userhot_tab_top li").removeClass("active").eq(tindex).addClass("active");
		$(".userhot_tab_bottom .userhot_tab_bottom_con").hide().eq(tindex).show();
	})
});
