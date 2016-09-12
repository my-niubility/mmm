package com.nbl.controller.echarts;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author gcs
 * @createdate 2016年8月5日	
 * @version 1.0
 * 项目还款比例
 */
@RequestMapping("projectReback")
@Controller
public class ProjectRebackController {
	
	private final static Logger logger = LoggerFactory.getLogger(ProjectRebackController.class); 
	
	@Resource(name="ehCacheManager")
	private EhCacheManager ehCacheManager;
	
	@RequestMapping(value= "/echarts",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/projectReback===echarts");
		
		return "/WEB-INF/view/echarts/projectReback";
		
	}
}
