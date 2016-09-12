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
public class SubjectQueryController {

	private final static Logger logger = LoggerFactory.getLogger(SubjectQueryController.class); 
	
	@RequestMapping(value= "/subjectQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  query(HttpServletRequest request, HttpServletResponse response){
		logger.info("/subjectQuery===");
		return "/WEB-INF/view/portion/subject_query_body";
		
	}

	@RequestMapping(value= "/toSubjectMain",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toSubjectMain===");
		return "/WEB-INF/view/portion/subject_query_main";
		
	}
	
	@RequestMapping(value= "/subject_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/subject_query_top===");
		return "/WEB-INF/view/portion/subject_query_top";
		
	}

	@RequestMapping(value= "/subject_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/subject_query_body===");
		return "/WEB-INF/view/portion/subject_query_body";
		
	}

	@RequestMapping(value= "/subjectDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/subjectDetail===");
		return "/WEB-INF/view/portion/subject_sub_query_main";
		
	}

	@RequestMapping(value= "/subject_sub_query_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  querySubTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/subject_sub_query_top===");
		return "/WEB-INF/view/portion/subject_sub_query_top";
		
	}

	@RequestMapping(value= "/subject_sub_query_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  querySubBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/subject_sub_query_body===");
		return "/WEB-INF/view/portion/subject_sub_query_body";
		
	}

	@RequestMapping(value= "/subjectSubQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String  querySub(HttpServletRequest request, HttpServletResponse response){
		logger.info("/subjectQuery===");
		return "/WEB-INF/view/portion/subject_sub_query_body";
		
	}

}
