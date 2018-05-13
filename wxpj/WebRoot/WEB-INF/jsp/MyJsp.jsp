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
<link href="css/css.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="format-detection" content="telephone=no" />
<meta charset="utf-8">

<title>${title}</title>
<style>
.success{ width:92%; height:120px; background:#fff; position:fixed; top:40%; left:4%; z-index:1000;text-align:center; color:#191919; font-size:18px; padding-top:20px;}
.success button{ display:block; margin:auto; color:#fff; background:#01AEF0; font-size:18px; width:150px; height:50px; border-radius:3px; margin-top:20px;}
</style>
</head>
<body style="background-color: #f9f9f9;">
<!--header顶部标题-->
<div class="header">${head_title}
	<div class="header_left" onClick="window.history.go(-1)"><img src="images/return.png"></div>
</div>
<!--充值成功：立即下单-->
<div class="black"></div>
<div class="success">${text}
	<a href="${href}"><button>${button}</button></a>
</div>
</body>
</html>

