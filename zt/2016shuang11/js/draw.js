//画布
var canvas ;
var context;
//蒙版
var canvas_bak;
var context_bak;

var winH=$(window).height()-195;
//alert(winH);
$(".canvas-box").css({"height":winH});
var canvasWidth = $(".canvas-box").width();
var canvasHeight = winH;

var canvasTop;
var canvasLeft;

//画笔大小
var size = 3;
var color  = '#000000';

//画图形
var draw_graph = function(graphType,obj){	

	//把蒙版放于画板上面
	$("#canvas_bak").css("z-index",1);
	//先画在蒙版上 再复制到画布上
		
	chooseImg(obj);			
	var canDraw = false;	
	
	var startX;
	var startY;

	//鼠标按下获取 开始xy开始画图
	var mousedown = function(e){
		e.preventDefault();
		context.strokeStyle= color;
		context_bak.strokeStyle= color;
		context_bak.lineWidth = size;
		e=e||window.event;

		var touchA = e.touches[0]; //获取第一个触点
       var x1 = Number(touchA.clientX); //页面触点X坐标
       var y1 = Number(touchA.clientY); //页面触点Y坐标

		startX = x1- canvasLeft;
		startY = y1- canvasTop;
		context_bak.moveTo(startX ,startY );
		canDraw = true;			
		// alert(x1);
		// alert(startX);

		if(graphType == 'pencil'){
			context_bak.beginPath();
		}else if(graphType == 'circle'){
			context.beginPath();
			context.moveTo(startX ,startY );
			context.lineTo(startX +2 ,startY+2);
			context.stroke();	
			
		}else if(graphType == 'rubber'){							
			context.clearRect(startX - size * 10 ,  startY - size * 10 , size * 20 , size * 20);				
		}
		//alert(22);	
	};	

	//鼠标离开 把蒙版canvas的图片生成到canvas中
	var mouseup = function(e){
		e=e||window.event;
		canDraw = false;
		var image = new Image();

		var touchC = e.changedTouches[0]; //获取第一个触点
       var x3 = Number(touchC.clientX); //页面触点X坐标
       var y3 = Number(touchC.clientY); //页面触点Y坐标

		if(graphType!='rubber'){	
			
			image.src = canvas_bak.toDataURL();
			//alert(55);
			image.onload = function(){
				//alert(33);
				context.drawImage(image , 0 ,0 , image.width , image.height , 0 ,0 , canvasWidth , canvasHeight);
				clearContext();
				saveImageToAry();

			}

			// image.addEventListener('load',function(){
			// 	context.drawImage(image , 0 ,0 , image.width , image.height , 0 ,0 , canvasWidth , canvasHeight);
			// 	clearContext();
			// 	saveImageToAry();
			// },false);

			var x =x3   - canvasLeft;
			var y = y3  - canvasTop;	
			context.beginPath();
			context.moveTo(x ,y );
			context.lineTo(x +2 ,y+2);
			context.stroke();	
		}
	};

	//选择功能按钮 修改样式
	function chooseImg(obj){
		var imgAry  = $("#drawController img");
		for(var i=0;i<imgAry.length;i++){
			$(imgAry[i]).removeClass('border_choose');
			$(imgAry[i]).addClass('border_nochoose');				
		}
		$(obj).removeClass("border_nochoose");
		$(obj).addClass("border_choose");
	}

	// 鼠标移动
	var  mousemove = function(e){
		e=e||window.event;
		e.preventDefault();

		var touchB = e.touches[0]; //获取第一个触点
       var x2 = Number(touchB.clientX); //页面触点X坐标
       var y2 = Number(touchB.clientY); //页面触点Y坐标

		//alert(33);
		var x = x2   - canvasLeft;
		var y = y2  - canvasTop;	
		// alert(x2);
		// alert(x);
		//alert(e.clientX);
		//方块  4条直线搞定
		if(graphType == 'square'){
			if(canDraw){
				context_bak.beginPath();
				clearContext();
				context_bak.moveTo(startX , startY);						
				context_bak.lineTo(x  ,startY );
				context_bak.lineTo(x  ,y );
				context_bak.lineTo(startX  ,y );
				context_bak.lineTo(startX  ,startY );
				context_bak.stroke();
			}
		//直线
		}else if(graphType =='line'){						
			if(canDraw){
				context_bak.beginPath();
				clearContext();
				context_bak.moveTo(startX , startY);
				context_bak.lineTo(x  ,y );
				context_bak.stroke();
			}
		//画笔
		}else if(graphType == 'pencil'){
			if(canDraw){
				context_bak.lineTo(x2  - canvasLeft ,y2 - canvasTop);
				context_bak.stroke();						
			}
		//圆 未画得时候 出现一个小圆
		}else if(graphType == 'circle'){						
			clearContext();
			if(canDraw){
				context_bak.beginPath();			
				var radii = Math.sqrt((startX - x) *  (startX - x)  + (startY - y) * (startY - y));
				context_bak.arc(startX,startY,radii,0,Math.PI * 2,false);									
				context_bak.stroke();
			}else{	
				context_bak.beginPath();					
				context_bak.arc(x,y,20,0,Math.PI * 2,false);
				context_bak.stroke();
			}
		//涂鸦 未画得时候 出现一个小圆
		}else if(graphType == 'handwriting'){											
			if(canDraw){
				context_bak.beginPath();	
				context_bak.strokeStyle = color;
				context_bak.fillStyle  = color;
				context_bak.arc(x,y,size*10,0,Math.PI * 2,false);		
				context_bak.fill();
				context_bak.stroke();
				context_bak.restore();
			}else{	
				clearContext();
				context_bak.beginPath();					
				context_bak.fillStyle  = color;
				context_bak.arc(x,y,size*10,0,Math.PI * 2,false);
				context_bak.fill();
				context_bak.stroke();
			}
		//橡皮擦 不管有没有在画都出现小方块 按下鼠标 开始清空区域
		}else if(graphType == 'rubber'){	
			context_bak.lineWidth = 1;
			clearContext();
			context_bak.beginPath();			
			context_bak.strokeStyle =  '#000000';						
			context_bak.moveTo(x - size * 10 ,  y - size * 10 );						
			context_bak.lineTo(x + size * 10  , y - size * 10 );
			context_bak.lineTo(x + size * 10  , y + size * 10 );
			context_bak.lineTo(x - size * 10  , y + size * 10 );
			context_bak.lineTo(x - size * 10  , y - size * 10 );	
			context_bak.stroke();		
			if(canDraw){							
				context.clearRect(x - size * 10 ,  y - size * 10 , size * 20 , size * 20);
										
			}			
		}
	};


	//鼠标离开区域以外 除了涂鸦 都清空
	var mouseout = function(){
		if(graphType != 'handwriting'){
			clearContext();
		}
	}

	//canvas_bak.unbind();
	canvas_bak.addEventListener('touchstart',mousedown,false);
	canvas_bak.addEventListener('touchmove',mousemove,false);
	canvas_bak.addEventListener('touchend',mouseup,false);
	//canvas_bak.addEventListener('touchend',mouseout,false);
}






//清空层
var clearContext = function(type){
	if(!type){
		context_bak.clearRect(0,0,canvasWidth,canvasHeight);
	}else{
		context.clearRect(0,0,canvasWidth,canvasHeight);
		context_bak.clearRect(0,0,canvasWidth,canvasHeight);
	}
}

