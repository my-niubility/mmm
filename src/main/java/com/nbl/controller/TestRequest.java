package com.nbl.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nbl.services.TestRequestValue;

/**
 * @author Donald
 * @createdate 2016年3月17日
 * @version 1.0 
 * @description :
 */
@Controller
public class TestRequest {
	private final static Logger logger = LoggerFactory.getLogger(TestRequest.class); 
	
	@Resource
	private TestRequestValue testRequestValue;
	
	@RequestMapping(value= "/hello")
	public ModelAndView getRequsetValue(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mv = new ModelAndView();
		String ms = testRequestValue.getRequestValue("11");
		if(ms==null){
			logger.info("test logger:"+"");

		}else{
			logger.info("test logger:"+ms);

		}
		
		Map map = new HashMap();
		request.getSession(false);
		mv.addObject("name", ms);
		mv.setViewName("/WEB-INF/view/hello");
		return mv;
		
	}
	
	@RequestMapping(value= "/hello1")
	public void getRequsetValue1(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		PrintWriter printWriter = response.getWriter();
		request.getSession(true);
		Cookie cookie = new Cookie("cook1","cookValue1");
		cookie.setPath("/");
//		cookie.setDomain(".zelbank.com");
		cookie.setMaxAge(30000);
		cookie.setSecure(false);
//		cookie.
		response.addCookie(cookie);
		printWriter.print("session  test no");
		printWriter.flush();
		printWriter.close();

	}


	@RequestMapping(value="/getSession",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();

		logger.info("session-1:get-session:"+request.getSession().getAttribute("session-1"));
		request.getSession().invalidate();
		mv.addObject("name", "getSession");
		mv.setViewName("hello");
		return mv;
	}


	@RequestMapping(value="/setSession",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView setSession(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		request.getSession().setAttribute("session-1", request.getParameter("sess"));
		logger.info("session-1:set-value:"+request.getParameter("sess"));
		logger.info("maxTime:"+request.getSession().getMaxInactiveInterval());
		mv.addObject("name", "getSession");
		mv.setViewName("hello");
		return mv;
	}


	

	
}
