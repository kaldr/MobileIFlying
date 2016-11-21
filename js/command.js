function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串 
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}
function loadAdInfo(adId) {
    $.getJSON(getAdByIDUrl + "?id=" + adId, function (data) {
        if (data != null && data.data != null) {
            $.each(data.data, function (i, item) {
                $("#adList").append("<div class='swiper-slide' onclick=\"window.location.href='" + item.HttpUrl + "'\"><img src='" + item.PicUrl + "' alt=''></div>");
            });     
            var myApp = new Framework7();
            var mySwiper = myApp.swiper('.swiper-container', {
                autoplay: 2500,
                pagination: '.swiper-pagination',
                paginationHide: false,
                paginationClickable: true,
            });
        }
    });
}
function getDayOfWeekStr(day) {
    switch (day) {
        case 0:
            return "周日";
            break;
        case 1:
            return "周一";
            break;
        case 2:
            return "周二";
            break;
        case 3:
            return "周三";
            break;
        case 4:
            return "周四";
            break;
        case 5:
            return "周五";
            break;
        case 6:
            return "周六";
            break;
    }
}
function goIntentionOrder(title, des, proId, proType, proGADDRID) {
    sessionStorage.setItem("int_title", title);
    sessionStorage.setItem("int_des", des);
    sessionStorage.setItem("int_proId", proId);
    sessionStorage.setItem("int_proType", proType);
    sessionStorage.setItem("int_proGADDRID", proGADDRID);

    window.location.href = "../OrderPublic/IntentionOrder.html";
}
function goTel() {
    window.location.href = 'tel://4000-365-666';
}
function goProductPage(id, type) {
    switch (type) {
        case 1:   //跟团
            window.location.href = "http://m.iflying.com/line/?id=" + id;
            break;
        case 2:   //自由
            window.location.href = "http://m.iflying.com/zyx/?id=" + id;
            break;
        case 3:   //邮轮
            window.location.href = "http://m.iflying.com/cruises/?id=" + id;
            break;
        case 4:   //自驾
            window.location.href = "http://m.iflying.com/zijia/?id=" + id;
            break;
        case 5:   //签证
            window.location.href = "http://m.iflying.com/visa/?id=" + id;
            break;
    }
}

function escape2Html(str) {
    if (str != "" && str != undefined) {
        str = str.replace("\t", "");
        str = str.replace("\r\n", "<br />");
        str = str.replace("\n", "<br />");
        str = str.replace("\\\"", "\"");
        //str = "<p>" + str;
        //var reg = /<p>$/gi;
        //str = str.replace(reg, "");
        return str;
    }
}

function tripTrafficStr(str) {
    if (str != "") {
        str = str.replace(/{汽车}/g, "<i class='iconI i-bus'>&nbsp;</i>").replace(/{火车}/g, "<i class='iconI i-dc'>&nbsp;</i>").replace(/{动车}/g, "<i class='iconI i-dc'>&nbsp;</i>")
            .replace(/{飞机}/g, "<i class='iconI i-plane'>&nbsp;</i>").replace(/{船}/g, "<i class='iconI i-ship'>&nbsp;</i>");
        str = str.replace(/｛汽车｝/g, "<i class='iconI i-bus'>&nbsp;</i>").replace(/｛火车｝/g, "<i class='iconI i-dc'>&nbsp;</i>").replace(/｛动车｝/g, "<i class='iconI i-dc'>&nbsp;</i>")
            .replace(/｛飞机｝/g, "<i class='iconI i-plane'>&nbsp;</i>").replace(/｛船｝/g, "<i class='iconI i-ship'>&nbsp;</i>");
    }
    return str;
}

var myphonereg = /^(13|14|15|16|17|18|19)\d{9}$/;
var imgWidthStr = "@320w";

var interfaceUrl = "http://v8.iflying.com/ajax/";
var orderinterfaceUrl = "http://rpc.iflying.com/WebService/";
var activeinterfaceUrl = "http://tripmore.iflying.com/";
var oldinterfaceUrl = "http://appservice.iflying.com/";

//----------首页-----------
//首页轮播广告接口
var indexAdUrl = interfaceUrl + "Ad/getPicCarouselAd";
//根据ID获取广告
var getAdByIDUrl = interfaceUrl + "Ad/getAdByID";
//首页推荐产品接口
var indexProductUrl = interfaceUrl + "Product/prdrecmd";
//根据ID获取推荐产品
var getProductByIDUrl = interfaceUrl + "Product/getPrdrecmdByPositionID";
//首页活动广告接口
var indexActUrl = interfaceUrl + "Ad/";
//首页主题广告接口
var indexThemeUrl = interfaceUrl + "Ad/";
//首页活动产品接口
var indexActProUrl = activeinterfaceUrl + "ActiveInterface/GetRecActive.ashx";

