<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!doctype html>
<html>
<head>
<script src="js/jquery.js"></script>
<link href="css/css.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="format-detection" content="telephone=no" />
<title>类型</title>
<style>
/*service服务*/
.service_box{ height:48px; position:relative; margin-top:14px; padding-top:7px;box-sizing:border-box}
.service{width:92%; height:33px; line-height:33px; color:#191919; border:1px solid #d3d3d3; border-radius:3px; box-sizing:border-box; text-align:center; font-size:14px;margin:auto;}
.checkbox{ border:1px solid#01AFF0;}
.add_service{ clear:both; line-height:37px; height:37px; width:20%; margin-left:40%; position:relative; text-align:center;}
/*合计*/
.total_box{padding-top:24px; height:168px; box-sizing:border-box}
.total_box h1{ font-size:12px; text-align:center; line-height:18px; color:#65646b;}
.total_box p{ font-size:22px; color:#c40000; text-align:center; line-height:33px;}
/*address地址*/
.address{ padding-left:4%; position:relative; background-color:#fff; padding-top:9px; padding-bottom:9px; box-sizing:border-box}
.address img{ float:left; margin-top:14px; width:18px; height:auto}
.address_text{ float:left; margin-left:12px;}
.address h1{ font-size:14px; line-height:21px; color:#191919;}
.address h2{ font-size:14px; line-height:18px; color:#65646b;}
.address h3{ font-size:14px; line-height:18px; color:#b2bab8;}
/***********选择服务时间:弹出层**********/
#option_time{ width:100%; height:100%; top:0; right:0; position:absolute; background:#fff;}
.week_box{ height:62px; background-color:#fff; position:relative; margin-bottom:8px;}
.week{ height:62px; width:14.3%; float:left}
.week h1{ line-height:22px; font-size:14px; text-align:center; margin-top:11px;}
.week h2{ line-height:19px; font-size:12px; color:#65646b; text-align:center;}
.blue{ width:14.3%; position:absolute; left:0; bottom:0; height:2px; background-color:#01aff0;}
.time_box{ margin-bottom:80px;}
.time{ width:20%; float:left; margin-left:4%; margin-top:6px; border:1px solid #ccc; border-radius:3px; text-align:center; line-height:40px; height:40px; color:#b2bab8; box-sizing:border-box;}
.option {
    border: 1px solid #01aff0;
    color:#191919;
    background-image:url(images/checkbox.png);
    background-size: 12px 12px;
    background-position: right bottom;
    background-repeat: no-repeat;
}
/*保洁剂弹出层*/
.detergent{ position:absolute; width:100%; height:100%; top:0px; left:0px; z-index:2000; background:#fff;}
.hot_title{height:20px; line-height:20px; color:#65646b; padding-left:14px; box-sizing:border-box; position:relative; font-size:14px; background-color:#f9f9f9;}
.agentia_box{ width:100%; position:relative; float:left}
.agentia{ height:75px; background-color:#fff; position:relative}
.agentia_img{ width:47px; height:47px; margin-left:4%; background-color:#737cd9; float:left; margin-top:14px;}
.agentia_text{ float:left; margin-left:13px;}
.agentia_text h1{ font-size:14px; line-height:18px; color:#191919; margin-top:11px;}
.agentia_text h2{ font-size:12px; line-height:16px; color:#65646b;}
.agentia_text h3{ font-size:14px; line-height:18px; color:#c40000;}
.reduce,.add{ width:20px; height:20px; position:absolute;right:14px;top:27px;}
.amount{ width:20px; height:20px; position:absolute; right:14px; top:27px; color:#191919; line-height:20px; text-align:center}
/*cart底部购物车*/
.cart_box{ position:absolute; bottom:0; left:0; background-color:#f9f9f9; width:100%;}
.cart_title{ padding-left:4%; line-height:33px; color:#191919; position:relative; background-color:#fff;}
.cart_pro{ height:42px;}
.cart_pro h1{ float:left; line-height:42px; margin-left:4%; color:#191919;}
.cart_pro h2{ float:left; line-height:42px; margin-left:20%; color:#c40000; }
.cart_pro img{ float:right; width:20px; height:auto; margin-top:11px;}
.cart_pro p{ float:right; width:25px; height:20px; margin-top:11px; color:#191919; text-align:center}
.cart{ height:47px; position:relative; margin-top:16px; background-color:#fff;}
.cart img{ width:46px; height:46px; position:absolute; left:4%; bottom:17px;}
.sure{ float:right; width:25%; height:47px; background-color:#999; color:white; line-height:47px; text-align:center; font-size:18px;}
.cart p{ color:#c40000; font-size:18px; line-height:47px; float:right; margin-right:6px;}
.cart h1{ color:#191919; font-size:14px; line-height:47px; float:right}
.number{ position:absolute; left:4%; top:-15px; margin-left:34px; height:18px; width:18px; background-color:#c40000; border-radius:50%; line-height:18px; text-align:center; color:white; font-size:12px;}
.margin{ margin-top:16px;}
</style>
</head>

<!--header顶部标题-->
<div class="header"><c:if test="${type eq '0' }">租凭保险箱</c:if><c:if test="${type eq '1' }">钥匙丢失</c:if>
<c:if test="${type eq '2' }">保险箱换锁</c:if><c:if test="${type eq '3' }">密码重置</c:if>
<c:if test="${type eq '4' }">调换寝室</c:if><c:if test="${type eq '5' }">租凭到期</c:if>
	<div class="header_left"  onclick="window.history.go(-1)"><img src="images/return.png"></div>
    <div class="header_right" id="open_sta" onClick="statement()">免责声明</div>
</div>
<!--column服务地址-->
<form id="form1" action="xiadan.do" method="post">
   <c:if test="${type != '1'&&type != '2'&&type != '3'&&type != '4'&&type != '5'}">
<div class="column_box"  >
	<div class="column_img"><img src="images/otherservice.png"></div>

  <input id="stype" type="text" value="${type}" placeholder="请输入您遇到的问题"/>
 
  
    <div class="next"><img src="images/arrow.png"></div>
    <div class="border_bottom"></div>
</div>
  </c:if>
   
<div class="column_box" onclick="document.location='go_address.do?uid=${userEntity.u_id}&type=${type }';" >
	<div class="column_img"><img src="images/adrress.png"></div>
   <c:if test="${addressEntity.a_id eq null }">
    <p>请选择所在的校区</p>
   </c:if>
     <c:if test="${addressEntity.a_id != null }">
    <p>${addressEntity.a_xuexiao}${addressEntity.a_xiaoqu}</p>
   </c:if>
    <div class="next"><img src="images/arrow.png"></div>
    <div class="border_bottom"></div>
</div>
<div class="margin"></div>


<!--服务人员-->
<div class="column_box" onclick="document.location='go_showaddresswxr.do?uid=${userEntity.u_id}&type=${type }&a_id=${addressEntity.a_id }';">
	<div class="column_img"><img src="images/repairman.png"></div>
     <c:if test="${w_id eq null }">
    <p>请选择维修人员</p>
    </c:if>
    <c:if test="${w_id != null }">
    <p>${w_name}</p>
    </c:if>
    <div class="next"><img src="images/arrow.png"></div>
    <div class="border_bottom"></div>
</div>

<!--column服务时间-->
<div class="margin"></div>
<div class="column_box column_ron">
	<div class="column_img"><img src="images/time.png"></div>
    <p id="atext">请选择服务时间</p><span id="btext" style="margin-left:10px; color:#65646b"></span>
    <div class="next"><img src="images/arrow.png"></div>
    <div class="border_bottom"></div>
    <div class="border_top"></div>
</div>
<!--service_box服务-->
<div class="service_box">
	<div class="service checkbox" style=" border:1px #01AFF0 solid; background:#fff;">服务标准
    </div>
</div>
<!--service_cost服务费用-->
<div class="service_cost" >合计：
	<p style=" font-size:14px;color:#c40000;">线下协商<span id="cost" ></span></p>
   
</div>
<!--confirm提交订单-->
<div class="confirm_box">
	<div class="confirm" id="smbit" style="background-color:#01aff0 ">提交订单</div>
</div>
<input id="uid" name="uid" type="hidden" value="${userEntity.u_id}"/>
<input id="a_id" name="a_id" type="hidden" value="${addressEntity.a_id}"/>
<input id="w_id" name="w_id" type="hidden" value="${w_id}"/>
<input id="type" name="type" type="hidden" value="${type}"/>
<input id="time" name="time" type="hidden" value=""/>
</form>


<!--免责声明-->
<div class="black" id="black"></div>
<div class="statement" id="statement">
	<div class="statement_header">免责声明
    	<div class="border_bottom"></div>
    </div>
    <img class="close" onClick="close_sta()" src="images/close.png">
    <div class="statement_text">
    	<h1>1.什么是优惠券？</h1>
        <p>优惠券的获得？优惠券的获得？优惠券的获得？优惠券的获得？</p>
    </div>
    <div class="statement_text">
    	<h1>2.优惠券如何使用？</h1>
        <p>优惠券的获得？优惠券的获得？优惠券的获得？优惠券的获得？</p>
    </div>
    <div class="statement_text">
    	<h1>3.如何获得优惠券？</h1>
        <p>优惠券的获得？优惠券的获得？优惠券的获得？优惠券的获得？</p>
    </div>
    <div class="statement_text">
    	<h1>4.什么是优惠券</h1>
        <p>优惠券的获得？优惠券的获得？优惠券的获得？优惠券的获得？</p>
    </div>
    <div class="statement_text">
    	<h1>5.什么是优惠券</h1>
        <p>优惠券的获得？优惠券的获得？优惠券的获得？优惠券的获得？</p>
    </div>
    <div class="statement_text">
    	<h1>6.什么是优惠券</h1>
        <p>优惠券的获得？优惠券的获得？优惠券的获得？优惠券的获得？</p>
    </div>
</div>
<!--服务标准-->
<div class="standard">
	<div class="standard_header">服务标准
    	<div class="border_bottom"></div>
    </div>
    <img class="close" onClick="close_sta()" src="images/close.png">
    <div class="standard_text">
    	<h1>窗户</h1>
        <p>窗户玻璃无污尘，窗槽干净，无污痕</p>
    </div>
    <div class="standard_text">
    	<h1>客厅及茶几</h1>
        <p>沙发靠垫、靠枕摆放整齐，底部清扫干净，无毛发、无杂物，茶几内茶具摆放整齐，茶水桶倾倒干净，烟灰缸倾倒、刷洗干净后，垫纸、滴水沾湿</p>
    </div>
    <div class="standard_text">
    	<h1>地面</h1>
        <p>地面干净、无水痕、无污痕。玩具、鞋子、凳子等物品要挪起清洁后整齐归位</p>
    </div>
    <div class="standard_text">
    	<h1>鞋柜</h1>
        <p>鞋子统一朝向摆放整齐</p>
    </div>
    <div class="standard_text">
    	<h1>5.什么是优惠券</h1>
        <p>优惠券的获得？优惠券的获得？优惠券的获得？优惠券的获得？</p>
    </div>
    <div class="standard_text">
    	<h1>垃圾桶</h1>
        <p>垃圾桶倾倒后，刷洗干净，套上干净的塑料袋</p>
    </div>
</div>












<!-------------请选择服务时间：弹出层------------->
<div id="option_time">
	<!--header顶部标题-->
    <div class="header">请选择上门时间 </div>
    <div class="week_box">
        <div  class="week">
            <h1 id="w1">今天</h1>
            <h2></h2>
        </div>
        <div class="week">
            <h1>明天</h1>
            <h2></h2>
        </div>
        <div class="week">
            <h1>周四</h1>
            <h2></h2>
        </div>
        <div class="week">
            <h1></h1>
            <h2></h2>
        </div>
        <div class="week">
            <h1>周六</h1>
            <h2></h2>
        </div>
        <div class="week">
            <h1>周日</h1>
            <h2></h2>
        </div>
        <div class="week" style="width:14.2%;">
            <h1>周一</h1>
            <h2></h2>
        </div>
        <div class="blue"></div>
        <div class="border_bottom"></div>
    </div>
    <div class="time_box" id="option_box">
        <div class="time option" >08:00</div>
        <div class="time">08:30</div>
        <div class="time">09:00</div>
        <div class="time">09:30</div>
        <div class="time">10:00</div>
        <div class="time">10:30</div>
        <div class="time">11:00</div>
        <div class="time">11:30</div>
        <div class="time">12:00</div>
        <div class="time">12:30</div>
        <div class="time">13:00</div>
        <div class="time">13:30</div>
        <div class="time">14:00</div>
        <div class="time">14:30</div>
        <div class="time">15:00</div>
        <div class="time">15:30</div>
    </div>
    <!--confirm提交订单时间-->
    <div class="confirm_box">
        <div class="confirm" style=" background-color:#FF7F00">确定</div>
    </div>	
</div>
<script>
//选择窗户、地板、皮具等的面积
setInterval(function(){
	var number=parseInt(document.getElementById("number").value);//找到number输入框转化为数字
	var   cost=parseInt(document.getElementById("cost").innerHTML);//找到cost总价格转化为数字
	document.getElementById("cost").innerHTML=+number*35;//总价格变动
	if(isNaN(number)){document.getElementById("cost").innerHTML=0;}
	if(cost>0){$(".confirm").css("background-color","#FF7F00")}
	},100);
//隐藏免责声明、服务标准
document.getElementById('black').style.display="none";
document.getElementById('statement').style.display="none";
//点击免责声明按钮，显示免责声明
function statement(){
	document.getElementById('black').style.display="block";
	document.getElementById('statement').style.display="block";
	}
//点击关闭按钮，关闭免责声明
function close_sta(){
	document.getElementById('black').style.display="none";
	document.getElementById('statement').style.display="none";
	$(".standard").hide();
	}
$(".service").click(
	function(){
		$(this).toggleClass("checkbox");
		}
)
//隐藏服务地址
$(".address").hide();
$(".standard").hide();
//点击基础服务
$(".service").eq(0).click(
	function(){
		document.getElementById('black').style.display="block";
		$(".standard").show();
		}
)

//选择时间弹出层
//var ar=["今天","明天","周四","周五","周六","周日","周一",]
var ar=new Array();
var day = new Date();
var day1 = new Date();
for(var i=0;i<7;i++)
{
day1.setTime(day.getTime()+i*24*60*60*1000);
  ar[i] = day1.getFullYear()+"-" + (day1.getMonth()+1) + "-" + day1.getDate();

}

$("#w1").innerHTML=ar[0];
$(".week:eq(1)").innerHTML="<h1>"+ar[1]+"</h1>";
$(".week:eq(2)").innerHTML="<h1>"+ar[2]+"</h1>";
$(".week:eq(3)").innerHTML="<h1>"+ar[3]+"</h1>";
$(".week:eq(4)").innerHTML="<h1>"+ar[4]+"</h1>";
$(".week:eq(5)").innerHTML="<h1>"+ar[5]+"</h1>";
$(".week:eq(6)").innerHTML="<h1>"+ar[6]+"</h1>";


var arr=["8:00","8:30","9:00","9:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30"]
var atext=document.getElementById("atext");
var btext=document.getElementById("btext");
var        week=document.getElementsByClassName("week");
var        time=document.getElementsByClassName("time");
//隐藏选择时间
var off=1;
$("#option_time").hide();
$(".column_ron").click(
						function(){$("#option_time").show();
						if(off){ atext.innerHTML="今天";btext.innerHTML="8:00";off=0;}
						})//显示选择时间
$(".confirm").click(function(){$("#option_time").hide()})//隐藏选择时间
//选择几号:点击日期，边框滑动
$(".week:eq(0)").click(function(){$(".blue").animate({left:"0%"});});
$(".week:eq(1)").click(function(){$(".blue").animate({left:"14.3%"})});
$(".week:eq(2)").click(function(){$(".blue").animate({left:"28.6%"});});
$(".week:eq(3)").click(function(){$(".blue").animate({left:"42.9%"})});
$(".week:eq(4)").click(function(){$(".blue").animate({left:"57.2%"});});
$(".week:eq(5)").click(function(){$(".blue").animate({left:"71.5%"})});
$(".week:eq(6)").click(function(){$(".blue").animate({left:"85.7%"});});
for(i=0;i<week.length;i++){
		week[i].index=i;
		week[i].onclick=function(){
			atext.innerHTML=ar[this.index];
			}
	}

//选择具体时间
var option_box=document.getElementById("option_box");
var time=option_box.getElementsByTagName("div");
$(time).click(function(){$(this).addClass("option").siblings().removeClass("option");})
for(x=0;x<time.length;x++){
		time[x].index=x;
		time[x].onclick=function(){
			btext.innerHTML=arr[this.index];
			}
	}


$("#smbit").click(function (e){

var time1=$("#atext").attr("innerHTML")+"	"+$("#btext").attr("innerHTML");
alert(time1);
var wid=$("#w_id").val();
var aid=$("#a_id").val();
if(aid!=''&&wid!=''&&time1!="请选择服务时间")

{$("#time").val(time1);
$("#form1").submit();
}
});


</script>
</body>
</html>





























