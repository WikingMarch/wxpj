package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import common.RandomCodeGenerate;

import entity.addressEntity;
import entity.orderEntity;
import entity.userEntity;

import Service.addressService;
import Service.userService;
import Service.orderService;
@Controller
public class userController {
@Autowired 
private userService userService;
@Autowired	
private addressService addressService;
@Autowired	
private orderService orderService;
private HttpServletResponse response;
private HttpServletRequest request;
private HttpSession session;






@RequestMapping("orderdelete.do")
public void orderdelete(@RequestParam(value="uid",required =false) String uid,
		@RequestParam(value="d_id",required =false) String d_id){

	if(isLogined(uid)==true)
		{
		
		orderEntity entity=new orderEntity();
		if(d_id!=null&&d_id.equals("")==false)
		{	entity.setD_id(Integer.parseInt(d_id));
		orderService.deleteBy(entity);
		}
		}
	
} 




@RequestMapping("xiadan.do")
public ModelAndView xiadan(@RequestParam(value="a_id",required =false) String a_id,
		@RequestParam(value="w_id",required =false) String w_id,
		@RequestParam(value="uid",required =false) String uid,
		@RequestParam(value="type",required =false) String type,
		@RequestParam(value="time",required =false) String time){

	if(isLogined(uid)==true&&w_id!=null&&uid!=null&&type!=null&&time!=null)
		
		{
		Date date=new Date(System.currentTimeMillis());
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String xdtime=format.format(date);
		format=new SimpleDateFormat("yyyyMMddHHmmss");
		String num=format.format(date)+RandomCodeGenerate.getSmsCode();
		
		orderEntity entity=new orderEntity();
		addressEntity add=addressService.findAddressById(a_id);
		entity.setD_address(add.getA_xuexiao()+add.getA_xiaoqu()+add.getA_address());  
		String stype=getStype(type);
		
		entity.setD_aid(a_id);
		  entity.setD_num(num);
		  entity.setD_state("0");
		entity.setD_time(time);
		entity.setD_type(stype);
		entity.setD_uid(uid);
		entity.setD_wid(w_id);
		entity.setD_xdtime(xdtime);
	orderService.saveOrupdate(entity);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("title","预约" );
		map.put("head_title","预约" );
		map.put("text","预约成功，请留意短信通知！" );
		map.put("button","查看订单" );
		map.put("href","go_myorder.do?uid="+uid );
 	return new ModelAndView("MyJsp", map);
		}
		else{
			session.removeAttribute("userId");
			return new ModelAndView("redirect:index~.html");
	}



} 







@RequestMapping("addressdelete.do")
public void addressdelete(@RequestParam(value="a_id",required =false) String a_id,@RequestParam(value="uid",required =false) String uid){

	if(isLogined(uid)==true)
		{
		addressEntity entity=new addressEntity();
		entity.setA_id(Integer.parseInt(a_id));
		entity.setU_id(uid);
		addressService.deleteAddress(entity);
		
		}
	
} 


@RequestMapping("addressadd.do")
public ModelAndView addressadd(@ModelAttribute addressEntity entity ,@RequestParam(value="uid",required =false) String uid,
		@RequestParam(value="type",required =false) String type){

	if(isLogined(uid)==true)
		{ModelAndView mv=new ModelAndView("redirect:/go_address.do?uid="+uid+"&type="+type);
		
		entity.setU_id(uid);
		addressService.addNewAddress(entity);
		
		
		return mv;
		}
		else
	{
		session.removeAttribute("userId");
		return new ModelAndView("redirect:index~.html");
		
	}
} 
	@RequestMapping("reg.do")
	public ModelAndView reg_user(@ModelAttribute userEntity entity,HttpServletRequest request,HttpSession session){
		Map<String,Object>map=new HashMap<String, Object>();
	System.out.println(entity.toString());
	String code=request.getParameter("code");
		System.out.println(code);
	String s_code=(String) session.getAttribute("code");
	String tel=(String) session.getAttribute("tel");
		if(s_code!=null&&s_code.equals(code)&&tel.equals(entity.getU_tel()))
			{
			userService.addNewUser(entity);
			map.put("title","注册" );
			map.put("head_title","注册" );
			map.put("text","注册成功" );
			map.put("button","立即登录" );
			map.put("href","login.html" );
            session.removeAttribute("code");
			session.removeAttribute("tel");
			}
			else{
				map.put("title","注册" );
				map.put("head_title","注册" );
				map.put("text","注册失败" );
				map.put("button","重新注册" );
				map.put("href","reg.jsp" );
		}

	
		return new ModelAndView("MyJsp", map);
	
	
	
	}
	@RequestMapping("userLogin_PW.do")
	public ModelAndView Login(@RequestParam(value="tel") String tel,@RequestParam(value="password") String password,HttpSession session){
		Map<String,Object>map=new HashMap<String, Object>();
		userEntity entity=userService.loginbyPW(tel, password);
		if(entity==null)
		{
			map.put("title","登录" );
			map.put("head_title","登录" );
			map.put("text","用户名或密码不正确" );
			map.put("button","重新登录" );
			map.put("href","login.html" );
			return new ModelAndView("MyJsp",map);
		}else{
			map.put("userEntity", entity);
			 session.setAttribute("userId", entity.getU_id()+"");
			return new ModelAndView("index",map);
		}
			

	}
	
