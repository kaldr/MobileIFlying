<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destinationTraffic.aspx.cs" Inherits="WeChat.NewIflying.NewDestination.destinationTraffic" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle">【<%=cityTitle %>交通指南】怎么去<%=cityTitle %>_<%=cityTitle %>旅游交通方案 - 飞扬旅游网</title>
    <meta name="keywords" content="<%=cityTitle %>交通指南,怎么去<%=cityTitle %>,<%=cityTitle %>旅游交通方案" id="myKeywords" />
    <meta name="description" id="myDescription" content="<%=cityTitle %>交通指南，怎么去<%=cityTitle %>，飞扬旅游网为您提供详尽的全国各地去<%=cityTitle %>交通方式，以及<%=cityTitle %>交通攻略，<%=cityTitle %>当地交通方式，交通实用信息。" />
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
                        <div class="center sliding t1" id="title"><%=cityTitle %>交通指南</div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="page-content grayBg">
                    <div class="line_dis">
                        <ul id="trafficList">
                             <%=trafficListStr %>
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