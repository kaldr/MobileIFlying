<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destinationDetail.aspx.cs" Inherits="WeChat.NewIflying.NewDestination.destinationDetail" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle">【2016<%=cityTitle %>旅游攻略】<%=cityTitle %>自助游攻略_<%=cityTitle %>旅游指南 - 飞扬旅游网</title>
    <meta name="keywords" content="2016<%=cityTitle %>旅游攻略,<%=cityTitle %>自助游攻略,<%=cityTitle %>旅游指南" id="myKeywords" />
    <meta name="description" id="myDescription" content="<%=cityTitle %>旅游攻略,介绍了<%=cityTitle %>旅游景点大全包含热门线路推荐、更有<%=cityTitle %>美食推荐、住宿攻略、交通方案，<%=cityTitle %>旅游地图等<%=cityTitle %>旅游攻略信息,了解更多<%=cityTitle %>旅游攻略上飞扬旅游网。" />
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
                        <div class="left"><a href="javascript:history.back();" class="back link"> <i class="icon icon-back"></i></a></div>
                        <div class="center sliding t1" id="title"><%=cityTitle %></div>
                        <div class="right"><a href="javascript: window.location.href = 'http://m.iflying.com/mdd/';"> <i class="icon icon-s2"></i></a></div>
                    </div>
                </div>
                <div class="page-content grayBg">
                    <div class="swiper-custom">
                        <div class="swiper-container">
                            <div class="swiper-pagination"></div>
                            <div class="swiper-wrapper" id="picList">
                                 <%=picStr %>
                            </div>
                        </div>
                    </div>
                    <div role="main" class="ui-content" data-role="content">
                        <div class="travel_detail_title">
                            <div class="fluidHeight">

                            </div>
                        </div>
                        <div class="mdd_show">
                            <h2>概述</h2>
                            <div class="gaishu">
                                <div id="wrap01">
                                    <div>
                                        <p id="summary">
                                             <%=summaryStr %>
                                        </p>
                                    </div>
                                    <div id="gradient"></div>
                                </div>
                                <div id="read-more"></div>
                            </div>
                        </div>
                        <div class="mdd_block">
                            <%=linkStr %>
                        </div>
                        <div class="prod_list" style="display: block;">
                            <h3>线路推荐</h3>
                            <ul id="LineList">
                                
                            </ul>
                        </div>
                        <!--link-->
                        <!--bottom-->

                    </div>
                </div>
                <!--page-content END-->
            </div>
            <!-- page END-->

        </div>
        <!--view-main END-->
    </div>
    <!-- views end-->
    <input type="hidden" id="gaddrId" value="<%=gaddrId %>" />
    <script type="text/javascript" src="/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="/js/command.js"></script>
    <script type="text/javascript" src="/js/framework7.js"></script>
    <script type="text/javascript" src="/js/kitchen-sink.js"></script>
    <script type="text/javascript"> 
        var gaddrId = $("#gaddrId").val();
        function loadProduct() {
            postUrl = groupListUrl + "&Page=1&size=99&DestinationID=" + gaddrId + "&ProductType=1,2,3&ra=" + Math.random();
            $.getJSON(postUrl, function (data) {
                if (data != null && data.data != null) {
                    var lineStr = "";
                    $.each(data.data.LineList, function (i, item) {
                        lineStr += "<li><a onclick='goProduct(" + item.ID + ");'><div class='product_pic'><img src='" + item.DefaultPic + "'></div>"
                        + "<div class='product_bg'></div><h2>" + item.Title + "</h2><span class='product_tips'><em>满意度：" + item.Scores + "%</em>"
                        + "<strong class='base_price'><dfn>¥</dfn>" + item.DefaultPrice + "<dfn>起</dfn></strong></span></a></li>";
                    });
                    $("#LineList").html(lineStr);
                }
            });
        }
        function goProduct(id) {
            goProductPage(id, 1);
        }
        $(function () {
            var slideHeight = 50; // px
            var defHeight = $('#wrap01').height();
            if (defHeight >= slideHeight) {
                $('#wrap01').css('height', slideHeight + 'px');
                $('#read-more').append('<a>点击查看更多<img src="/images/more_qz.png" style="height:20px;width:30px; margin-top:-5px; display:inline-block;"></a>');
                $('#read-more a').click(function () {
                    var curHeight = $('#wrap01').height();
                    if (curHeight == slideHeight) {
                        $('#wrap01').animate({
                            height: defHeight
                        }, "normal");
                        $('#read-more a').html('点击隐藏<img src="/images/more_down.png" style="height:20px;width:30px; margin-top:-5px; display:inline-block;">');
                        $('#gradient').fadeOut();
                    } else {
                        $('#wrap01').animate({
                            height: slideHeight
                        }, "normal");
                        $('#read-more a').html('点击查看更多<img src="/images/more_qz.png" style="height:20px;width:30px; margin-top:-5px; display:inline-block;">');
                        $('#gradient').fadeIn();
                    }
                    return false;
                });
            }

            var myApp = new Framework7();
            var mySwiper = myApp.swiper('.swiper-container', {
                autoplay: 2500,
                pagination: '.swiper-pagination',
                paginationHide: false,
                paginationClickable: true,
            });

            loadProduct();
        });
    </script>
	<script src="https://s4.cnzz.com/z_stat.php?id=4072742&web_id=4072742" language="JavaScript"></script>
</body>
</html>