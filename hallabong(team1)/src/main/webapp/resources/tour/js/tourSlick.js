/**
 * 스크롤 이미지
 */

$(document).ready(function(){
	$('.uploadResult > ul').slick({
		rows: 1,
		slidesToShow: 1,
		autoplay: true,
		arrows: false,
		dots: true,
		infinite: true,
		fade: true,
		autoplaySpeed: 6000,
		speed: 1500,
		adaptiveHeight: true,
		focusOnSelect: true,
		draggable:true
	});
});