//----------活动列表-----------
//活动列表接口
var activeListUrl = activeinterfaceUrl + "ActiveInterface/GetActiveList.ashx";

//----------活动详情-----------
//活动详情接口
var activeDetailUrl = activeinterfaceUrl + "ActiveInterface/GetActiveInfo.ashx";

//----------产品列表-----------
//产品列表接口
var productListUrl = interfaceUrl + "Product/getProductList";
//产品列表广告轮播接口
var productListAdUrl = interfaceUrl + "Ad/";

//----------产品详情-----------
//产品详情接口
var productDetailUrl = interfaceUrl + "Product/getProductDetail";
//产品费用说明接口
var productFeeUrl = interfaceUrl + "Product/getProductFeeNote";
//产品重要提醒接口
var productImprotUrl = interfaceUrl + "Product/getProductImportNote";
//产品行程接口
var productTripUrl = interfaceUrl + "Product/getProductTripData";
//用户点评接口
var recordUrl = interfaceUrl + "Record/visitrecord";
//产品二次编辑信息接口
var proMoreInfoUrl = activeinterfaceUrl + "ProductInterface/GetProInfo.ashx";


//----------主题列表页-----------
//主题信息接口
var themeUrl = interfaceUrl + "/Theme/";
//主题产品接口
var themeProductUrl = interfaceUrl + "/Theme/";

//----------预定-----------
//团期接口
var groupUrl = orderinterfaceUrl + "WebOrdercs/GetPlan";
//订单提交接口
var orderSubUrl = orderinterfaceUrl + "WebOrdercs/SubmitOrder";
//订单详情接口
var orderInfoUrl = orderinterfaceUrl + "WebOrdercs/GetOrderInfo";
//订单日志接口
var orderLogUrl = activeinterfaceUrl + "orderinterface/orderaction.ashx"

//----------系统-----------
//短信发送接口
var sendMsgUrl = activeinterfaceUrl + "Msg/SendMsg.ashx";
//验证短信接口
var checkCodeUrl = activeinterfaceUrl + "Msg/checkCode.ashx";
//用户记录接口
var pageLogUrl = activeinterfaceUrl + "PageAction/pageAction.ashx";

//----------老接口----------
var md5Str = "690128A2418E1049CA5C97E3B475B9C8";
//团队游团期接口
var groupTeamUrl = oldinterfaceUrl + "Get/pprodInfo.ashx?StrMd5=" + md5Str;
//自助游团期接口
var diyTeamUrl = oldinterfaceUrl + "Get/FreeLineInfoDateTime.ashx?StrMd5=" + md5Str;
//邮轮团期接口
var cruiseTeamUrl = oldinterfaceUrl + "Get/CruiseDateTime.ashx?StrMd5=" + md5Str;

//提交订单接口
var postOrderUrl = oldinterfaceUrl + "Post/ProductOrder.ashx";
//活动提交订单接口
var actPostOrderUrl = oldinterfaceUrl + "Post/ConcOrder.ashx";
//邮轮意向订单接口
var cruiseOrderUrl = oldinterfaceUrl + "Post/CruiseOrder_NewWap.ashx";
//定制游订单接口
var customtourOrderUrl = oldinterfaceUrl + "Post/CustomtourOrder.ashx";

//会员登录
var loginUrl = oldinterfaceUrl + "Post/UserLogin.ashx";
//会员注册
var registerUrl = oldinterfaceUrl + "Post/Register.ashx";
//修改密码
var updateUseUrl = oldinterfaceUrl + "Post/UpdatePwd_NewWap.ashx";
//重置密码
var forgetPwdUrl = oldinterfaceUrl + "Post/ForgetPwd.ashx";
//发送验证码
var orderCodeUrl = oldinterfaceUrl + "Post/GetCode.ashx";
//获取会员信息
var userInfoUrl = oldinterfaceUrl + "get/GetUserInfo.ashx?StrMd5="+md5Str;

//订单列表
var orderListUrl = oldinterfaceUrl + "Get/OrderList.ashx?StrMd5=" + md5Str;
//订单详情
var orderdetailUrl = oldinterfaceUrl + "Get/OrderInfo.ashx?StrMd5=" + md5Str;

