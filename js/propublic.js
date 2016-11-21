function sortdown(x, y) {
    return (x.TotalCount < y.TotalCount) ? 1 : -1
}

function LoadGroupLine(type) {
    var postUrl = "";
    postUrl = groupListUrl + "&Page=1&size=18&ProductType=" + type + "&ra=" + Math.random();
    $.getJSON(postUrl, function (data) {
        if (data != null && data.data != null) {
            if (data.data.LineList.length > 0) {
                //排序
                var lineJson = data.data.LineList.sort(sortdown);
                var lineStr = "<section class='section-pro p10'>";
                $.each(lineJson, function (i, item) {
                    lineStr += "<div class='pro-row'><a href='javascript:goProduct(" + item.ID + ");'><div class='proImg'><img src='" + item.DefaultPic +imgWidthStr+ "' alt='' title=''></div><div class='pro-rInfo'>"
                    + "<div class='pro-title'>" + item.Title + "</div><p class='pro-date'>发团日期：" + item.StartTime + "</p><div class='pro-price row'>"
                    + "<span class='red_t'>¥ <b class='ft20'>" + item.DefaultPrice + "</b> <font>起</font></span><div class='coupon floatR'><font>送</font><span>100</span></div></div></div></a></div>";;
                });
                lineStr += "</section>";
                $("#moreList").html(lineStr);
            }
            else {
                $("#moreList").html("<div class='noinfo-tip'>暂时没有相关产品</div>");
            }
        }
    });
}

function LoadShipLine() {
    $.getJSON(shipListUrl + "&Page=1&Size=18&ra=" + Math.random(), function (data) {
        if (data != null && data.data != null) {
            if (data.data.CruiseList.length > 0) {
                var lineStr = "<section class='section-pro p10'>";
                $.each(data.data.CruiseList, function (i, item) {
                    lineStr += "<div class='pro-row'><a href='javascript:goProduct(" + item.ID + ");'><div class='proImg'><img src='" + item.DefaultPic +imgWidthStr+ "' alt='' title=''></div><div class='pro-rInfo'>"
                            + "<div class='pro-title'>" + item.Title + "</div><div class='linkRow row color9'><span> <i class='iconB start'></i>出发地：" + item.Depart + "</span><span>"
                            + "<i class='iconB delay'></i>" + item.Night + "晚" + item.DayNum + "天</span><span><i class='iconB shipLine'></i>" + item.AirLine + "</span></div><div class='pro-price'>"
                            + "<span class='red_t floatR'>¥ <b class='ft20'>" + item.DefaultPrice + "</b> <font>起</font></span></div></div></a></div>";
                });
                lineStr += "</section>";
                $("#moreList").html(lineStr);
            }
            else {
                $("#moreList").html("<div class='noinfo-tip'>暂时没有相关产品</div>");
            }
        }
    });
}