	@RequestMapping("userLogin_Tel.do")
	public ModelAndView Login1(@RequestParam(value="tel") String tel,@RequestParam(value="code") String code,HttpSession session){
		Map<String,Object>map=new HashMap<String, Object>();

		
	String l_code=(String) session.getAttribute("lcode");
	String ltel=(String) session.getAttribute("ltel");
	long ntime=new Date(System.currentTimeMillis()).getTime();
	
		if(l_code!=null&&l_code.equals(code)&&ltel.equals(tel))
		{
			long ltime=(Long) session.getAttribute("ltime");
			if(ntime-ltime<10*60*1000){
			System.out.println(ltel+";"+l_code);
			System.out.println("time="+(ntime-ltime));
			

			session.removeAttribute("ltime");
			session.removeAttribute("lcode");
			session.removeAttribute("ltel");
		userEntity entity=userService.loginbyPhone(tel);
	
		    session.setAttribute("userId", entity.getU_id()+"");
			map.put("userEntity", entity);
			
			return new ModelAndView("index",map);
			}
		}
		
			map.put("title","登录" );
			map.put("head_title","登录" );
			map.put("text","验证码不正确" );
			map.put("button","重新登录" );
			map.put("href","login_code.html" );
			
			
			return new ModelAndView("MyJsp",map);
		
		
		
	}
	@RequestMapping("pwdfind.do")
	public ModelAndView pwdfind(@RequestParam(value="tel") String tel,@RequestParam(value="code") String code,@RequestParam(value="password") String password,HttpSession session){
		Map<String,Object>map=new HashMap<String, Object>();

		
	String l_code=(String) session.getAttribute("lcode");
	String ltel=(String) session.getAttribute("ltel");
	long ntime=new Date(System.currentTimeMillis()).getTime();
	
		if(l_code!=null&&l_code.equals(code)&&ltel.equals(tel))
		{
			long ltime=(Long) session.getAttribute("ltime");
			if(ntime-ltime<10*60*1000){
			System.out.println(ltel+";"+l_code);
			System.out.println("time="+(ntime-ltime));
			

			session.removeAttribute("ltime");
			session.removeAttribute("lcode");
			session.removeAttribute("ltel");
		userEntity entity=userService.loginbyPhone(tel);
	
			entity.setU_password(password);
			userService.addNewUser(entity);
			map.put("title","结果页面" );
			map.put("head_title","密码找回" );
			map.put("text","密码找回成功" );
			map.put("button","立即登陆" );
			map.put("href","login.html" );
			return new ModelAndView("MyJsp",map);
			}
		}
		
			map.put("title","结果页面" );
			map.put("head_title","密码找回" );
			map.put("text","验证码无效" );
			map.put("button","重新找回" );
			map.put("href","pwdfind.html" );
			
			
			return new ModelAndView("MyJsp",map);
		
			
	}
	public boolean isLogined(String uid){
		String id=null;
		
		if((id=(String) session.getAttribute("userId"))!=null&&id.equals(uid)){
			
			System.out.println("id"+id+";"+uid);
			return true;}
			else
			{System.out.println("id"+id+";"+uid);
				return false;
			}
			
			
		}
	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){
	  this.request = request;
	 this.response = response;
	this.session = request.getSession();
	}	
	
public String getStype(String type){
	String stype="";
if(type.equals("0")){
		
		stype="租凭保险箱";
	}else if(type.equals("1")){
		
		stype="钥匙丢失";
	}else if(type.equals("2")){
		
		stype="保险箱换锁";
	}else if(type.equals("3")){
		
		stype="密码重置";
	}else if(type.equals("4")){
		
		stype="调换寝室";
	}else if(type.equals("5")){
		
		stype="租凭到期";
	}else{
		
		stype=type;
	}
	return stype;
}

	
}
