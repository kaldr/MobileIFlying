<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WeChat.duanwu.index" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>这个重阳,换我牵起你的手</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=750,user-scalable=0" />
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/layout.css">
    <script type="text/javascript">
    var ua = navigator.userAgent.toLowerCase();
    if (ua.match(/MicroMessenger/i) == "micromessenger") {

    }
    else {
        window.location.href = "http://www.iflying.com/zt/weixin/authorize.php?state=m.iflying.com/duanwu/index.aspx";
    }
</script>
</head>

<body>
<div style='display:none;'>
<img src="images/share1.jpg"/>
</div>  
    <input type="hidden" id="myToken" value="<%=token %>" />
    <input type="hidden" id="myNick" value="<%=nick %>" />
    <input type="hidden" id="myHead" value="<%=headImg %>" />
<div class="wrap" id="wrap">
  <div class="item item-1">
    <div class="box">
      <div class="media-box"> <img class="ani txt1" src="images/slider1-txt1.png" alt=""> <img class="ani txt2" src="images/slider1-txt2.png" alt=""> <img class="ani txt3" src="images/slider1-txt3.png" alt=""> <img class="ani txt4" src="images/slider1-img2.png" alt=""> <img class="ani txt5" src="images/slider1-img1.png" alt=""> </div>
    </div>
  </div>
  <div class="item item-2">
    <div class="box">
      <div class="media-box"> <img class="ani txt1" src="images/slider2-txt1.png" alt=""> <img class="ani txt2" src="images/slider2-txt2.png" alt=""> <img class="ani txt3" src="images/slider2-txt3.png" alt=""> <img class="ani txt4" src="images/slider2-img1.png" alt=""> <img class="ani txt5" src="images/slider2-img2.png" alt=""> </div>
    </div>
  </div>
  <div class="item item-3">
    <div class="box">
      <div class="media-box"> <img class="ani txt1" src="images/slider3-txt1.png" alt=""> <img class="ani txt2" src="images/slider3-txt2.png" alt=""> <img class="ani txt3" src="images/slider3-txt3.png" alt="">
        <div style="position:relative;"><img class="ani txt4" src="images/slider3-img1.png" alt=""> <img class="ani txt5" style="opacity:0;" src="images/bing.png" alt=""> </div>
      </div>
    </div>
  </div>
  <div class="item item-4">
    <div class="box">
      <div class="media-box"> <img class="ani txt1" src="images/slider4-txt1.png" alt=""> <img class="ani txt2" src="images/slider4-txt2.png" alt=""> <img class="ani txt3" src="images/slider4-txt3.png" alt="">
        <div class="hand-row"> <img class="ani txt4" src="images/slider4-img1.png" alt=""> <img class="ani txt5" src="images/slider4-img2.png" alt=""> <img class="ani txt6" src="images/slider4-img3.png" alt=""> </div>
      </div>
    </div>
  </div>
  <div class="item item-5">
    <div class="box">
      <div class="media-box"> <img class="ani txt1" src="images/slider5-txt1.png" alt=""> <img class="ani txt2" src="images/slider5-txt2.png" alt=""> <img class="ani txt3" src="images/slider5-txt3.png" alt=""> <img class="ani txt4" src="images/slider5-txt4.png" alt=""> <img class="ani txt5" src="images/slider5-img1.png" alt=""> </div>
    </div>
  </div>
  <div class="item item-6">
    <div class="box">
      <div class="media-box" id="default-media"> <img class="ani txt1" src="images/slider6-txt1.png" alt=""> <img class="ani txt2" src="images/slider6-txt2.png" alt=""> <img class="ani txt3" src="images/slider6-txt3.png" alt=""> <img class="ani txt4" src="images/slider6-img1.png" alt="">
        <div class="action-row ani txt5"><a class="btn btn-1" href="javascript:;"><img src="images/btn1.png" alt=""></a><a class="btn btn-2" href="javascript:;"><img src="images/btn2.png" alt=""></a><br><a class="btn btn-3" href="javascript:;"><img src="images/btn-prize.png" alt=""></a></div>
      </div>
      <div class="media-box" id="sub-info"> <img class="p1" src="images/slider7-txt1.png" alt="">
        <div class="input-txt">
          <input name="" placeholder="填写祝福：" type="text" id="myContent">
        </div>
        <div class="submit-row"><a id="submitBtn" href="javascript:;"><img src="images/btn-submit.png" alt=""></a></div>
        
        <div class="txtArea">
         <marquee style="" scrollamount="2" direction="up" id="contentList"> 
         </marquee>
        </div>
        
      </div>
        <div class="media-box" id="prize-mem" style="display:none">
      		<div class="back-row"><a id="reBack" href="#"><img src="images/btn_back.png" alt=""></a></div>
            <div class="n1"><img src="images/zjmd.png" alt=""></div>
            <div class="txt-prize">
           恭喜以下3位<br>
			获得由飞扬旅游提供的<br>
			送父母两人生态农庄免费游！<br>
			请在三个工作日内私信<br>
			飞扬官方微信后台<br>
			与我们联系哦！ </div>
            <div class="prize-mem">我的时光<br>
