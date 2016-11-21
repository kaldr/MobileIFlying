<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destinationFood.aspx.cs" Inherits="WeChat.NewIflying.NewDestination.destinationFood" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle">【<%=cityTitle %>美食推荐】<%=cityTitle %>餐饮美食攻略_<%=cityTitle %>特色小吃有哪些_<%=cityTitle %>有什么好吃的 - 飞扬旅游网</title>
    <meta name="keywords" content="<%=cityTitle %>美食,<%=cityTitle %>餐饮美食攻略,<%=cityTitle %>特色小吃有哪些,<%=cityTitle %>有什么好吃的" id="myKeywords" />
    <meta name="description" id="myDescription" content="<%=cityTitle %>有什么好吃的?<%=cityTitle %>有哪些美食?<%=cityTitle %>旅游之<%=cityTitle %>旅游餐饮攻略,当地特色美食一网打尽,<%=cityTitle %>特色小吃有哪些?就上飞扬旅游网" />
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
                        <div class="center sliding t1" id="title"><%=cityTitle %>美食攻略</div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="page-content grayBg">

                    <div class="des-food">
                        <div class="line_dis gz" id="summary">
                              <%=foodSummary %>
                        </div>
                        <ul class="des-food-list" id="foodList">
                             <%=foodListStr %>
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