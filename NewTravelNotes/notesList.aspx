<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notesList.aspx.cs" Inherits="WeChat.NewIflying.NewTravelNotes.notesList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>游记部落_旅游攻略_自助游攻略指南-飞扬旅游网</title>
    <meta name="keywords" content="游记部落,旅游攻略,景点攻略,旅游景点攻略" />
    <meta name="description" content="飞扬旅游网提供驴友出游旅游景点攻略、旅游线路、景点游玩旅游攻略,吃、喝、玩、乐的真实经历、心得，让你出行更方便，快捷" />
    <meta name="apple-mobile-web-app-title" content="飞扬旅游网" />
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
                        <div class="left">
                            <a class="back link" href="javascript:history.back();">
                                <i class="icon icon-back"></i>
                            </a>
                        </div>
                        <div class="center sliding t1">相关游记</div>
                        <div class="right"></div>
                    </div>
                </div>
                <!-- navbar END-->
                <!--page-content start-->
                <div class="page-content">
                    <ul class="diary-list" id="traList">
                        <%=noteStr %>
                    </ul>

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