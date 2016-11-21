<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="indexs.aspx.cs" Inherits="Feiyang.Mobile.Web._2016HD.indexs" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>旅行，去吧！ ——7·8飞扬旅游年中大促</title>
<meta name="keywords" content="宁波飞扬旅行社,宁波旅行社,宁波旅游网" />
<meta name="description" content="飞扬旅游网隶属于浙江飞扬国际旅游集团,宁波旅行社行业第一,全国第八,浙江省首批五星级旅行社,宁波市最佳旅行社.服务热线:4000-365-666" />
<meta name="apple-mobile-web-app-title" content="飞扬旅游网" />
<link rel="stylesheet" type="text/css" href="img/style.css">
<script src="../jquery.mobile/jquery-1.10.2.min.js"></script>
<script src="js/jquery-1.8.3.min.js"></script> 
</head>
<body>
 <script language="javascript" type="text/javascript">
 var ct='2016-7-8 14:00:00';
 var lc;
function c(a, b, time) {
	//if(cl) clearTimeout(cl);
	if(!lc){
		ct=time;
		lc=setTimeout('add_time("'+time+'")',200);
	}else{
		ct=time;
	}
	Show_TabADSMenuold(a,b);
 }
//<![CDATA[
function Show_TabADSMenuold(tabadid_numold, tabadnumold) {
		for (var i = 1; i < 6; i++) { 
			var d=document.getElementById("tabadmenuold_" + tabadid_numold + i);
			if(d) d.className = ""; 
		}
		for (var i = 1; i < 6; i++) { 
			var d=document.getElementById("tabadcontentold_" + tabadid_numold + i);
			if(d) d.style.display = "none";
		}
		document.getElementById("tabadmenuold_" + tabadid_numold + tabadnumold).className = "TasADSOn";
		document.getElementById("tabadcontentold_" + tabadid_numold + tabadnumold).style.display = "block";
		
}
//]]>
</script>
    <script type="text/javascript">
        $(function () {
    var ts = parseInt(document.getElementById("timeSapn").value, 10)//剩余的毫秒数 
    if (ts > 0) {
        timer();
    } else {
        document.getElementById("myTime").innerHTML = "";
    }
    var ts1 = parseInt(document.getElementById("timeSapn1").value, 10)//剩余的毫秒数 
    if (ts1 > 0) {
        timer1();
    } else {
        document.getElementById("myTime1").innerHTML = "";
    }
    var ts2 = parseInt(document.getElementById("timeSapn2").value, 10)//剩余的毫秒数 
    if (ts2 > 0) {
        timer2();
    } else {
        document.getElementById("myTime2").innerHTML = "";
    }
    var ts3 = parseInt(document.getElementById("timeSapn3").value, 10)//剩余的毫秒数 
    if (ts3 > 0) {
        timer3();
    } else {
        document.getElementById("myTime3").innerHTML = "";
    }
    var ts4 = parseInt(document.getElementById("timeSapn4").value, 10)//剩余的毫秒数 
    if (ts4 > 0) {
        timer4();
    } else {
        document.getElementById("myTime4").innerHTML = "";
    }

    c(0, <%=imsnew%>, '2016-7-8 12:00:00');
})


var maxScrollTop = $(".tabMenu").offset().top;
$(window).scroll(maxScrollTop, function (event) {
    var $me = $(this);
    if ($me.scrollTop() > event.data) {
        $(".tabMenu").css({ position: "fixed", left: "0", top: "0" });
    }
    else { $(".tabMenu").css({ position: "relative" }); }
});