//目的地列表
var gaddrListUrl = oldinterfaceUrl + "Get/GaddrList_NewWap.ashx?StrMd5=" + md5Str;
//目的地详情
var gaddrInfoUrl = oldinterfaceUrl + "Get/GaddrInfo_NewWap.ashx?StrMd5=" + md5Str;
//目的地详情2
var gaddrInfo2Url = oldinterfaceUrl + "Get/GaddrInfo.ashx?StrMd5=" + md5Str;
//景区详情
var scenicInfoUrl = oldinterfaceUrl + "Get/ScenicInfo.ashx?StrMd5=" + md5Str;

//签证详情
var visaInfoUrl = oldinterfaceUrl + "Get/VisaInfo.ashx?StrMd5=" + md5Str;
//自驾详情
var driveInfoUrl = oldinterfaceUrl + "Get/DriveInfo.ashx?StrMd5=" + md5Str;

//组团游产品列表
var groupListUrl = oldinterfaceUrl + "Get/ClusterList_NewWAP.ashx?StrMd5=" + md5Str;
//签证产品列表
var visaListUrl = oldinterfaceUrl + "Get/VisaList.ashx?StrMd5=" + md5Str;
//邮轮产品列表
var shipListUrl = oldinterfaceUrl + "Get/CruiseList_NewWap.ashx?StrMd5=" + md5Str;
//自驾产品列表
var dirveListUrl = oldinterfaceUrl + "Get/DriveList.ashx?StrMd5=" + md5Str;
//自由行产品列表
var freeListUrl = oldinterfaceUrl + "Get/FreeLineList_NewWap.ashx?StrMd5=" + md5Str;
//组团游详情
var groupLineInfoUrl = oldinterfaceUrl + "Get/ClusterInfo_NewWap.ashx?StrMd5=" + md5Str;
//组团游行程
var groupTripUrl = oldinterfaceUrl + "Get/LineTrip.ashx?StrMd5=" + md5Str;
//自驾详情
var dirveInfoUrl = oldinterfaceUrl + "Get/DriveInfo.ashx?StrMd5=" + md5Str;
//自由行详情
var freeInfoUrl = oldinterfaceUrl + "/Get/FreeLineInfo_NewWap.ashx?StrMd5=" + md5Str;
var freeInfoUrl1 = oldinterfaceUrl + "/Get/FreeLineInfo.ashx?StrMd5=" + md5Str;
//自由行方案
var freePlanUrl = oldinterfaceUrl + "Get/FreeLinPlan.ashx?StrMd5=" + md5Str;
//签证详情
var visaInfoUrl = oldinterfaceUrl + "Get/VisaInfo.ashx?StrMd5=" + md5Str;
//邮轮详情
var shipInfoUrl = oldinterfaceUrl + "Get/Cruiseinfo.ashx?StrMd5=" + md5Str;
//自由行行程
var zyxTripUrl = oldinterfaceUrl + "get/Tips.ashx?StrMd5="+md5Str;


//评论总数
var commentsCountUrl = oldinterfaceUrl + "get/CommentsCount.ashx?StrMd5=" + md5Str;
//评论列表
var commentsListUrl = oldinterfaceUrl + "Get/CommentsList.ashx?StrMd5=" + md5Str;
//游记列表
var travelNoteListUrl = oldinterfaceUrl + "Get/TravelList.ashx?StrMd5=" + md5Str;
//游记详情
var travelNoteInfo = oldinterfaceUrl + "Get/TravelInfo.ashx?StrMd5=" + md5Str;
//购买记录
var buyListInfo = oldinterfaceUrl + "Get/BuyRecords.ashx?StrMd5=" + md5Str;

//酒店列表
var hotelListUrl = oldinterfaceUrl + "Get/HotelList.ashx?StrMd5=" + md5Str;

//反馈接口
var feedbackUrl = oldinterfaceUrl + "Post/Feedback.ashx";
//绑定微信
var bindWechatUrl = oldinterfaceUrl + "Get/weixin_NewWap.ashx";
//判断微信绑定
var isbindWechatUrl = oldinterfaceUrl + "Get/weixin_NewWap_Isid.ashx";



//公共JS
$.post('http://erp.iflying.com/common/Access/getUserAccessLog', { activity: "2016年8月统计飞扬网移动端用户来源", height: $(window).height(), width: $(window).width() });
document.write("<script src='http://s25.cnzz.com/stat.php?id=4072742&web_id=4072742&show=pic' language='JavaScript'></script>");


