package com.nbl.controller.portion;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value= "/portion")
@Controller
public class RuleQueryController {

	private final static Logger logger = LoggerFactory.getLogger(RuleQueryController.class); 
	
	@RequestMapping(value= "/ruleQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/ruleQuery===");
		return "/WEB-INF/view/portion/rule_query_body";
		
	}

	@RequestMapping(value= "/toRuleMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toRuleMain===");
		return "/WEB-INF/view/portion/rule_query_main";
		
	}
	
	@RequestMapping(value= "/rule_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/rule_query_top===");
		return "/WEB-INF/view/portion/rule_query_top";
		
	}

	@RequestMapping(value= "/rule_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/rule_query_body===");
		return "/WEB-INF/view/portion/rule_query_body";
		
	}

}
