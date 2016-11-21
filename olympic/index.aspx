<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="olympic.index" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="keywords" content="宁波飞扬旅行社,宁波旅行社,宁波旅游网" />
<meta name="description" content="飞扬旅游网隶属于浙江飞扬国际旅游集团,宁波旅行社行业第一,全国第八,浙江省首批五星级旅行社,宁波市最佳旅行社.服务热线:4000-365-666" />
<meta name="apple-mobile-web-app-title" content="飞扬旅游网" />
<title>奥运奖牌猜猜猜,飞扬送你免费游</title>
<link rel="apple-touch-icon-precomposed" href="http://img0.vbooking.net/favicon.ico" />
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/layout.css">
<script type="text/javascript">
    var ua = navigator.userAgent.toLowerCase();
    if (ua.match(/MicroMessenger/i) == "micromessenger") {

    }
    else {
        window.location.href = "http://www.iflying.com/zt/weixin/authorize.php?state=m.iflying.com/olympic/index.aspx";
    }
</script>
</head>
<body>
<!--view start-->
<div id="container"> 
  <!--page1 start-->
  <div class="content  animated slideInLeft page1" style="display:block">
    <div class="logo"><img src="images/logo.png" alt=""></div>
    <div class="rio-media"><img src="images/rio.png" alt=""></div>
    <div class="action-row"><img src="images/btn_bg.png" alt=""><div class="ani_img"></div></div>
    <div class="ft_ain"><img src="images/ft_ani.png" alt=""></div>
  </div>
  <!--page2 start-->
  <div class="content animated slideInLeft page2">
    <div class="logo"><img src="images/logo.png" alt=""></div>
    <div class="t1"><img src="images/t1.png" alt=""></div>
    <div class="dateTime"><span class="pad"><%=dayStr1 %></span><span class="pad" style="margin-right:15px;"><%=dayStr2 %></span><span class="pad">A</span><span class="pad">U</span><span class="pad" style="margin-right:15px;">G</span><span class="pad">2</span><span class="pad">0</span><span class="pad">1</span><span class="pad">6</span></div>
    <div class="score">
        <span id="score1"><img src="images/flag.png" alt=""></span>
        <span id="score2"><img src="images/icon-gold.png" alt=""></span>
        <span id="score3"><img src="images/icon-silver.png" alt=""></span>
        <span id="score4"><img src="images/icon-bronze.png" alt=""></span></div>
    <div class="t2"><img src="images/img2.png" alt=""></div>
    <div class="media-box"> <img src="images/img3.png" alt=""> <span class="btn-click btn-left" id="bt1"><img src="images/btn_l.png" alt=""></span> <span class="btn-click btn-right" id="bt2"><img src="images/btn_r.png" alt=""></span> </div>
    <div class="btn-rule"><a href="#" id="jfBtn"><img src="images/btn_jf.png" alt=""></a></div>
    <div class="t3"><a class="active-ruler" id="active-rule" href="#">活动规则</a></div>
  </div>
</div>
<!--view END-->

<div class="modal-overlay"></div>
<div class="popup">
  <div class="pages">
    <div class="page" id="ruler">
      <div class="navbar">
        <div class="navbar-inner">
          <div class="center">活动规则</div>
          <a class="close" onClick="closePop();" href="#">&nbsp;</a> </div>
      </div>
      <div class="page-content">
        <h3>活动方式</h3>
        <p>①选择你认为明日奖牌数为单数还是双数；<br>
          ②活动为积分制，基础分为60分，每日猜对得10分，猜错扣5分；奥运会最后两天猜对得20分，猜错扣10分；<br>
          ③每天中午14:00前更新前一天积分榜；<br>
          ④巴西奥运会结束后，积分榜首将获得免费旅游，前二十名有机会获得幸运大奖；<br>
          ⑤若积分相同，以第一次参加此活动时间先后进行排序。<br>
          ★报名对象：所有爱飞扬旅游网粉丝均可参加 <br>
          ★活动时间：即日起至2016年8月22日0:00（北京时间）结束 <br>
          ★本活动真实有效，所有线路或奖品将在活动结束后7个工作日内与获奖者进行联系并发放<br>
          ★若名字出现空白情况，以积分榜中[我的积分]分数为准</p>
        <h3>活动奖品</h3>
        <p>★积分榜第一名：赠送<span style="color:#d74385; font-size:18px;">首尔免费旅游</span><br>
          ★积分榜前20名：<br>
          随机抽取2人，每人赠送大剧院表演门票2张<br>
          随机抽取5人，每人赠送李家坑漂流门票2张 </p>
        <p class="center" style="font-size:12px; line-height:18px;">★本次活动最终解释权归浙江飞扬国际旅游集团股份有限公司所有</p>
      </div>
    </div>
    <div class="page" id="jfb">
      <div class="navbar">
        <div class="navbar-inner">
          <div class="center">积分榜</div>
          <a class="close" onClick="closePop();" href="#">&nbsp;</a> </div>
      </div>
      <div class="page-content">
        <table class="tab-list"  border="0" cellspacing="0" cellpadding="0" id="jfList">
          <tr>
            <th>排名</th>
            <th>ID</th>
            <th>积分</th>
          </tr>
         
        
        </table>
      </div>
      <div class="my-jf" id="myJf">我的积分：0</div>
    </div>
    <div class="page" id="tp"><a class="close" onClick="closePop();" href="#">&nbsp;</a>
      <div class="success-row" id="successStr"></div>
    </div>
  </div>
