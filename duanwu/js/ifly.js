$(function(){
	myVid=$(".audio-1")[0];
	myVid.autoplay=true;
	//myVid.currentTime=3;
	myVid.loop=true;
	myVid.load();
	var times=0;
	$(".music").bind('touchend',function() {
		if(times%2==0){
			myVid.pause();
			$('.music').addClass('pause');
		}
		 if (times % 2 == 1) {
			myVid.play();
			$('.music').removeClass('pause');
		}
		times++;
	});
	
});

var myslider=new iSlider({
    wrap:'#wrap',
    item:'.item',
	loadingImgs:[
    '/audio/audio-1.mp3','/images/slider1-txt1.png','/images/slider1-txt2.png','/images/slider1-txt3.png','/images/slider1_bg.jpg','/images/slider1-img2.png','/images/slider1-img1.png'],
   onslide:function (index) {
        if (index == 5) {
			$(".slider").hide();
			 $(".btn-1").bind('tap',function() {
				$("#default-media").hide();
				$("#sub-info").show();
				return false;
			});
			$("#submitBtn").bind('tap',function() {
				$("#sub-info").hide();
				$("#sub-success").show();
				return false;
			});
			$(".btn-3").bind('tap',function() {
				$("#default-media").hide();
				$("#prize-mem").show();
				return false;
			});
			$("#reBack").bind('tap',function() {
				$("#default-media").show();
				$("#prize-mem").hide();
				return false;
			});
			$("#btn-share").bind('tap',function() {
				//$("#sub-success").hide();
				$(".share-model").show();
				return false;
			});
			$(".share-model").bind('tap',function() {
				$(this).fadeOut();
				
			});
        }
		else{$(".slider").show();}
    }
});
console.info(myslider)