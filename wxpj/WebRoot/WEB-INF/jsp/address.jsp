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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="format-detection" content="telephone=no" />
<meta charset="utf-8">
<title>我的地址</title>
<style>
/*address地址*/
.address{ height:100px; padding-left:4%; padding-right:4%; position:relative; margin-top:14px; background-color:#fff; padding-top:9px; box-sizing:border-box}
.address h1{ font-size:14px; line-height:21px; color:#191919;}
.address h2{ font-size:14px;  color:#65646b;}
.address h3{ font-size:14px; line-height:18px; color:#b2bab8;}
.address p{line-height:41px; position:absolute; right:4%; top:0; background-image:url(images/block.png); background-size:13px 13px; background-position:left center; background-repeat:no-repeat; padding-left:20px;}
.delete{ width:20%; height:74px; line-height:74px; background-color:#c40000; color:white; font-size:18px; text-align:center; position:absolute; top:0; right:0}
</style>
</head>

<body style="background-color: #f9f9f9;">
<!--header顶部标题-->
<div class="header">服务地址
	<div class="header_left"  onclick="window.history.go(-1)"><img src="images/return.png"></div>
    <div class="header_right" id="edit" onClick="onedit()">编辑</div>
</div>
<!--address地址-->
<c:forEach  items="${addressList}" var="entity"  >
<div class="address" id="${ entity.a_id}">
	<div class="border_top"></div>
    	<input type="hidden" name="a_id" value="${ entity.a_id}">
    	<h1><c:out value="${entity.a_xuexiao }"></c:out></h1>
    	<h1><c:out value="${entity.a_xiaoqu}"></c:out></h1>
        <h2>联系人：<span><c:out value="${entity.a_name}"></c:out></span>&nbsp;&nbsp;&nbsp;&nbsp;电话：<span><c:out value="${entity.a_tel}"></c:out></span></h2>
        <h2>地址：<span><c:out value="${entity.a_address}"></c:out></span></h2>
        <div class="delete">删除</div>
    <div class="border_bottom"></div>
</div>
<input type="hidden" id="type1" name="type" value="${type }">
</c:forEach>
<!--column添加新地址-->
<div class="column_box" style="margin-top:14px;" onclick="document.location='go_addressadd.do?uid=${userEntity.u_id}&type=${type }';">
	<div class="border_top"></div>
	<div class="column_img"><img src="images/add.png"></div>
    <p>添加新地址</p>
    <div class="next"><img src="images/arrow.png"></div>
    <div class="border_bottom"></div>
</div>
<script>
$(".delete").hide();
function onedit(){
	var a=document.getElementById('edit').innerText;
	if(a=="编辑"){
		$(".delete").show();
		document.getElementById('edit').innerText="取消"
		}else if(a=="取消"){
			$(".delete").hide();
			document.getElementById('edit').innerText="编辑"
			}
	}
$(".delete").click(
	function(){
	var	id=$(this).parent().attr('id');
	
$(this).parent().remove();
		  $.ajax({
            url : "addressdelete.do",    //目标地址
            data : "a_id=" +id+"&uid=${userEntity.u_id}",    //传输的数据
            type : "POST",      // 用POST方式传输 
            dataType : "text",    // 数据格式
            success : function(data) {}
            });
		
		}
);

$(".address").click(
	function(){
	var id=$(this).attr('id');
	var type=$("#type1").val();
	if(type!="")
	{
	window.location.href="go_floor.do?uid=${userEntity.u_id}&type=${type}&a_id="+id;
	}
	
	});
</script>
</body>
</html>

