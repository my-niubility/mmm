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
 * 单笔投资比例
 */
@RequestMapping("singleInvest")
@Controller
public class SingleInvestController {
	
	private final static Logger logger = LoggerFactory.getLogger(SingleInvestController.class); 
	
	@Resource(name="ehCacheManager")
	private EhCacheManager ehCacheManager;
	
	@RequestMapping(value= "/echarts",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/singleInvest===echarts");
		
		return "/WEB-INF/view/echarts/singleInvest";
		
	}
}
