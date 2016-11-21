touch.on('.ani_img', 'swiperight', function(ev) {
	$(this).addClass("handle");
	setTimeout(function() {
		$(".page1").hide();
		$(".page2").show();
	}, 500);
});

//pop
function showPop() {
	$(".modal-overlay,.popup").show();
	$(".popup").removeClass("small");
}
function closePop() {
	$(".modal-overlay,.popup,.page").hide();
}
$("#active-rule").click( function() {
	showPop();
	$("#ruler").show();
});
$("#jfBtn").click( function() {
	showPop();
	$("#jfb").show();
});

$(".btn-click").click( function() {
	showPop();
	$("#tp").show();
	$(".popup").addClass("small");
});