<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>注册</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="js/amazeui.min.js"></script>
		<link rel="stylesheet" href="css/amazeui.min.css" type="text/css" />
		<link rel="stylesheet" href="css/style.css" type="text/css" />
	</head>
	<body>
		<header data-am-widget="header" class="am-header am-header-default jz">
		      <div class="am-header-left am-header-nav">
		         <a href="javascript:history.back()" class="">
					<i class="am-icon-chevron-left"></i>
				</a>
		      </div>
		      <h1 class="am-header-title">
		          <a href="#title-link" class="">注册</a>
		      </h1>
        </header>
        <div class="logo"><img src="images/logo.png"/></div>
        <form name="address" id="form1" action="reg.do"  method="post">
        <input style="margin-top::5px" type="text" name="U_Name" id="name" placeholder="请输入姓名" class="login-name">
        <input style="margin-top:5px" type="text" name="u_tel" id="tel" placeholder="请输入手机号" class="login-name">
         <div class="am-input-group" style="width:100%; margin:5px">
        <input type="text" name="code" maxlength="6" id="code" placeholder="请输入验证码" class="login-name">
      	 <span class="am-input-group-btn">
        <button class="am-btn am-btn-primary" id="code_btn" type="button"   value="获取验证码" style="margin-right:10px">获取验证码</button>
      </span>
        </div>
        <select name="U_Syear" style="margin-top:5px" class="login-name" id="time">
         <option value ="0" style="color: #b6b6b6" disabled selected>请选择入学年份</option>
         <option value ="2013">2013</option>
         <option value="2014">2014</option>
          <option value ="2015">2015</option>
         <option value="2016">2016</option>
          <option value ="2017">2017</option>
         <option value="2018">2018</option>
         <option value ="2019">2019</option>
         <option value="2020">2020</option>
      </select>
        <input style="margin-top:5px" type="text" name="u_sid" id="studentno" placeholder="请输入学号" class="login-name">
        
        
        
        <select  onChange="getcampus()" name="u_xuexiao" style="margin-top:5px" class="login-name" id="school">
         <option value ="0" style="color: #b6b6b6" disabled selected>请选择所在大学</option>
         <option value ="南昌大学">南昌大学</option>
         <option value="东华理工大学">东华理工大学</option>
      </select>
       
    <select name="u_xiaoqu" style="margin-top:5px" class="login-name" id="campus">
         <option value ="0" style="color: #b6b6b6" disabled selected>请选择所在校区</option>
      </select>
        
    <input style="margin-top:5px" type="text" name="u_lou" id="building" placeholder="请输入所在楼栋" class="login-name">
        <input style="margin-top:5px" type="text" name="u_room" id="dormitory" placeholder="请输入所在寝室号" class="login-name">
           <input type="password" name="u_password" id="psw1" placeholder="请输入密码" class="login-password">
	    <input type="password" name="password" id="psw2" placeholder="确认密码" class="login-name">
        <div class="agree"><input type="checkbox" name="checkbox"  value="同意" checked="">&nbsp;同意
		<a href="" class="reg1">《逗留维修用户协议》</a></div>
		<input type="button" id="reg_btn" value="立即注册" class="money-btn" >

		<p class="login-text">已有账号,点此<a href="login.html" class="reg">登录</a></p>
</form>
	</body>
    <script type="text/javascript">  
    //定义一个二维数组  
        var campus=[  
         ["前湖校区1至18栋","前湖校区天健园","前湖校区医学院","东湖校区医学院","青山湖北区软件学院","青山湖南区科技学院","鄱阳湖校区共青学院"],  
		["广兰南区","广兰西区","广兰研1","广兰研2","枫林校区","学府校区（抚州本部）","玉茗校区（抚州南区）","晏殊校区（抚州北区）"]
        ];  
		function getcampus(){  
            var sltschool=document.address.school;   //获得国家下拉框的对象  
            var sltcampus=document.address.campus;     //获得城市下拉框的对象  
            var school=campus[sltschool.selectedIndex-1];    //得到对应国家的城市数组 
            sltcampus.length=1;    //清空城市下拉框，仅留提示选项。  
            //通过for循环，将城市中的值填充到城市下拉框中  
            for(var i=0;i<school.length;i++){  
                sltcampus[i+1]=new Option(school[i],school[i]);  
            }  
        } 
     
        
         $(document).ready(function() {
           $("#reg_btn").click(function() {
           
           var tel=$("#tel").val();
       
           var pw1=$("#psw1").val();
            var pw2=$("#psw2").val();
            if(pw1!=pw2)
            {
            alert("两次密码输入不一致请重新输入");
            }else{
            if(pw1=="")
              alert("请输入密码！");
            else{
           if($("#code").val()=="")
           alert("请输入验证码");
           else  if(isPoneAvailable(tel)==false){
        alert("不是合法手机号，请重输！");}
        else
            $("#form1").submit();
            
            }
            }
           
           
           
           });
         
         
    $("#code_btn").click(function() {
        var tel=$("#tel").val();
        if(isPoneAvailable(tel)==false){
        alert("不是合法手机号，请重输！");
        }else{
        
        
         $.ajax({
            url : "sendCode.do",    //目标地址
            data : "tel=" +tel+"&type=0",    //传输的数据
            type : "POST",      // 用POST方式传输 
            dataType : "text",    // 数据格式
            success : function(data) {
                data = parseInt(data, 10);
               if(data==0)
               {
               alert("该手机号已被注册！");
             
               }else
               {
              /*  $("#code_btn").text("10分钟内有效");
                $("#code_btn").attr('disabled','disabled'); */
                
                var btn=$("#code_btn");
                settime(btn);
               } 
            }
      
        });
        }
    });
    
    
}); 

var  countdown=600;
  function settime(obj) { //发送验证码倒计时
  
    if (countdown == 0) { 
     
        obj.attr('disabled',false); 
        //obj.removeattr("disabled"); 
        obj.text("获取验证码");
        countdown = 600; 
        return;
    } else { 
        obj.attr('disabled',true);
        obj.text("重新发送(" + countdown + ")");
        countdown--; 
    } 
setTimeout(function() {settime(obj);},1000);
}      
     function isPoneAvailable(str) {  
          var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;  
          if (!myreg.test(str)) {  
              return false;  
          } else {  
              return true;  
          }  
      }      
    </script>  
</html>