</div>
    <script src="js/jquery-2.1.3.min.js"></script>
    <script src="js/touch.js"></script>
    <script src="js/myApp.js"></script>
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
            window.location.href = "http://www.iflying.com/zt/weixin/authorize.php?state=m.iflying.com/olympic/index.aspx";
        }
    </script>
    <script type="text/javascript">
        var openid = "<%=openid %>";
        var nickname = "<%=nickname %>";
        if (openid == undefined || openid == "" || openid == "undefined") {
            window.location.href = "http://www.iflying.com/zt/weixin/authorize.php?state=m.iflying.com/olympic/index.aspx";
        }
        function loadInfo() {
            $.ajax({
                type: "GET",
                url: "olympicAction.ashx?type=1&ra=" + Math.random(),
                dataType: "text",
                async: true,
                success: function (myMsg) {
                    if (myMsg != "") {
                        var dataObj = eval("(" + myMsg + ")");
                        $("#score1").append("No." + dataObj.Number);
                        $("#score2").append(dataObj.GodMedals);
                        $("#score3").append(dataObj.SilverMedals);
                        $("#score4").append(dataObj.BronzeMedals);
                    }
                },
                error: function () {
                    return;
                }
            });
        }
        function loadJfInfo() {
            $.ajax({
                type: "GET",
                url: "olympicAction.ashx?type=2&ra=" + Math.random(),
                dataType: "text",
                async: true,
                success: function (myMsg) {
                    if (myMsg != "") {
                        $("#jfList").html(myMsg);
                    }
                },
                error: function () {
                    return;
                }
            });
        }
        function loadMyJfInfo() {
            $.ajax({
                type: "GET",
                url: "olympicAction.ashx?type=3&openid=" + openid + "&ra=" + Math.random(),
                dataType: "text",
                async: true,
                success: function (myMsg) {
                    if (myMsg != "") {
                        $("#myJf").html("我的积分：" + myMsg);
                    }
                },
                error: function () {
                    return;
                }
            });
        }
        function subResult(sel) {
            $.ajax({
                type: "GET",
                url: "olympicAction.ashx?type=4&openid=" + openid + "&nickname=" + nickname + "&sel=" + sel + "&ra=" + Math.random(),
                dataType: "text",
                async: true,
                success: function (myMsg) {
                    if (myMsg == "-1") {
                        $("#successStr").html("您今天已经选择过了");
                    }
                    else if (myMsg == "0") {
                        $("#successStr").html("服务器异常,稍后再试");
                    }
                    else if (myMsg == "1") {
                        $("#successStr").html("投票成功");
                        loadJfInfo();
                        loadMyJfInfo();
                    }
                    showPop();
                    $("#tp").show();
                    $(".popup").addClass("small");
                },
                error: function () {
                    return;
                }
            });
        }
        $("#bt1").click(function () {
            subResult(1);
        });
        $("#bt2").click(function () {
            subResult(2);
        });
        loadInfo();
        loadJfInfo();
        loadMyJfInfo();
    </script>
</body>
</html>
