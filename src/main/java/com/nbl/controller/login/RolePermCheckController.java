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
public class RolePermCheckController {

	private final static Logger logger = LoggerFactory.getLogger(RolePermCheckController.class); 

	@RequestMapping(value= "/unauthor")
	public ModelAndView logincheck(HttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.info("/unauthor===");
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/WEB-INF/view/base/unauthor");
		return mv;
	}

}
