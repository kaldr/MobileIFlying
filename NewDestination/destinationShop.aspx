<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destinationShop.aspx.cs" Inherits="WeChat.NewIflying.NewDestination.destinationShop" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle">【<%=cityTitle %>旅游购物攻略】<%=cityTitle %>购物指南_去<%=cityTitle %>旅游买什么好_旅游特产,纪念品 - 飞扬旅游网</title>
    <meta name="keywords" content="<%=cityTitle %>旅游购物攻略,<%=cityTitle %>旅游购物指南,去<%=cityTitle %>旅游买什么好,<%=cityTitle %>旅游特产" id="myKeywords" />
    <meta name="description" id="myDescription" content="<%=cityTitle %>旅游购物攻略,<%=cityTitle %>购物指南,飞扬旅游网提供最全面的<%=cityTitle %>购物攻略,去<%=cityTitle %>旅游买什么好?包括<%=cityTitle %>当地土特产,旅游纪念品,工艺品等。" />
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
                        <div class="center sliding t1" id="title"><%=cityTitle %>购物攻略</div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="page-content grayBg">
                    <div class="w_media">
                        <div class="cred lineB"> <strong>购物点</strong></div>
                        <ul class="shopping-list" id="itemList">
                                <%=SpecialtyStr %> 
                        </ul>
                    </div>
                    <div class="w_media">
                        <div class="cred lineB"> <strong>特产</strong></div>
                        <ul class="shopping-list" id="shopList">  
                                <%=shopListStr %>                     
                        </ul>
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