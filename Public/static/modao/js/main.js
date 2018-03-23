$(function(){
 
	resize();
	$(window).resize(function(event) {
		resize();
	});
	$(".modal").bind("click", function (e) {
	    var target = $(e.target);
	    if (target.closest(".cont").length == 0) {
	        $(this).fadeOut();
	    }
	})

	$(".close").click(function () {
	    $(this).parents(".modal").stop().fadeOut();
	})
	$(".div_input input").focus(function () {
	    $(this).parents(".div_input").addClass("on");
	})
	$(".div_input input").blur(function () {
	    $(this).parents(".div_input").removeClass("on");
	})

	$(".tag_head ul li").click(function () {
	    $(this).addClass("on").siblings().removeClass("on");
	$(".tag_items .item").hide().eq($(this).index()).fadeIn();
	})


	$('.cjwt_list .web').click(function () {
	    $(this).toggleClass('in');
	    $(this).parent().find('.txt').stop().slideToggle();
	})


	$(".mainer_frm .frm1").height($(window).height() - $(".header").height());
	$(".h_tips li").click(function () {
	    $(this).addClass("on").siblings().removeClass("on")
	    $(".mainer_frm").removeClass("mainer_frm1").removeClass("mainer_frm2").removeClass("mainer_frm3").removeClass("mainer_frm4").removeClass("mainer_frm5");
	    $(".mainer_frm iframe").removeClass("frm1").removeClass("frm2").removeClass("frm3").removeClass("frm4").removeClass("frm5");
	    $(".mainer_frm").addClass("mainer_frm" + ($(this).index() + 1));
	    $(".mainer_frm iframe").addClass("frm" + ($(this).index() + 1));
	    $(".mainer_frm .frm1").height($(window).height() - $(".header").height());

	})
	$(".menu ul li .close").click(function () {
	    $(".header1").slideUp(500, function () {
	        $(".shenyinclick").slideDown();
	    });
	    $(".mainer_frm .frm1").height($(window).height() - $(".header").height());
	    
	})
	$(".shenyinclick").click(function () {
	    $(this).slideUp(500, function () {
	        $(".header1").slideDown();
	    })
	})

	$(".header>.wrap>.clear").click(function () {
	    $(".menu").stop().slideToggle();
        $(this).toggleClass("on")
	})

	$(".a_sc").click(function () {
	    var span = $(this).find("span");
	    span.removeClass("on")
	    $(this).toggleClass("on");
	    setTimeout(function () { span.addClass("on") }, 500);
	})

});

/*main*/
//

 


/*call*/
//
function resize(){
    var ht = $(window).height();
    if($(window).width()>920)
        $('.box_right').height($('.box_left').outerHeight());
    else
        $('.box_right').height("auto");
 

	//$("#frm").height($(window).height() - $(".header").height())
} 