package controller;

import java.util.ArrayList;
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


import entity.orderEntity;
import entity.weixiurenEntity;
import Service.orderService;
import Service.weixiurenService;
@Controller
public class weixiucontroller {
	@Autowired
	weixiurenService weixiurenService;
	@Autowired
	orderService orderService ;
	private HttpSession session;
	private HttpServletResponse response;
	private HttpServletRequest request;
	
	@RequestMapping("wxrLogin_PW.do")
	public ModelAndView Login(@RequestParam(value="tel") String tel,@RequestParam(value="password") String password,HttpSession session){
		Map<String,Object>map=new HashMap<String, Object>();
		weixiurenEntity entity=weixiurenService.loginbyPW(tel, password);
		if(entity==null)
		{
			map.put("title","登录" );
			map.put("head_title","登录" );
			map.put("text","用户名或密码不正确" );
			map.put("button","重新登录" );
			map.put("href","login.html" );
			return new ModelAndView("MyJsp",map);
		}else{
			map.put("weixiurenEntity", entity);
			 session.setAttribute("userId", entity.getW_id()+"");
			 
			 
			 List<orderEntity>list=orderService.findListByWid(entity.getW_id()+"");
				List<orderEntity>list1=new ArrayList<orderEntity>();
				List<orderEntity>list2=new ArrayList<orderEntity>();
				if(list!=null)
				{
					for (orderEntity orderEntity : list) {
						if(Integer.parseInt(orderEntity.getD_state())>=6){
							list2.add(orderEntity);}
							else{
								list1.add(orderEntity);
							}
						}
						
					}
					
					map.put("orderList1", list1);
					map.put("orderList2", list2);
			return new ModelAndView("wxrorder",map);
		}
			

	}
	
	@RequestMapping("wxrLogin_Tel.do")
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
		weixiurenEntity entity=weixiurenService.loginbyPhone(tel);
	
		    session.setAttribute("userId", entity.getW_id()+"");
			map.put("weixiurenEntity", entity);
			
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
	@RequestMapping("wxrpwdfind.do")
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
		weixiurenEntity entity=weixiurenService.loginbyPhone(tel);
	
			entity.setW_password(password);
			weixiurenService.addNewWxr(entity);
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
	
}
