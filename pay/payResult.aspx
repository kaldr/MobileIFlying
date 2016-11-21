<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payResult.aspx.cs" Inherits="WeChat.NewIflying.pay.payResult" %>

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
    <title>飞扬旅游网</title>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/my-app.css">
</head>
<body ontouchstart>

    <!--views start-->
    <div class="views" id="contentDiv">
        <!--view-main start-->
        <div class="view view-main">
            <div class="successBar">支付成功</div>
            <!--page start-->
            <div class="page navbar-fixed">
                <!-- navbar start-->
                <div class="navbar tmBar">
                    <div class="navbar-inner navbar-on-center">
                        <div class="left"><!--<a class="back link" href=""> <i class="icon icon-back"></i></a>--></div>
                        <div class="center sliding t1">支付成功</div>
                        <div class="right"></div>
                    </div>
                </div>
                <!-- navbar END-->
                <!--page-content start-->
                <div class="page-content">
                    <div class="card-spe center mlr15">
                        <%if (result == 1)
                                { %>
                        <div class="center ft20 ptb20"><i class="iconSus mr10">&nbsp;</i>恭喜您，支付成功！</div>
                        <div class="ft14 color6 mb5" id="payContent"></div>
                        <p class="color6  ft14 mb10" id="lastPrice">您可以点击 <a class="pinkTxt" style="text-decoration:underline;" href="#" id="payUrl">"支付剩余款项"</a> 进行剩余金额的支付</p>     
                        <%}
                                else
                                { %>
                             <div class="center ft20 ptb20"><i class="iconSus mr10">&nbsp;</i>很抱歉，支付失败！</div>
                        <p class="color6  ft14 mb10">您可以致电4000-365-666进行人工咨询，非常抱歉！</p>
                        <%} %>                   
                    </div>
                    <div class="space">&nbsp;</div>
                </div>
                <!--page-content END-->
            </div>
            <!-- page END-->

            <div class="toolbar h1"> <a class="yellowbtn" href="#" id="orderUrl">查看订单信息</a><a class="yellowbtn b2" href="http://m.iflying.com/">返回首页</a> </div>
        </div>
        <!--view-main END-->
    </div>
    <!-- views end-->
    <input type="hidden" id="orderId" value="<%=orderId %>" />
    <script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="../js/command.js"></script>
    <script type="text/javascript" src="../js/mywechat.js"></script>
    <script type="text/javascript"> 
        var orderId = $("#orderId").val();
        if (orderId == undefined || orderId == null || orderId == "") {
            alert("参数错误!");
            window.location.href = "http://m.iflying.com/";
        }
        $.getJSON(orderdetailUrl + "&OrderID=" + orderId, function (data) {
            if (data != null && data.data != null) {
                if (data.data.OrderInfo.length > 0) {
                    var orderItem = data.data.OrderInfo[0];

                    $("#payContent").html("您购买的订单为" + orderItem.OrderNo + "产品已成功支付¥" + orderItem.Prepay);
                    if (orderItem.Unpaid<=0) {
                        $("#lastPrice").hide();
                    }
                    else {
                        $("#payUrl").attr("href", "javascript:window.location.href='payPage.html?order=" + orderId + "'");
                    }
                    $("#orderUrl").attr("href", "javascript:window.location.href='../OrderPublic/orderDetail.html?order=" + orderId + "'");
                }
            }
        });
    </script>
</body>
</html>