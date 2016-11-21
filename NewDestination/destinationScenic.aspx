<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destinationScenic.aspx.cs" Inherits="WeChat.NewIflying.NewDestination.destinationScenic" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle">【<%=cityTitle %>旅游景点大全】<%=cityTitle %>旅游景点介绍_<%=cityTitle %>有哪些旅游景点 - 飞扬旅游网</title>
    <meta name="keywords" content="<%=cityTitle %>有哪些旅游景点?飞扬旅游网为您收集了<%=cityTitle %>旅游景点大全，更多的<%=cityTitle %>旅游景点介绍、景点价格、精彩游记、旅游地图、交通方案，让您出游更方便快捷。" id="myKeywords" />
    <meta name="description" id="myDescription" content="<%=cityTitle %>旅游景点,<%=cityTitle %>旅游景点门票,<%=cityTitle %>旅游景点大全,<%=cityTitle %>旅游景点介绍" />
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
                        <div class="center sliding t1" id="title"><%=cityTitle %>景点大全</div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="page-content">
                    <ul class="sc_list row" id="scenicList">
                               <%=scenicListStr %>
                    </ul>
                    <div class="center ptb20" id="loadMore"> <a href="javascript:moreInfo();" class="button color-red inline radis0">点击查看更多</a></div>
                </div>
                <!--page-content END-->
            </div>
            <!-- page END-->
        </div>
        <!--view-main END-->
    </div>
    <!-- views end-->
    <input type="hidden" id="infoUrl" value="<%=getInfoUrl %>" />
    <script type="text/javascript" src="/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="/js/command.js"></script>
    <script type="text/javascript">
        var getInfoUrl = $("#infoUrl").val(); 
        var page = 2;
        var size = 20;
        function loadInfo() {
            $.ajax({
                type: "GET",
                url: getInfoUrl + "&Type=2&Page=" + page + "&Size=" + size,
                dataType: "text",
                async: false,
                success: function (myMsg) {
                    var dataObj = eval("(" + myMsg + ")");
                    if (dataObj != null && dataObj.result == 1) {
                        var item = dataObj.data;
                       
                        var CateStr = "";
                        $.each(item.Cate, function (i, CateItem) {
                            CateStr += "<li class='col-50'><div class='sc_name'>" + CateItem.Title + "</div><a href='http://m.iflying.com/jingdian/?id=" + item.PBASID + "'><img src='" + CateItem.DefaultPic + "'></a></li>";
                        });
                        $("#scenicList").append(CateStr);
                    }
                },
                error: function () {
                    return;
                }
            });
        }
        function moreInfo() {
            page++;
            loadInfo();
        }
        loadInfo();
    </script>
	<script src="https://s4.cnzz.com/z_stat.php?id=4072742&web_id=4072742" language="JavaScript"></script>
</body>
</html>