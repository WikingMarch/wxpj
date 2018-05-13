<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<script src="js/jquery.js"></script>
<link href="css/css.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="format-detection" content="telephone=no" />
<meta charset="utf-8">
<title>我的订单</title>
<style>
/*订单状态*/
.state_box{ height:43px; position:relative}
.state{ float:left; width:50%; line-height:43px; color:#65646b; font-size:14px; text-align:center}
.blue_block{ width:50%; position:absolute; left:0; bottom:0; height:2px; background-color:#01aff0;}
/*订单信息*/
.move_box{ width:100%; overflow:hidden}
.move{ width:500%; position:relative; clear:both; left:0}
.order_box{ float:left; width:20%;}
.order{ height:133px; position:relative; background-color:#fff; margin-bottom:14px;}
.order_title{ line-height:40px; color:#191919; padding-left:4%; font-size:16px;}
.order_text{ width:92%; margin-left:4%; position:relative; height:53px; padding-top:5px; box-sizing:border-box}
.order_text h1,.order_text h2{ line-height:20px; color:#191919; font-size:14px;}
.order_text p{ position:absolute;top:0;right:0; line-height:53px; color:#65646b; font-size:16px;}
.cancel{ width:65px; height:25px; border:1px solid #ccc; text-align:center; line-height:25px; border-radius:3px; float:right; margin-top:6px; margin-right:4%; color:#65646b;}
/*底部导航*/
.nav_box{ width:100%; height:51px; position:fixed; left:0; bottom:0; background-color:#fff;}
.nav_index,.nav_order,.nav_my{ width:33.3%; float:left;}
.nav_box img{ width:18px; height:auto; position:relative; left:50%; margin-left:-9px; margin-top:8px;}
.nav_box h1{ font-size:12px; text-align:center; color:#65646b; line-height:25px;}
.nav_box .current_nav{ color:#01aff0;}

.move_box img{ width:80px; height:80px; margin:auto}
.move_box p{ font-size:16px; color:#9A9A9A; padding-top:16px; padding-bottom:16px;}
.move_box button{ width:80px; height:30px; background:#01AEF0; color:#fff; border-radius:5px; font-size:18px;}
</style>
</head>

<body style="background-color: #f9f9f9;">
<!--header顶部标题-->
<div style="margin-bottom: 51px">
<div class="header">我的订单
	<div class="header_left" onclick="window.history.go(-1)"><img src="images/return.png"></div>
</div>
<!--订单状态-->
<div class="state_box">
    <div class="state">等待接单</div>
    <div class="state">已完成</div>
    <div class="blue_block"></div>
</div>
<!--订单信息-->
<div class="move_box">
<div class="move">

    <!--未付款-->
   
    <div class="order_box">
    
      <c:if test="${orderList1==null || fn:length(orderList1) == 0}">
      <div class="move_box"  style="width:100%; text-align:center; padding-top:100px;">
	<img src="images/order-none.fw.png">
    <p>您暂时没有相关的订单</p>

</div>
      </c:if>
    
    <c:forEach items="${orderList1}" var="item">
      
        <div class="order" id="${item.d_id }">
            <div class="border_top"></div>
            <div class="order_title">${item.d_type}</div>
            <div class="order_text" onClick="document.location='order.html';">
                <div class="border_top"></div>
                <h1>预约时间：${item.d_time}</h1>
                <h2>预约地点：${item.d_address}</h2>
                <p></p>
                <div class="border_bottom"></div>
            </div>
           <c:if test="${item.d_state==0 }"> <div class="cancel"  style="border:1px solid #01aff0; color:#01aff0;">确认接单</div></c:if>
             <c:if test="${item.d_state==1 }"> <div class="cancel"  style="border:1px solid #01aff0; color:#01aff0;">确认上门</div></c:if>
               <c:if test="${item.d_state==2 }"> <div class="cancel" style="border:1px solid #01aff0; color:#01aff0;" >确认维修完成</div></c:if>
            <div class="border_bottom"></div>
        </div>
    
 </c:forEach>
 </div>
    <!--待评价-->
    <div class="order_box">
    
    
          <c:if test="${orderList2==null || fn:length(orderList2) == 0}">
      <div class="move_box" style="width:100%; text-align:center; padding-top:100px;">
	<img src="images/order-none.fw.png">
    <p>您暂时没有相关的订单</p>
 <a href="go_index.do?uid=${userEntity.u_id }"> <button>去下单</button></a>
</div>
      </c:if>
       <c:forEach items="${orderList2}" var="item">
        <div class="order" >
            <div class="border_top"></div>
            <div class="order_title">${item.d_type}</div>
            <div class="order_text" onClick="document.location='order.html';">
                <div class="border_top"></div>
                <h1>预约时间：${item.d_time}</h1>
                <h2>预约地点：${item.d_address}</h2>
                <p></p>
                <div class="border_bottom"></div>
            </div>
            <div class="cancel" style="border:1px solid #01aff0; color:#01aff0;" onclick="document.location='evaluate.html';event.stopPropagation();">评价</div>
            <div class="border_bottom"></div>
        </div>
       
       </c:forEach>
        
     
    </div>
</div>
</div>

<input type="hidden" name="uid" value="${userEntity.u_id}"/>
<!--底部导航-->

<div class="nav_box">
	<div class="border_top"></div>
	    <div class="nav_my chenge" onclick="document.location='go_indexcenter.do?uid=${userEntity.u_id}';" >
    	<img src="images/my_gray.png">
        <h1>我的</h1>
    </div>
    <div class="nav_index chenge" >
    	<img>
        <h1 style=" color:#01AFF0"></h1>
    </div>
    <div class="nav_order chenge" onclick="document.location='go_myorder.do?uid=${userEntity.u_id}';" >
    	<img src="images/order_gray.png">
        <h1>订单</h1>
    </div>

</div>
<script>
$(".state:eq(0)").click(
	function(){
		$(".blue_block").animate({left:'0%'});
		$(".move").css("left","0%");
		}
);
$(".state:eq(1)").click(
	function(){
		$(".blue_block").animate({left:'50%'});
		$(".move").css("left","-100%");
		}
);

$(".cancel").click(function() {
	var	id=$(this).parent().attr('id');
	
$(this).parent().remove();
		  $.ajax({
            url : "orderdelete.do",    //目标地址
            data : "d_id=" +id+"&uid=${userEntity.u_id}",    //传输的数据
            type : "POST",      // 用POST方式传输 
            dataType : "text",    // 数据格式
            success : function(data) {}
            });


});

</script>
</body>
</html>

