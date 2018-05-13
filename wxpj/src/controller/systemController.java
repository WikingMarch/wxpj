package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import common.GetSmsCode;
import common.RandomCodeGenerate;

import Service.addressService;
import Service.baoxianguiService;
import Service.userService;
import Service.weixiurenService;
import Service.orderService;
import entity.addressEntity;
import entity.baoxianguiEntity;
import entity.orderEntity;
import entity.userEntity;

@Controller
public class systemController {
@Autowired	
private weixiurenService weixiurenService;
@Autowired	
private userService userService;

@Autowired	
private addressService addressService;
@Autowired	
private orderService orderService;
private HttpServletResponse response;
private HttpServletRequest request;
private HttpSession session;



	
	
	/***********Ò³ÃæÂ·ÓÉ**********/


	@RequestMapping("go_wxydetail.do")
	public ModelAndView go_wxydetail(@RequestParam(value="uid",required =false) String uid,
			@RequestParam(value="w_id",required =false) String w_id){
		
		
		if(isLogined(uid)==true)
			{
			ModelAndView mv=new ModelAndView("wxrdetails");
		    mv.addObject("userEntity",new userEntity(Integer.parseInt(uid)));
		   if(w_id!=null&&w_id.equals("")!=true)
		    mv.addObject("wxrEntity",weixiurenService.findbyId(w_id));
		
		
			return mv;
			}
			else
		{
			session.removeAttribute("userId");
			return new ModelAndView("redirect:index~.html");
			
		}
	} 




@RequestMapping("go_showaddresswxr.do")
public ModelAndView go_showaddresswxr(@RequestParam(value="uid",required =false) String uid,
		@RequestParam(value="type",required =false) String type,
		@RequestParam(value="a_id",required =false) String a_id) throws UnsupportedEncodingException{
	if(type!=null)
		type=new String(type.getBytes("iso8859-1"),"UTF-8");
	
	if(isLogined(uid)==true)
		{
		ModelAndView mv=new ModelAndView("showaddresswxr");
	    mv.addObject("userEntity",new userEntity(Integer.parseInt(uid)));
	   if(a_id!=null&&a_id.equals("")!=true)
	    mv.addObject("wxrList",weixiurenService.findListByA_id(a_id));
	    mv.addObject("type",type);
	    mv.addObject("a_id",a_id);
		return mv;
		}
		else
	{
		session.removeAttribute("userId");
		return new ModelAndView("redirect:index~.html");
		
	}
} 






	
	@RequestMapping("go_floor.do")
	public ModelAndView go_floor(@RequestParam(value="uid",required =false) String uid,
			@RequestParam(value="type",required =false) String type,
			@RequestParam(value="a_id",required =false) String a_id,
			@RequestParam(value="w_id",required =false) String w_id,
			@RequestParam(value="w_name",required =false) String w_name) throws UnsupportedEncodingException{
		if(type!=null)
		type=new String(type.getBytes("iso8859-1"),"UTF-8");
		if(isLogined(uid)==true)
			{ModelAndView mv=new ModelAndView("floor");
			
			if(a_id!=null)
				mv.addObject("addressEntity",addressService.findAddressById(a_id));
			if(w_id!=null)
				{
				try {
					w_name=new String(w_name.getBytes("iso8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				mv.addObject("w_name",w_name);
			mv.addObject("w_id",w_id);
			System.out.println(w_name+"-----------");
				}
				/*if(a_id!=null)
				mv.addObject("addressEntity",addressService.findAddressById(a_id));
			*/
		
			mv.addObject("userEntity",new userEntity(Integer.parseInt(uid)));
			mv.addObject("type",type);
			
			return mv;
			}
			else
		{
			session.removeAttribute("userId");
			return new ModelAndView("redirect:index~.html");
		}
	} 
	
	
	
	
	
	@RequestMapping("go_addressadd.do")
	public ModelAndView go_addressadd(@RequestParam(value="uid",required =false) String uid,
			@RequestParam(value="type",required =false) String type) throws UnsupportedEncodingException{
		
		if(type!=null)
			type=new String(type.getBytes("iso8859-1"),"UTF-8");
		if(isLogined(uid)==true)
			{ModelAndView mv=new ModelAndView("addressadd");
		
			mv.addObject("userEntity",new userEntity(Integer.parseInt(uid)));
		mv.addObject("type",type);
			return mv;
			}
			else
		{
			session.removeAttribute("userId");
			return new ModelAndView("redirect:index~.html");
			
		}
	} 
	
	
	
	
	@RequestMapping("go_indexcenter.do")
	public ModelAndView go_indexcenter(@RequestParam(value="uid",required =false) String uid){
	if(isLogined(uid)==true)
		{
		ModelAndView mv=new ModelAndView("index_center");
		mv.addObject("userEntity",new userEntity(Integer.parseInt(uid)));
		return mv;
		}
		else
	{
		session.removeAttribute("userId");
		return new ModelAndView("redirect:index~.html");
		
	}
	
	} 
	
	@RequestMapping("go_index.do")
	public ModelAndView go_index(@RequestParam(value="uid",required =false) String uid){
		
		
		if(isLogined(uid)==true)
			{ModelAndView mv=new ModelAndView("index");
			mv.addObject("userEntity",new userEntity(Integer.parseInt(uid)));
			return mv;
			}
			else
		{
			session.removeAttribute("userId");
			return new ModelAndView("redirect:index~.html");
			
		}
	} 
	
	@RequestMapping("go_address.do")
	public ModelAndView go_address(@RequestParam(value="uid",required =false) String uid,
			@RequestParam(value="type",required =false) String type) throws UnsupportedEncodingException{
		
		if(type!=null)
			type=new String(type.getBytes("iso8859-1"),"UTF-8");
		if(isLogined(uid)==true)
			{ModelAndView mv=new ModelAndView("address");
		
			
			List<addressEntity>list=addressService.findAddressByUserId(uid);
			
			mv.addObject("userEntity",new userEntity(Integer.parseInt(uid)));
			mv.addObject("addressList",list);
			mv.addObject("type",type);
			return mv;
			}
			else
		{
			session.removeAttribute("userId");
			return new ModelAndView("redirect:index~.html");
			
		}
	} 
	
	
	
	
	
	@RequestMapping("go_myorder.do")
	public ModelAndView go_myorder(@RequestParam(value="uid",required =false) String uid){
		
		
		if(isLogined(uid)==true)
			{
			ModelAndView mv=new ModelAndView("myorder");
			mv.addObject("userEntity",new userEntity(Integer.parseInt(uid)));
			List<orderEntity>list=orderService.findListByUid(uid);
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
				
				mv.addObject("orderList1", list1);
			mv.addObject("orderList2", list2);
			return mv;
			}
			else
		{
			session.removeAttribute("userId");
			return new ModelAndView("redirect:index~.html");
			
		}
	} 
	
	
	
	@RequestMapping("sendCode.do")
	public void sendCode(@RequestParam(value="tel") String tel,@RequestParam(value="type") String type){
		String result="0";
		if(type.equals("0")){
		if(userService.isExistByPhone(tel)==true)
		{
			
			
			result="0";
		}else
		{
			
			String code=RandomCodeGenerate.getSmsCode();
			GetSmsCode.execute(tel,code);
			session.setAttribute("code", code);
			session.setAttribute("tel", tel);
			System.out.println("code:"+code);
			result="1";
		}
		}
		else{
		if(weixiurenService.isExistByPhone(tel)==true)
		{
			
			
			result="0";
		}else
		{
			
			String code=RandomCodeGenerate.getSmsCode();
			GetSmsCode.execute(tel,code);
			session.setAttribute("code", code);
			session.setAttribute("tel", tel);
			System.out.println("code:"+code);
			result="1";
		}
		}
			System.out.println(tel);
		 PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     
			out.write(result.toString()); 
	} 
	
	
	
	@RequestMapping("getLoginCode.do")
	public void getloginCode(@RequestParam(value="tel") String tel){
		String result="0";
		if(userService.isExistByPhone(tel)==true)
		{
		Date date=new Date(System.currentTimeMillis());
			
			String code=RandomCodeGenerate.getSmsCode();
			GetSmsCode.execute(tel,code);
		session.setAttribute("lcode", code);
		session.setAttribute("ltel", tel);
		session.setAttribute("ltime",date.getTime() );
		System.out.println("lcode:"+code);
		result="1";
			
			
			
		}else
		{
			result="0";
			
		}
			
			System.out.println(tel);
		 PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     
			out.write(result.toString()); 
	} 
	
	
	
	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){
	  this.request = request;
	 this.response = response;
	this.session = request.getSession();
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

}