箐箐<br>
隐灵香Yimo</div>
<div><img src="images/wechat-img.png" alt=""></div>
      </div>
      <div class="media-box" id="sub-success"> <img style="margin-bottom:75px;" src="images/sub-success.png" alt="">
        <div><a id="btn-share" href="#"><img src="images/btn-share.png" alt=""></a></div>
      </div>
      <div class="share-model"><img src="images/share-txt.png" alt=""></div>
    </div>
  </div>
</div>
<div class="slider"><img src="images/arr.png" alt=""></div>
<audio preload="load" src="audio/audio-1.mp3" class="audio-1" id="audio-1"></audio>
<span class="music"></span> 
    <div style="display:none"><script src='http://s25.cnzz.com/stat.php?id=4072742&web_id=4072742&show=pic' language='JavaScript'></script></div> 
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js "></script>
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> 
<script type="text/javascript" src="js/iSlider.js"></script> 
<script type="text/javascript" src="js/touch.js"></script> 
<script type="text/javascript" src="js/ifly.js"></script>
    <script type="text/javascript">
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串 
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }
        var myRequest = GetRequest();
        var fromStr = decodeURI(myRequest["from"]);
        if (fromStr != undefined && fromStr != "undefined" && fromStr != "") {
            window.location.href = "http://www.iflying.com/zt/weixin/authorize.php?state=m.iflying.com/duanwu/index.aspx";
        }
        
     wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wxd438ca7726cbc438', // 必填，公众号的唯一标识
        timestamp: <%=timsstampStr%>, // 必填，生成签名的时间戳
        nonceStr: 'Wm3WZYTPz0wzccnK', // 必填，生成签名的随机串
        signature: '<%=signStr %>',// 必填，签名，见附录1
        jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });

    wx.ready(function () {

        // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
    
        wx.onMenuShareTimeline({
            title: '这个中秋,换我牵起你的手', // 分享标题
            link: 'http://www.iflying.com/zt/weixin/authorize.php?state=m.iflying.com/duanwu/index.aspx', // 分享链接
            imgUrl: 'http://m.iflying.com/duanwu/images/share1.jpg', // 分享图标
            success: function () { 
                // 用户确认分享后执行的回调函数
            },
            cancel: function () { 
                // 用户取消分享后执行的回调函数
            }
        });


        wx.onMenuShareAppMessage({
            title: '这个中秋,换我牵起你的手', // 分享标题
            desc: '牵着你手，出去走走', // 分享描述
            link: 'http://www.iflying.com/zt/weixin/authorize.php?state=m.iflying.com/duanwu/index.aspx', // 分享链接
            imgUrl: 'http://m.iflying.com/duanwu/images/share1.jpg', // 分享图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () { 
                // 用户确认分享后执行的回调函数
                
            },
            cancel: function () { 
                // 用户取消分享后执行的回调函数
            }
        });

    });
    wx.error(function (res) {

        // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
        
    });

    wx.checkJsApi({
        jsApiList: ['onMenuShareTimeline','onMenuShareAppMessage'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
        success: function (res) {
            // 以键值对的形式返回，可用的api值true，不可用为false
            // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
        }
    });
    </script>
</body>
</html>