function timer() {
    var ts = parseInt(document.getElementById("timeSapn").value, 10)//剩余的毫秒数  
    if (ts > 0) {
        var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
        var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数  
        var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数  
        var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数  
        dd = checkTime(dd);
        hh = checkTime(hh);
        mm = checkTime(mm);
        ss = checkTime(ss);
        document.getElementById("myTime").innerHTML = 
            //"距开始：<span class=\"ft\">" + dd + "天</span><span class=\"num\">" + hh + "</span>：<span class=\"num\">" + mm + "</span>：<span class=\"num\">" + ss + "</span>";
           "<li style=\"width:55px;\">&nbsp;&nbsp;<span>倒计时</span></li>"
	      +"<li style=\" \" id=\"time_d\">"+dd+"</li>"
		  +"<li style=\"width:14px;\" id=\"time_d_u\"><span>天</span></li>"
		  +"<li style=\" \" id=\"time_h\">"+hh+"</li>"
		  +"<li style=\"width:14px;\" id=\"time_h_u\"><span>时</span></li>"
		  +"<li style=\" \" id=\"time_m\">"+mm+"</li>"
	      +"<li style=\"width:14px;\" id=\"time_m_u\"><span>分</span></li>"
	      +"<li style=\" \" id=\"time_s\">"+ss+"</li>"
		  + "<li style=\"width:14px;\" id=\"time_s_u\"><span>秒</span></li> ";

        ts = ts - 1000;
        document.getElementById("timeSapn").value = ts;
        setTimeout(timer, 1000);
    }
    else {
        location.reload();
        //getMs();
    }
}
function timer1() {
    var ts = parseInt(document.getElementById("timeSapn1").value, 10)//剩余的毫秒数  
    if (ts > 0) {
        var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
        var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数  
        var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数  
        var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数  
        dd = checkTime(dd);
        hh = checkTime(hh);
        mm = checkTime(mm);
        ss = checkTime(ss);

        document.getElementById("myTime1").innerHTML =
          "<li style=\"width:55px;\">&nbsp;&nbsp;<span>倒计时</span></li>"
         + "<li style=\" \" id=\"time_d\">" + dd + "</li>"
         + "<li style=\"width:14px;\" id=\"time_d_u\"><span>天</span></li>"
         + "<li style=\" \" id=\"time_h\">" + hh + "</li>"
         + "<li style=\"width:14px;\" id=\"time_h_u\"><span>时</span></li>"
         + "<li style=\" \" id=\"time_m\">" + mm + "</li>"
         + "<li style=\"width:14px;\" id=\"time_m_u\"><span>分</span></li>"
         + "<li style=\" \" id=\"time_s\">" + ss + "</li>"
         + "<li style=\"width:14px;\" id=\"time_s_u\"><span>秒</span></li> ";
        ts = ts - 1000;
        document.getElementById("timeSapn1").value = ts;
        setTimeout(timer1, 1000);
    }
    else {
        location.reload();
        //getMs();
    }
}
function timer2() {
    var ts = parseInt(document.getElementById("timeSapn2").value, 10)//剩余的毫秒数  
    if (ts > 0) {
        var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
        var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数  
        var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数  
        var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数  
        dd = checkTime(dd);
        hh = checkTime(hh);
        mm = checkTime(mm);
        ss = checkTime(ss);

        document.getElementById("myTime2").innerHTML =
          "<li style=\"width:55px;\">&nbsp;&nbsp;<span>倒计时</span></li>"
         + "<li style=\" \" id=\"time_d\">" + dd + "</li>"
         + "<li style=\"width:14px;\" id=\"time_d_u\"><span>天</span></li>"
         + "<li style=\" \" id=\"time_h\">" + hh + "</li>"
         + "<li style=\"width:14px;\" id=\"time_h_u\"><span>时</span></li>"
         + "<li style=\" \" id=\"time_m\">" + mm + "</li>"
         + "<li style=\"width:14px;\" id=\"time_m_u\"><span>分</span></li>"
         + "<li style=\" \" id=\"time_s\">" + ss + "</li>"
         + "<li style=\"width:14px;\" id=\"time_s_u\"><span>秒</span></li> ";
        ts = ts - 1000;
        document.getElementById("timeSapn2").value = ts;
        setTimeout(timer2, 1000);
    }
    else {
        location.reload();
        //getMs();
    }
}
function timer3() {
    var ts = parseInt(document.getElementById("timeSapn3").value, 10)//剩余的毫秒数  
    if (ts > 0) {
        var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
        var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数  
        var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数  
        var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数  
        dd = checkTime(dd);
        hh = checkTime(hh);
        mm = checkTime(mm);
        ss = checkTime(ss);

        document.getElementById("myTime3").innerHTML =
          "<li style=\"width:55px;\">&nbsp;&nbsp;<span>倒计时</span></li>"
         + "<li style=\" \" id=\"time_d\">" + dd + "</li>"
         + "<li style=\"width:14px;\" id=\"time_d_u\"><span>天</span></li>"
         + "<li style=\" \" id=\"time_h\">" + hh + "</li>"
         + "<li style=\"width:14px;\" id=\"time_h_u\"><span>时</span></li>"
         + "<li style=\" \" id=\"time_m\">" + mm + "</li>"
         + "<li style=\"width:14px;\" id=\"time_m_u\"><span>分</span></li>"
         + "<li style=\" \" id=\"time_s\">" + ss + "</li>"
         + "<li style=\"width:14px;\" id=\"time_s_u\"><span>秒</span></li> ";
        ts = ts - 1000;
        document.getElementById("timeSapn3").value = ts;
        setTimeout(timer3, 1000);
    }
    else {
        location.reload();
        //getMs();
    }
}
function timer4() {
    var ts = parseInt(document.getElementById("timeSapn4").value, 10)//剩余的毫秒数  
    if (ts > 0) {
        var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
        var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数  
        var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数  
        var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数  
        dd = checkTime(dd);
        hh = checkTime(hh);
        mm = checkTime(mm);
        ss = checkTime(ss);

        document.getElementById("myTime4").innerHTML =
          "<li style=\"width:55px;\">&nbsp;&nbsp;<span>倒计时</span></li>"
         + "<li style=\" \" id=\"time_d\">" + dd + "</li>"
         + "<li style=\"width:14px;\" id=\"time_d_u\"><span>天</span></li>"
         + "<li style=\" \" id=\"time_h\">" + hh + "</li>"
         + "<li style=\"width:14px;\" id=\"time_h_u\"><span>时</span></li>"
         + "<li style=\" \" id=\"time_m\">" + mm + "</li>"
         + "<li style=\"width:14px;\" id=\"time_m_u\"><span>分</span></li>"
         + "<li style=\" \" id=\"time_s\">" + ss + "</li>"
         + "<li style=\"width:14px;\" id=\"time_s_u\"><span>秒</span></li> ";
        ts = ts - 1000;
        document.getElementById("timeSapn4").value = ts;
        setTimeout(timer4, 1000);
    }
    else {
        location.reload();
        //getMs();
    }
}
function checkTime(i) {

    if (i < 10) {
        i = "<b>0</b><b>" + i + "</b>";
    }
    else {
        i = "<b>" + parseInt(i / 10, 10) + "</b><b>" + parseInt(i % 10, 10) + "</b>";
    }
    return i;
}

