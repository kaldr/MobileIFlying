<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="scenicDetail.aspx.cs" Inherits="WeChat.NewIflying.NewDestination.scenicDetail" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle">门票_<%=scenicTitle %>游玩攻略_<%=scenicTitle %>介绍,地址,在哪里_<%=scenicTitle %>好玩吗 - 飞扬旅游网</title>
    <meta name="keywords" content="<%=scenicTitle %>" id="myKeywords" />
    <meta name="description" id="myDescription" content="飞扬旅游网为你提供<%=scenicTitle %>旅游攻略,门票预订,那么<%=scenicTitle %>好玩吗?多少钱?<%=scenicTitle %>怎么走?了解更多上飞扬旅游网" />
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/my-app.css">
    <link rel="stylesheet" href="/css/des.css">
    <link rel="stylesheet" href="/css/mcss.css">
</head>
<body ontouchstart>
    <!--views start-->
    <div class="views">
        <!--view-main start-->
        <div class="view view-main">
            <!--page start-->
            <div class="page navbar-fixed">
                <!--page-content start-->
                <div class="navbar tmBar">
                    <div class="navbar-inner navbar-on-center">
                        <div class="left">
                            <a href="javascript:history.back();" class="back link">
                                <i class="icon icon-back"></i>
                            </a>
                        </div>
                        <div class="center sliding t1" id="title"><%=scenicTitle %></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="page-content grayBg">
                    <div>
                        <img height="150" width="100%" src="<%=PicStr %>" alt="">
                    </div>
                    <ul class="ul_order_show mb15">
                        <li class="user_a" id="AboutTicket">门票：<%=ticketStr %></li>
                        <li class="user_a" id="AboutOpenTime">
                         开放时间：<%=openStr %>
                        </li>
                        <li class="user_a" id="AboutPlayTime">建议游玩时间：<%=playStr %></li>
                        <li class="user_a" id="AboutVisitSeason">
                         <%=visitStr %>
                        </li>
                    </ul>

                    <div class="w_media sc-detail">
                        <div class="dis_line ft16">
                            <span class="cred">简介</span>
                        </div>
                        <p id="Gaddr">
                            <%=Note %>
                        </p>

                    </div>
                    <div class="w_media sc-detail">
                        <div class="dis_line ft16">
                            <span class="cred">交通</span>
                        </div>
                        <p id="AboutTraffic">
                            <%=TrafficNote %>
                        </p>
                    </div>

                </div>
                <!--page-content END-->
            </div>
            <!-- page END-->
        </div>
        <!--view-main END-->
    </div>
    <!-- views end-->

    <script type="text/javascript" src="/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="/js/command.js"></script>
    <script src="https://s4.cnzz.com/z_stat.php?id=4072742&web_id=4072742" language="JavaScript"></script>
</body>
</html>