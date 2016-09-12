package com.nbl.controller.task;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nbl.services.task.DayService;

/**
 * @author gcs
 * @createdate 2016年7月28日	
 * @version 1.0
 * 工作日历查询控制层
 */
@RequestMapping("task")
@Controller
public class WorkCalendarController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkCalendarController.class);
	
	@Resource DayService dayService;
	
	@RequestMapping(value= "/toWorkCalendorMain")
	public ModelAndView queryMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("/toWorkCalendorMain===");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/WEB-INF/view/task/workCalendor_main");
		return mv;
	}
	
	@RequestMapping(value= "/initDay")
	public ModelAndView initDay(HttpServletRequest request, HttpServletResponse response){
		logger.info("/initDay===");
		ModelAndView mv = new ModelAndView();
		String initDay = request.getParameter("initDay");
		boolean initFlag = dayService.queryLikeDay("initDay");//true 表示 没有被初始化   false 表示已初始化
		if (initFlag) {
			dayService.initDay(initDay);
			request.setAttribute("initDay", initDay);
			request.setAttribute("initFalg", "初始化成功！");
			mv.setViewName("/WEB-INF/view/task/workCalendor_initResult");
		} else {
			request.setAttribute("initDay", initDay);
			request.setAttribute("initFalg", "已初始化！");
			mv.setViewName("/WEB-INF/view/task/workCalendor_initResult");
		}
		
		return mv;
	}
	
	
	@RequestMapping(value= "/workCalendor_body",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryBody(HttpServletRequest request, HttpServletResponse response){
		return "/WEB-INF/view/task/workCalendor_body";
	}
	
	@RequestMapping(value= "/modifyDay",method = {RequestMethod.POST, RequestMethod.GET})
	public String  modifyDay(HttpServletRequest request, HttpServletResponse response){
		logger.info("/modifyDay===");
		String modifyday = request.getParameter("modifyday");
		logger.info("<<<<<modifyday>>>>>>"+modifyday);
		Short workDayType = Short.valueOf(request.getParameter("workDayType"));
		boolean flag = dayService.workDayTypeModify(modifyday,workDayType);
		if (flag) {
			request.setAttribute("initDay", modifyday);
			request.setAttribute("initFalg", "修改成功！");
		} else {
			
		}
		return "/WEB-INF/view/task/workCalendor_initResult";
	}
	
	
	
	@RequestMapping(value= "/workCalendor_top",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/workCalendor_top===");
		return "/WEB-INF/view/task/workCalendor_top";
	}
}
