$("#more").click( function() {
	$("#xianshi").show();
});

$("#ccc").click( function() {
	$(".tz").hide();
});

$("#gz").click( function() {
	$(".tz").show();
});

$("#gzz").click( function() {
	$(".tz").show();
});
//pop
function showPop() {
	$(".modal-overlay,.popup").show();
	$(".popup").removeClass("small");
}
showPop();
$("#ruler").show();

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