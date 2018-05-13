<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<script src="js/jquery.js"></script>
<link href="css/css.css" rel="stylesheet" type="text/css">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="format-detection" content="telephone=no" />
<meta charset="utf-8">
<title>添加地址</title>
<style>
/*地址输入框*/
.column_box input{ line-height:46px; color:#191919; font-size:14px; float:left; margin-left:12px;}
</style>
</head>

<body style="background-color: #f9f9f9;">
<!--header顶部标题-->
<div class="header">添加服务地址
	<div class="header_left" onclick="window.history.go(-1)"><img src="images/return.png"></div>
</div>
<form action="addressadd.do?uid=${userEntity.u_id }" method="post">
<!--column搜索小区-->
  <div class="column_box"> 
  <div class="column_img"><img src="images/adrress_2.png"></div>
  <select  onChange="getcampus()" name="a_xuexiao" style="margin-top:5px" class="login-name" id="school">
         <option value ="0" style="color: #b6b6b6" disabled selected>请选择所在大学</option>
         <option value ="南昌大学">南昌大学</option>
         <option value="东华理工大学">东华理工大学</option>
      </select>
       <div class="border_bottom"></div>
       </div>
   <div class="column_box">
   <div class="column_img"><img src="images/adrress_2.png"></div>
    <select name="a_xiaoqu" style="margin-top:5px" class="login-name" id="campus">
         <option value ="0" style="color: #b6b6b6" disabled selected>请选择所在校区</option>
      </select>
       <div class="border_bottom"></div>
      </div>
<!--column详细地址-->
<div class="column_box">
	<div class="column_img"><img src="images/adrress_2.png"></div>
    <input placeholder="详细地址，如xx号楼xx单元xx室" name="a_address" id="a_address"></input>
    <div class="border_bottom"></div>
</div>
<!--acreage面积-->

<!--column联系人-->
<div class="column_box">
	<div class="column_img"><img src="images/people.png"></div>
    <input placeholder="联系人" name="a_name" id="a_name"></input>
    <div class="border_bottom"></div>
</div>
<!--column电话-->
<div class="column_box">
	<div class="column_img"><img src="images/phone.png"></div>
    <input placeholder="联系电话" type="number" id="a_tel" name="a_tel"></input>
    <div class="border_bottom"></div>
</div>
<!--confirm确认添加-->
	<input class="confirm"  disabled="disabled" type="submit" id="confirm" value="确认添加"></button>
	<input type="hidden" name="type" value="${type }">
	</form>
	<script type="text/javascript">  
    //定义一个二维数组  
        var campus=[  
         ["前湖校区1至18栋","前湖校区天健园","前湖校区医学院","东湖校区医学院","青山湖北区软件学院","青山湖南区科技学院","鄱阳湖校区共青学院"],  
		["广兰南区","广兰西区","广兰研1","广兰研2","枫林校区","学府校区（抚州本部）","玉茗校区（抚州南区）","晏殊校区（抚州北区）"]
        ];  
		function getcampus(){  
	
            var sltschool=document.getElementById("school"); //获得国家下拉框的对象  
            var sltcampus=document.getElementById("campus");     //获得城市下拉框的对象  
           
    
            var school=campus[sltschool.selectedIndex-1];    //得到对应国家的城市数组 
            sltcampus.length=1;    //清空城市下拉框，仅留提示选项。  
            //通过for循环，将城市中的值填充到城市下拉框中  
            for(var i=0;i<school.length;i++){  
                sltcampus[i+1]=new Option(school[i],school[i]);  
            }  
        } 

var i=0;
var x=0;
$(".area_box").click(function(){//点击下拉列表
	
	if(i==0){$(".area_box").animate({height:'187px'});i=1;}else{$(".area_box").animate({height:'32px'}); i=0;}//显示隐藏选项
	});
$(".box").click(function(){//点击选项：切换背景颜色
	$(this).css("background-color","#CCCCCC").siblings().css("background-color","#fff");
	$(".chenge").html($(this).html());//点击选项：替换文本
	});
	$("input").keyup(function(){
	
	
	if($("#a_address").val()!=""&&$("#a_name").val()!=""&&$("#a_tel").val()!=""){
 
    $("#confirm").attr('disabled',false);
    $("#confirm").css('color','#FFFFFF');
    $("#confirm").css('background-color','#01aff0');
}else{
  $("#confirm").attr('disabled',true);
    $("#confirm").css('background-color','#999');
}

});
</script>
</body>
</html>
