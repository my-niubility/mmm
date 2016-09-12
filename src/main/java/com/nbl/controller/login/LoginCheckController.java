package com.nbl.controller.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginCheckController {

	private final static Logger logger = LoggerFactory.getLogger(LoginCheckController.class); 
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @description:校验失败跳转逻辑
	 */
	@RequestMapping(value= "/logincheck")
	public ModelAndView logincheck(HttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.info("/logincheck===");
		String mss = (String) request.getAttribute("shiroLoginFailure");
		logger.info("/check failure key ==="+mss);
		if(mss !=null && !"".equals(mss) && "jCaptcha.error".equals(mss)){
			request.setAttribute("failureKeyAttribute", "验证码错误");
		}else{
			request.setAttribute("failureKeyAttribute", "用户名或密码错误");
		}
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("index");
		return mv;
	}

	/**
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @description:校验通过进行登录跳转
	 */
	@RequestMapping(value= "/welcome")
	public ModelAndView welcome(HttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.info("/welcome===");
		ModelAndView mv = new ModelAndView();
		String userName = (String)request.getParameter("userName");
		
		logger.info("/welcome==登录的用户：{}="+userName);
		
		String sess = (String)request.getSession().getAttribute(userName);
		logger.info("/welcome==登录的用户：{},取出的session值：{}="+userName,sess);
		if(sess ==null || "".equals(sess)){
			logger.info("---------取出的session值：{}---------");
			request.getSession().setAttribute("userName", userName);
			mv.setViewName("/index");

		}else{
			logger.info("---------取出的session值：{}---------",sess);
			request.getSession().setAttribute("userName", userName);
			mv.setViewName("/WEB-INF/view/base/main");

		}
		return mv;
	}

}
