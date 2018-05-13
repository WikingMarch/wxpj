<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="js/swiper.min.js"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
 <script src="js/jquery.1.11.1.js"></script>
 <script src="js/idangerous.swiper.min.js"></script> 
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/swiper.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css">
    <link rel='stylesheet' href='css/list-style.css'>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="format-detection" content="telephone=no" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no;" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta charset="utf-8">
<style>
.swiper-pagination-bullet{ background:#fff; opacity:0.6;}
.swiper-pagination-bullet-active{ background:#fff; opacity:1;}
.swiper-container-horizontal>.swiper-pagination-bullets{ bottom:3px; left:auto; right:4%; width:55px;}
.move_box{ width:100%; text-align:center; padding-top:100px;}
.move_box img{ width:80px; height:80px; margin:auto}
.move_box p{ font-size:16px; color:#9A9A9A; padding-top:16px; padding-bottom:16px;}
.move_box button{ width:80px; height:30px; background:#01AEF0; color:#fff; border-radius:5px; font-size:18px;}
</style>
<title>维修人员</title>
</head>

<body>
<div class="header">维修人员
	<div class="header_left"  onclick="window.history.go(-1)"><img src="images/return.png"></div>
</div>

 <div class="swiper-container favor-list" id="swiper-container" style="margin-bottom:30px;">
        <div class="swiper-wrapper">
           
           <c:if test="${wxrList==null || fn:length(wxrList) == 0}">
           
           <div class="move_box">
	<img src="images/order-none.fw.png">
    <p>此地区暂时没有维修人员</p>
   <a href="javascript:history.back()" class=""> <button >返回</button></a>
</div>
           
           </c:if>
           
           
           
           
       <c:forEach  items="${ wxrList}" var="wxr">    
           
            <div class="swiper-slide">
      <a href="go_wxydetail.do?uid=${userEntity.u_id}&w_id=${wxr.w_id}">
                    <dl>
                        <dt>
                            <img src="images/head/pic${wxr.w_headimg}.jpg" height="140px">
                            <span></span>
                        </dt>
                        <dd>
                            <h2>${wxr.w_name}</h2>
                            <p>评分：<span class="list-p">${ wxr.w_score}</span></p>
                            <p>排队人数：<span class="list-p">${ wxr.w_state}</span></p>
                           
                            <small>接单率${ wxr.w_accept}%</small>
                        </dd>
                    </dl>    
                </a>
           
        <div class="confirm"  title="${wxr.w_name}"  id="${wxr.w_id}" style=" background-color:#FF7F00">预约</div>
      
       </div>
        </c:forEach>
   
   
   </div>
 </div>
   
   
       <script>
	  /*   var swiper=new Swiper('.swiper-container',{
	    pagination: '.swiper-pagination',
        paginationClickable: true,
		autoplay : 3000,
        speed:300,
		autoplayDisableOnInteraction : false,
		loop : true,
	 }
 	
 ); 
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
      }); */
      
      $(".confirm").click(function (e){
      var id=$(this).attr('id');
    //  alert();
      window.location.href="go_floor.do?uid=${userEntity.u_id}&type=${type}&a_id=${a_id}&w_id="+id+"&w_name="+$(this).attr('title');
      });
      
	</script>
</body>
</html>
