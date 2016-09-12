package com.nbl.controller.shiro;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value= "/shiro")
@Controller
public class ShiroCheckController {

	private final static Logger logger = LoggerFactory.getLogger(ShiroCheckController.class); 
	
	@RequestMapping(value= "/shiroCheck",method = {RequestMethod.POST, RequestMethod.GET})
	public String  shiroCheckUser(HttpServletRequest request, HttpServletResponse response){
		logger.info("/checkQuery===");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		logger.info("/username==="+username+",password="+password);
	
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token=new UsernamePasswordToken(username, password);
		try{
			subject.login(token);
			Session session=subject.getSession();
			System.out.println("sessionId:"+session.getId());
			System.out.println("sessionHost:"+session.getHost());
			System.out.println("sessionTimeout:"+session.getTimeout());
			session.setAttribute("info", "null");
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", "errorMsg");
			return "index";
		}

		
		return "product/product_check_body";
		
	}

}
