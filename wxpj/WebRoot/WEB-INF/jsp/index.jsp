<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script src="js/jquery.js"></script>
<script src="js/swiper.min.js"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
 <script src="js/jquery.1.11.1.js"></script>
    <script src="js/idangerous.swiper.min.js"></script> 
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/swiper.min.css" rel="stylesheet" type="text/css">
    <link rel='stylesheet' href='css/list-style.css'>
    <link rel='stylesheet' href='css/index.css'>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="format-detection" content="telephone=no" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no;" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta charset="utf-8">
<title>逗留维修</title>
<style>
.header_left img{ width:18px; height:auto; position:absolute; left:4%; top:2px; margin-left:36px;}
.header_left{ font-size:16px;}
/*****banner焦点图*********/
.banner_box{ width:320px; height:114px; margin:auto;}
.banner_box #banner img{ width:320px; height:100%}
.swiper-pagination-bullet{ background:#fff; opacity:0.6;}
.swiper-pagination-bullet-active{ background:#fff; opacity:1;}
.swiper-container-horizontal>.swiper-pagination-bullets{ bottom:3px; left:auto; right:4%; width:55px;}

@media screen and (max-width: 768px) {
.banner_box{ width:100%; }
.banner_box #banner img{ width:100%;}
	}
/*常用服务*/
.regularly_title{ width:22%; height:41px; line-height:41px; position:relative; margin-left:auto; margin-right:auto; text-align:center; color:#b2bab8;}
.regularly_title .border_top{ width:160%; top:20px;}
/*日常保洁*/
.daily{ height:105px; background-color:#fff; position:relative; background-image:url(images/hot.png); background-size:40px auto; background-position:left top; background-repeat:no-repeat;}
.daily_img{ width:72px; height:auto; float:left; margin-left:7.5%; margin-top:17px;}
.daily h1{ line-height:30px; font-size:18px; color:#191919; margin-top:23px;}
.daily p{ line-height:28px; font-size:16px; color:#b2bab8;}
/*地板打蜡、窗户全面清洁、皮具打蜡*/
.other{ height:105px; position:relative; background-color:#fff; margin-top:12px;}
.floor,.window,.leather{ width:33.3%; float:left; position:relative;}
.other img{ width:48px; height:auto; position:relative; left:50%; margin-left:-24px; margin-top:14px;}
.other_title{ line-height:43px; text-align:center; color:#191919; font-size:14px;}
.other .border_right{ height:77px; top:14px;}
/*服务介绍、会员充值*/
.introduce_box{ height:46px; background-color:#fff; position:relative; margin-bottom:15px;}
.introduce_box .border_right{ height:33px; top:7px;}
.member,.introduce{ float:left; position:relative; width:50%;}
.introduce_box img{ width:25px; height:auto; float:left; margin-left:27%; margin-top:12px;}
.introduce_box h1{ line-height:46px; float:left; margin-left:6%; font-size:14px; color:#65646b;}
/*底部导航*/
.nav_box{ width:100%; height:51px; position:fixed; left:0; bottom:0; background-color:#fff;z-index: 99999;}
.nav_index,.nav_order,.nav_my{ width:33.3%; float:left;}
.nav_box img{ width:18px; height:auto; position:relative; left:50%; margin-left:-9px; margin-top:8px;}
.nav_box h1{ font-size:12px; text-align:center; color:#65646b; line-height:25px;}
.nav_box .current_nav{ color:#01aff0;}
</style>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css">
</head>

<body style="background-color: #f9f9f9;">
<div style="margin-bottom: 51px">
<!--header顶部标题-->
<div class="header">首页
	<div class="header_left">南昌<img src="images/triangle.png"></div>
    <div class="header_right"><a href="tel://15156085860" ><img src="images/phone_index.png"></a></div>
</div>
<!--banner广告-->
<div class="banner_box swiper-container">
	<div id="banner" class="swiper-wrapper">
    	<div class="swiper-slide"><img src="images/banner.png"></div>
        <div class="swiper-slide"><img src="images/banner.png"></div>
        <div class="swiper-slide"><img src="images/banner.png"></div>    
    </div> 
    <div class="swiper-pagination"></div>     
</div>
<!--常用服务-->
<div class="regularly_title">常用服务
	<div class="border_top" style="left:-160%;"></div>
    <div class="border_top" style="left:inherit;right:-160%;"></div>
</div>
<!--日常保洁-->
<div class="daily" onclick="document.location='cleaning_index.html';">
	<div class="border_top"></div>
        <img src="images/az.png" class="daily_img">
        <div style="float:left; margin-left:13px;">
        	<h1>租赁保险箱</h1>
          
        </div>
    <div class="border_bottom"></div>
</div>
<!--地板打蜡、窗户全面清洁、皮具打蜡-->
<div class="other">
	<!--地板打蜡-->
	<div class="floor" onclick="document.location='go_floor.do?uid=${userEntity.u_id}&type=1';">
    	<div class="border_right"></div>
        <img src="images/key.png">
        <div class="other_title">钥匙丢失</div>
    </div>
    <!--窗户全面清洁-->
    <div class="window" onclick="document.location='go_floor.do?uid=${userEntity.u_id}&type=2';">
    	<div class="border_right"></div>
        <img src="images/wx.png">
        <div class="other_title">保险箱换锁</div>
    </div>
    <!--保险箱清洁-->
    <div class="leather" onclick="document.location='go_floor.do?uid=${userEntity.u_id}&type=3';">
        <img src="images/icon5.png">
        <div class="other_title">密码重置</div>
    </div>
    <div class="border_top"></div>
    <div class="border_bottom"></div>
</div>
<div class="other">
	<!--地板打蜡-->
	<div class="floor" onclick="document.location='go_floor.do?uid=${userEntity.u_id}&type=4';">
    	<div class="border_right"></div>
        <img src="images/dormitory.png">
        <div class="other_title">调换寝室</div>
    </div>
    <!--窗户全面清洁-->
    <div class="window" onclick="document.location='go_floor.do?uid=${userEntity.u_id}&type=5';">
    	<div class="border_right"></div>
        <img src="images/security.png">
        <div class="other_title">租赁到期</div>
    </div>
    <!--保险箱清洁-->
    <div class="leather" onclick="go_qitafuwu()">
        <img src="images/otherservice.png">
        <div class="other_title">其他服务</div>
    </div>
    <div class="border_top"></div>
    <div class="border_bottom"></div>
    <input type="hidden" name="uid" value="${userEntity.u_id}"/>
</div>

</div>

<div class="nav_box">
	<div class="border_top"></div>
	<div class="nav_index chenge" onclick="document.location='go_index.do?uid=${userEntity.u_id}';">
    	<img src="images/index_blue.png">
        <h1 style=" color:#01AFF0">首页</h1>
    </div>
    <div class="nav_order chenge" onclick="document.location='go_myorder.do?uid=${userEntity.u_id}';" >
    	<img src="images/order_gray.png">
        <h1>订单</h1>
    </div>
    <div class="nav_my chenge" onclick="document.location='go_indexcenter.do?uid=${userEntity.u_id}';" >
    	<img src="images/my_gray.png">
        <h1>我的</h1>
    </div>
</div>
<script>
$(".statement").hide();
$(".black").hide();
$(".introduce").click(function(){
	$(".statement").show();
$(".black").show();
	});
$(".close").click(function(){
	$(".statement").hide();
    $(".black").hide();
	})	
	
	
//banner
 var swiper=new Swiper('.swiper-container',{
	    pagination: '.swiper-pagination',
        paginationClickable: true,
		autoplay : 3000,
        speed:300,
		autoplayDisableOnInteraction : false,
		loop : true,
	 }
 	
 );
//底部导航
$(".chenge:eq(0)").click(function(){
	$(".chenge:eq(0) img").attr("src","images/index_blue.png");
	$(".chenge:eq(0) h1").css({color:'#01AFF0'});
	$(".chenge:eq(1) img").attr("src","images/order_gray.png");
	$(".chenge:eq(1) h1").css({color:''});
	$(".chenge:eq(2) img").attr("src","images/my_gray.png");
	$(".chenge:eq(2) h1").css({color:''});
	})
$(".chenge:eq(1)").click(function(){
	$(".chenge:eq(1) img").attr("src","images/order_blue.png");
	$(".chenge:eq(1) h1").css({color:'#01AFF0'});
	$(".chenge:eq(0) img").attr("src","images/index_gray.png");
	$(".chenge:eq(0) h1").css({color:''});
	$(".chenge:eq(2) img").attr("src","images/my_gray.png");
	$(".chenge:eq(2) h1").css({color:''});	
	
	})
$(".chenge:eq(2)").click(function(){
	$(".chenge:eq(2) img").attr("src","images/my_blue.png");
	$(".chenge:eq(2) h1").css({color:'#01AFF0'});
	$(".chenge:eq(0) img").attr("src","images/index_gray.png");
	$(".chenge:eq(0) h1").css({color:''});	
	$(".chenge:eq(1) img").attr("src","images/order_gray.png");
	$(".chenge:eq(1) h1").css({color:''});	
	})
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
 <!--列表滑动-->
 <script>
    var mySwiper = new Swiper('#swiper-container',{
        autoHeight: true,
        onSlideChangeStart: function(){
          $(".tabs .default").removeClass('default');
          $(".tabs li").eq(mySwiper.activeIndex).addClass('default');
        }
    });
    
     $(".tabs li").on('click',function(e){
        e.preventDefault();
        $(".tabs .default").removeClass('default');
        $(this).addClass('default');
        mySwiper.swipeTo($(this).index());

      });

      $(".tabs li").click(function(e){

        e.preventDefault();

      });

function go_qitafuwu(){

  var name = prompt("请输入您需要服务的内容", "");
   if(name!=null&&name!="")
window.location.href="go_floor.do?uid=${userEntity.u_id}&type="+name;

}

    </script>
</body>
</html>

