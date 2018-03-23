$(function(){
 
	resize();
	$(window).resize(function(event) {
		resize();
	});



	$(".banner").each(function () {
	    if ($(this).find(".item").length > 2) {
	        var owl = $(this).owlCarousel({ items: 1, dots: false, nav: true, navText: ["<img src='/Public/static/jianzhu/img/cur1.png' />", "<img src='/Public/static/jianzhu/img/cur2.png' />"], loop: true, autoplay: true });
	        owl.on('changed.owl.carousel', function (event) {
	            owl.find(".animated").each(function () { $(this).removeClass($(this).attr("data-animation")); })
	            owl.find(".owl-item").eq(event.item.index).find(".animated").each(function () { $(this).addClass($(this).attr("data-animation")); });
	        });
	    }
	})
	$(".banner .owl-item").eq(2).find(".animated").each(function () {
	    $(this).addClass($(this).attr("data-animation"));
	})
	$(window).scroll(function () {
	    if ($(window).scrollTop() > 0) {
	        $(".header").addClass("fixed");
	    }
	    else { $(".header").removeClass("fixed"); }

	    $(".animated").each(function () {
	        if ($(this).offset().top - $(window).scrollTop() > $(window).height() - 80)
	        { } // $(this).removeClass($(this).attr("data-animation"));
	        else
	            $(this).addClass($(this).attr("data-animation"));
	    })
	})

	$(".page_owl").owlCarousel({
	    responsive: {
	        0: { items: 1 },
	        700: { items: 2 },
	        900: { items: 3 }
	    },


	    dots: false, nav: true, navText: ["<img src='/Public/static/jianzhu/img/cur3.png' />", "<img src='/Public/static/jianzhu/img/cur4.png' />"], margin: 10
	})

	$(".news_owl .item").hide().eq($(".news_lt ul li.on").index()).fadeIn();
	$(".cur_next").click(function () {
	    if ($(".news_lt ul li.on").index() == $(".news_lt ul li").length - 1) {
	        $(".news_lt ul li.on").removeClass("on");
	        $(".news_lt ul li").eq(0).addClass("on");
	    }
	    else
	        $(".news_lt ul li.on").removeClass("on").next().addClass("on");

	    $(".news_owl .item").hide().eq($(".news_lt ul li.on").index()).fadeIn();
	})
	$(".news_lt ul li").click(function () {
	    $(this).addClass("on").siblings().removeClass("on");
	    $(".news_owl .item").hide().eq($(".news_lt ul li.on").index()).fadeIn();
	})
	$(".ul_taggle li").click(function () {
	    $(this).addClass("on").siblings().removeClass("on");
	})

	$(".service_list li:odd").addClass("on");

	if ($(window).width() < 1024) {
	    $(".menu_wrap").click(function () {
	        $(".menu").stop().slideToggle();
	    })
	}


	$(".team_list ul").owlCarousel({
	    responsive: {
	        0: { items: 1 },
	        700: { items: 2 },
	        900: { items: 3 },
	        1000:{items:4}
	    },
	    dots: false, nav: true, navText: ["<img src='/Public/static/jianzhu/img/cur3.png' />", "<img src='/Public/static/jianzhu/img/cur4.png' />"], margin: 20
	})

});

/*main*/
//

function font() {


}


/*call*/
//
function resize(){
	var ht=$(window).height();
	 
} 