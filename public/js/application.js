$(document).ready(function() {

	// // Creating new list
	// $('#create_list').click(function(event) {
	// 	event.preventDefault();
	// 	var data = $(this).serialize();
	// 	$.ajax(
 //        {
 //          url: '/lists/new',
 //          type: 'POST',
 //          data: data
 //        }
	// });

	// Sticky Header
	$(window).scroll(function() {

	    if ($(window).scrollTop() > 30) {
	        $('.main_h').addClass('sticky');
	    } else {
	        $('.main_h').removeClass('sticky');
	    }
	});

	// Mobile Navigation
	$('.mobile-toggle').click(function() {
	    if ($('.main_h').hasClass('open-nav')) {
	        $('.main_h').removeClass('open-nav');
	    } else {
	        $('.main_h').addClass('open-nav');
	    }
	});

	$('.main_h li a').click(function() {
	    if ($('.main_h').hasClass('open-nav')) {
	        $('.navigation').removeClass('open-nav');
	        $('.main_h').removeClass('open-nav');
	    }
	});

	// navigation scroll
	$('nav a').click(function(event) {
	    var id = $(this).attr("href");
	    var offset = 70;
	    var target = $(id).offset().top - offset;
	    $('html, body').animate({
	        scrollTop: target
	    }, 500);
	    event.preventDefault();
	});

});