</script>
    <input type="hidden" id="timeSapn" value="<%=(Convert.ToDateTime(msst1)-Convert.ToDateTime(dtes)).TotalMilliseconds %>" />
     <input type="hidden" id="timeSapn1" value="<%=(Convert.ToDateTime(msst2)-DateTime.Now).TotalMilliseconds %>" />
     <input type="hidden" id="timeSapn2" value="<%=(Convert.ToDateTime(msst3)-DateTime.Now).TotalMilliseconds %>" />
     <input type="hidden" id="timeSapn3" value="<%=(Convert.ToDateTime(msst4)-DateTime.Now).TotalMilliseconds %>" />
     <input type="hidden" id="timeSapn4" value="<%=(Convert.ToDateTime(msst5)-DateTime.Now).TotalMilliseconds %>" />
<div class="layout_78"><img src="img/top_b.jpg" style="width:100%"></div> 
    <div class="top1_miaosha layout_78" style=" padding-bottom:15px;">
				<div class="djj" style="padding:0"><p class="ms"></p><p>抢购时间：7月8日09:07:08-22:37:08<span>
今日秒杀，拼手速，拼人品！以付款时间为准，下单30分钟不付款，自动取消订单。</span></p></div>
			   <div class="time">  
			        <div class="TabADS">
					    <ul>
						     <li class="TasADSOn" id="tabadmenuold_01" onClick="c('0','1','2016-7-8 9:00:00')"  ><p class="times">09:07</p><p class="text"><%=msstat1 %></p> </li>
                             <li id="tabadmenuold_02" onClick="c(0,2,'2016-7-8 12:00:00')"><p class="times">12:07</p><p class="text"><%=msstat2 %></p> </li>
							 <li id="tabadmenuold_03" onClick="c(0,3,'2016-7-8 14:00:00')">
							   <p class="times">16:07</p>
							   <p class="text" ><%=msstat3 %></p> </li><!--style="抢购结束 抢购结束 background:#8d0060;" style="color:#ffe11f"-->
			                 <li id="tabadmenuold_04" onClick="c(0,4,'2016-7-8 16:00:00')"><p class="times">19:07</p><p class="text"><%=msstat4 %></p> </li>
			                 <li id="tabadmenuold_05" onClick="c(0,5,'2016-7-8 22:00:00')"><p class="times">22:07</p><p class="text"><%=msstat5 %></p> </li>
						</ul>
					</div>
					
					<div id="tabadcontentold_01" class="group_list_all" style="display:block">  
					<div  class="group_list_all">
					    <ul class="hd_time">
						    <li style="width:122px;">&nbsp;&nbsp;<em>2016</em>年<em>7</em>月<em>8</em>日</li>
						    <li style="width:156px;"><em>9</em>时<em>07</em>分<em>08</em>秒</li>
						</ul>
						<ul class="hd_time" id="myTime">
			
					    </ul>
					</div>
					   <div class="tabboy">
							<%=webstr %>

						</div>
					</div>
					<div id="tabadcontentold_02" class="group_list_all" style="display:none">  
					<div  class="group_list_all">
					    <ul class="hd_time">
						    <li style="width:122px;">&nbsp;&nbsp;<em>2016</em>年<em>7</em>月<em>8</em>日</li>
						    <li style="width:156px;"><em>12</em>时<em>07</em>分<em>08</em>秒</li>
						</ul>
						<ul class="hd_time" id="myTime1">
						  
					    </ul>
					</div>
					   <div class="tabboy">
							<%=webstr10 %>
						</div>
					</div>
					 <div id="tabadcontentold_03" class="group_list_all" style="display:none">  
					 <div  class="group_list_all">
					    <ul class="hd_time">
						    <li style="width:122px;">&nbsp;&nbsp;<em>2016</em>年<em>7</em>月<em>8</em>日</li>
						    <li style="width:156px;"><em>16</em>时<em>07</em>分<em>08</em>秒</li>
						</ul>
						<ul class="hd_time" id="myTime2">
						  
					    </ul>
					</div>
					   <div class="tabboy">
							<%=webstr11 %>
						</div>
					</div>
					<div id="tabadcontentold_04" class="group_list_all" style="display:none">  
					<div  class="group_list_all">
					    <ul class="hd_time">
						    <li style="width:122px;">&nbsp;&nbsp;<em>2016</em>年<em>7</em>月<em>8</em>日</li>
						    <li style="width:156px;"><em>19</em>时<em>07</em>分<em>08</em>秒</li>
						</ul>
						<ul class="hd_time" id="myTime3">
						   
					    </ul>
					</div>
					   <div class="tabboy">
							<%=webstr12 %>
						</div>
					</div>
					<div id="tabadcontentold_05" class="group_list_all" style="display:none">  
					<div  class="group_list_all">
					    <ul class="hd_time">
						    <li style="width:122px;">&nbsp;&nbsp;<em>2016</em>年<em>7</em>月<em>8</em>日</li>
						    <li style="width:156px;"><em>22</em>时<em>07</em>分<em>08</em>秒</li>
						</ul>
						<ul class="hd_time" id="myTime4">
						  
					    </ul>
					</div>
					   <div class="tabboy">
							<%=webstr13 %>
						</div>
					</div>
					
			   </div>
