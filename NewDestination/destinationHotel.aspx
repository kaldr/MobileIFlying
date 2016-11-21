<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destinationHotel.aspx.cs" Inherits="WeChat.NewIflying.NewDestination.destinationHotel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle">酒店预订_<%=cityTitle %>酒店价格查询_<%=cityTitle %>住宿信息-飞扬酒店预订网</title>
    <meta name="keywords" content="酒店预订_<%=cityTitle %>酒店价格查询_<%=cityTitle %>住宿信息" id="myKeywords" />
    <meta name="description" id="myDescription" content="飞扬酒店预订网为您提供网上2-7折优惠<%=cityTitle %>酒店预订、<%=cityTitle %>宾馆预订、<%=cityTitle %>住宿信息、<%=cityTitle %>酒店价格查询,包含各类星级酒店（包括各类城市经济型商务酒店）订房服务，价格信息，房间数量实时更新，订<%=cityTitle %>酒店返现金!" />
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
                        <div class="center sliding t1">酒店信息</div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="page-content grayBg">
                    <div id="hotelList" class="line_dis">

  
                    </div>
                    <div class="center ptb20" id="loadMore"> <a href="javascript:moreInfo();" class="button color-red inline radis0">点击查看更多</a></div>
                </div>
                
                <!--page-content END-->
            </div>
            <!-- page END-->
        </div>
        <!--view-main END-->
    </div>
    <!-- views end-->
    <input type="hidden" id="cID" value="<%=gaddrId %>" />
    <input type="hidden" id="znCode" value="<%=ZhunaCityCode %>" />
    <script type="text/javascript" src="/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="/js/command.js"></script>
    <script type="text/javascript">
        var cityid = $("#cID").val();
        var zhuCode = $("#ZhunaCityCode").val();
        $(function () {
            if (zhuCode != "") {
                getHotel(cityid);
            }
            else {
                $("#hotelList").append("<div class='center ptb20'>暂无酒店信息</div>");
                $("#loadMore").hide();
            }
        });        
        var page = 1;
        var size = 20;
        function getHotel(cid) {
            $.ajax({
                type: "GET",
                url: hotelListUrl + "&CityID=" + cid + "&Page="+page+"&Size="+size,
                dataType: "text",
                async: true,
                success: function (myMsg) {
                    var dataObj = eval("(" + myMsg + ")");
                    if (dataObj != null && dataObj.result == 1) {
                        if (dataObj.data != null && dataObj.data.length > 0) {
                            var hotelStr = "";
                            $.each(dataObj.data, function (i, hotelitem) {
                                hotelStr += "<div class='grey_line'>" + hotelitem.HotelName + "<div class='hotel_price'><span class='number'>¥" + hotelitem.min_jiage + "</span>"
                                    + "<span class='qi'>起</span></div></div><div class='hotel_detail'><p><img src='" + hotelitem.Picture + "'>地址：" + hotelitem.Address 
                                    + "<br />星级：" + hotelitem.xingji + "<br />满意度：" + hotelitem.Score + "%</p></div>";
                            });
                            $("#hotelList").append(hotelStr);
                        }
                        else {
                            $("#loadMore").hide();
                        }
                    }
                },
                error: function () {
                    return;
                }
            });
        }
        function moreInfo() {
            page++;
            getHotel(cityid);
        }
    </script>
	<script src="https://s4.cnzz.com/z_stat.php?id=4072742&web_id=4072742" language="JavaScript"></script>
</body>
</html>