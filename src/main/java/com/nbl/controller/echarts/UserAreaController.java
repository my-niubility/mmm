package com.nbl.controller.echarts;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbl.jspbean.customer.CustPersonBean;
import com.nbl.services.customer.CustPersonService;
import com.nbl.utils.json.ResponseJson;

/**
 * @author gcs
 * @createdate 2016年8月5日	
 * @version 1.0
 * 用户地域来源
 */
@RequestMapping("userArea")
@Controller
public class UserAreaController {
	
	private final static Logger logger = LoggerFactory.getLogger(UserAreaController.class); 
	
	@Resource(name="ehCacheManager")
	private EhCacheManager ehCacheManager;
	
	@Resource
	private CustPersonService custPersonService;
	
	@RequestMapping(value= "/echarts",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/userArea===echarts");
		
		return "/WEB-INF/view/echarts/userArea";
		
	}
	
	@RequestMapping(value= "/query",method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody ResponseJson  queryBody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/userArea===query");
		ResponseJson json = new ResponseJson();
		Map<String, List<CustPersonBean>> jsonMap = new HashMap<String, List<CustPersonBean>>();
		Cache<String, Map<String, List<CustPersonBean>>> cache =ehCacheManager.getCache("echartsAll");
		
		List<CustPersonBean> listAreaCount = custPersonService.listAreaCount();
		List<CustPersonBean> listLastMonthAreaCount = custPersonService.listLastMonthAreaCount();
		List<CustPersonBean> listMonthAreaCount = custPersonService.listMonthAreaCount();
		List<CustPersonBean> listWeekAreaCount = custPersonService.listWeekAreaCount();
		
		jsonMap.put("listAreaCount", listAreaCount);
		jsonMap.put("listLastMonthAreaCount", listLastMonthAreaCount);
		jsonMap.put("listMonthAreaCount", listMonthAreaCount);
		jsonMap.put("listWeekAreaCount", listWeekAreaCount);
		//把查询结果集放到缓存中
		cache.put("all", jsonMap);
		logger.info("------custPersonService--【echartsAll】----"+cache.values()+listAreaCount.size());
		
		return json.success(jsonMap);
		
	}
}
