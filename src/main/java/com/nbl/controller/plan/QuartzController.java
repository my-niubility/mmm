package com.nbl.controller.plan;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nbl.jspbean.plan.QuartzJobBean;
import com.nbl.services.plan.QuartzJobService;

@RequestMapping(value= "/plan")
@Controller
public class QuartzController {
	
	@Resource
	private QuartzJobService quartzJobService;
	
	private final static Logger logger = LoggerFactory.getLogger(QuartzController.class); 
	
	@RequestMapping(value= "/toQuartzJob")
	public String queryJob(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toQuartzJob===");
		//
		List<QuartzJobBean> quartzList = quartzJobService.queryScheduleJobs();
		
		request.getSession().setAttribute("quartzList", quartzList);
		
		return "/WEB-INF/view/plan/quartz_query";
		
	}

}