</div>	     
 
 
 

<div class="tabboy" style=" background:#1C96D7; padding-bottom:15px;">
	<div class="layout_78">
		<div class="djj"><p class="jj"></p><p>抢购时间：7月8日09:07:08-22:07:08<span>
超值线路，特价抢购，先到先得！可直接网站下意向订单（无需付款），工作人员会及时和您电话确认，也可拨打4000-365-666进行预订</span></p></div>
		 <div style="overflow:hidden">
			
			<%=webstr1 %>
		</div>
	</div>
</div>
<div class="tabboy" style="background:#339933; padding-bottom:15px;"> 
	<div class="layout_78">
		<div class="djj"><p class="tg"></p><p>抢购时间：7月8日09:07:08-22:07:08<span>
8/9月线路任君挑选，清凉一夏！可直接网站下意向订单（无需付款），工作人员会及时和您电话确认，也可拨打4000-365-666进行预订</span></p></div>
		 <div style="overflow:hidden">
			<%=webstr2 %>
			
		</div>
		 
	</div>
</div>

<div class="tabboy" style="background:#663398; padding-bottom:15px;">
	<div class="layout_78">
		<div class="djj"><p class="zn"></p><p>抢购时间：7月8日09:07:08-22:07:08<span>
9、10月线路预售抢购！可直接网站下意向订单（无需付款），工作人员会及时和您电话确认，也可拨打4000-365-666进行预订</span></p></div>
		 
		 <div class="presell">
		  <ul>
              <%=webstr3 %>
		  </ul>
    </div>
	</div>
</div>

<div class="m_foot">
    <p>电话：4000-365-666/ 0574-27666666<br>
      Copyright © 浙江飞扬国际旅游集团股份有限公司<script src="http://s4.cnzz.com/stat.php?id=4072742&web_id=4072742" language="JavaScript"></script></p>
</div>
</body>
</html>
