<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notesDetail.aspx.cs" Inherits="WeChat.NewIflying.NewTravelNotes.notesDetail" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title id="myTitle"><%=travelTitle %></title>
    <meta name="keywords" content="<%=travelTitle %>" id="myKeywords" />
    <meta name="description" id="myDescription" content="<%=travelTitle %>" />
    <meta name="apple-mobile-web-app-title" content="飞扬旅游网" />
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/des.css">
    <link rel="stylesheet" href="/css/mcss.css">   
	<link rel="stylesheet" href="/css/my-app.css">
	<style>
	.diary-txt p img { width:100%; height:auto; padding:0;}
	</style> 
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
                        <div class="center sliding t1">游记</div>
                        <div class="right"></div>
                    </div>
                </div>
                <!-- navbar END-->
                <!--page-content start-->
                <div class="page-content">
                    <div class="author-info mb10">
                        <img class="img" src="/images/defaultface.jpg" alt="" id="travelImg" />
                        <div class="author-right">
                            <h2 class="ft20 mb10 row-2" id="travelTitle"><%=travelTitle %></h2>
                            <div class="color9 row"><span id="Author"><%=Author %></span><%--<span id="BrowseCount">浏览：<%=BrowseCount %></span>--%><span id="CreateTime"><%=CreateTime %></span></div>
                        </div>
                    </div>
                    <div class="diary-txt" id="travelContent">
                         <%=Content %>
                    </div>
                    <div class="mdd_block">
                    <%=linkStr %>
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