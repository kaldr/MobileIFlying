<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destinationTip.aspx.cs" Inherits="WeChat.NewIflying.NewDestination.destinationTip" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle">【<%=cityTitle %>旅游注意事项】去<%=cityTitle %>旅游要注意什么 - 飞扬旅游网</title>
    <meta name="keywords" content="<%=cityTitle %>旅游注意事项,去<%=cityTitle %>旅游注意什么" id="myKeywords" />
    <meta name="description" id="myDescription" content="飞扬旅游网为您介绍一些<%=cityTitle %>旅游注意事项_去<%=cityTitle %>旅游要注意什么,让您了解<%=cityTitle %>当地的气候,风俗习惯等.去<%=cityTitle %>旅游注意事项详情请点击进入网站查看。" />
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/my-app.css">
</head>
<body ontouchstart>
    <!--views start-->
    <div class="views">
        <!--view-main start-->
        <div class="view view-main">
            <!--page start-->
            <div class="page navbar-fixed">
                <!-- navbar start-->
                <div class="navbar tmBar">
                    <div class="navbar-inner navbar-on-center">
                        <div class="left"><a id="backUrl" class="back link" href="javascript:history.back();"> <i class="icon icon-back"></i></a></div>
                        <div class="center sliding t1">注意事项</div>
                        <div class="right"></div>
                    </div>
                </div>
                <!-- navbar END-->
                <!--page-content start-->
                <div class="page-content">
                    <div class="borderB feeInfo">
                        <div class="infoTxt" id="tipList">
                               <%=tipListStr %>
                        </div>
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