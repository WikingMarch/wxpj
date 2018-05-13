<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>商家详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <script src="js/wxy/rem.js"></script> 
    <script src="js/wxy/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/wxy/base.css"/>
    <link rel="stylesheet" type="text/css" href="css/wxy/page.css"/>
    <link rel="stylesheet" type="text/css" href="css/wxy/all.css"/>
    <link rel="stylesheet" type="text/css" href="css/wxy/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/wxy/loaders.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/wxy/loading.css"/>
    <link rel="stylesheet" type="text/css" href="css/wxy/slick.css"/>
<script type="text/javascript">
 	$(window).load(function(){
		$(".loading").addClass("loader-chanage");
		$(".loading").fadeOut(3);
	}); 
</script>
</head>
<!--loading页开始-->
<div class="loading">
	<div class="loader">
        <div class="loader-inner pacman">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
	</div>
</div>
<!--loading页结束-->
	<body>
		<!--header star-->
		<header class="mui-bar mui-bar-nav mui-bar-nav2" id="header">
			<a class="btn" href="javascript:history.go(-1)">
	            <i class="iconfont icon-fanhui"></i>
	        </a>
	        <div class="top-sch-box top-sch-boxtwo top-sch-boxfour flex-col">
	                      维修员详情
	        </div>
	   </header>
	    <!--header end-->
	    
	    <div class="warp warpthree clearfloat">
	    	<div class="sjdetail clearfloat">
	    		<div class="top clearfloat box-s">
	    			<div class="tu clearfloat fl ra5">
	    				<img src="images/head/pic${wxrEntity.w_headimg}.jpg"/>
	    			</div>
	    			<div class="nr clearfloat fr">
	    				<ul>
	    					<li>${wxrEntity.w_name}</li>
	    					<li><i class="iconfont icon-shouji"></i>${wxrEntity.w_tel}</li>
	    					<li><i class="iconfont icon-dizhi1"></i>${wxrEntity.w_xuexiao}${wxrEntity.w_xiaoqu}</li>
	    				</ul>
	    			</div>
	    		</div>
	    		<div class="middle clearfloat">
	    			<p class="box-s">服务介绍</p>
	    			<div class="nr clearfloat box-s">
	    				<ul>
	    					<li>&nbsp;&nbsp;&nbsp;&nbsp;1、维修人维修经验丰富，完全能帮助您解决难题。</li>
	    					<li>&nbsp;&nbsp;&nbsp;&nbsp;2、如果您觉得服务不满意可以退款申诉，我们将尽快帮您解决。</li>
	    					<li>&nbsp;&nbsp;&nbsp;&nbsp;3、主要负责南昌前湖片区的保险箱维修服务，其他地方由于位置太远，暂不受理其他区域的保险箱维修服务，望您见谅，谢谢！</li>
	    				</ul>
	    			</div>
	    		</div>
	    		<div class="sjtab">
					<div class="tab-hd">
						<ul class="tab-nav">
						  <li><a href="#">商品介绍</a></li>
						  <li><a href="#">服务评价</a></li>
						</ul>
					</div>
					<div class="tab-bd box-s">
						<div class="tab-pal">
							<img src="upload/bxx/bxx01.jpg"/>
							<img src="upload/bxx/bxx02.jpg"/>
						</div>
						<div class="tab-pal">
							<div class="list clearfloat fl box-s">
								<div class="shang clearfloat fl">
									<div class="tu clearfloat fl">
										<img src="upload/20.jpg"/>
									</div>
									<span class="fl ming">疯狂小田</span>
									<span class="time fr">2016-07-26  14:22</span>
								</div>
								<div class="xia clearfloat box-s">
									服务周到，做事效率高！关键维修人员服务还很好！赞一个
								</div>
							</div>
							<div class="list clearfloat fl box-s">
								<div class="shang clearfloat fl">
									<div class="tu clearfloat fl">
										<img src="upload/20.jpg"/>
									</div>
									<span class="fl ming">疯狂小田</span>
									<span class="time fr">2016-07-26  14:22</span>
								</div>
								<div class="xia clearfloat box-s">
									服务周到，做事效率高！关键维修人员服务还很好！赞一个
								</div>
							</div>
							<div class="list clearfloat fl box-s">
								<div class="shang clearfloat fl">
									<div class="tu clearfloat fl">
										<img src="upload/20.jpg"/>
									</div>
									<span class="fl ming">疯狂小田</span>
									<span class="time fr">2016-07-26  14:22</span>
								</div>
								<div class="xia clearfloat box-s">
									服务周到，做事效率高！关键维修人员服务还很好！赞一个
								</div>
							</div>
						</div>						
					</div>
				</div>
				
	    	</div>
	    </div>
	</body>
	<script type="text/javascript" src="js/wxy/jquery-1.8.3.min.js" ></script>
	<script src="js/wxy/jquery.SuperSlide.2.1.js" type="text/javascript" ></script>
	<script type="text/javascript">
		jQuery(".sjtab").slide({ titCell:".tab-hd li", mainCell:".tab-bd",delayTime:0 });
	</script>
</html>
