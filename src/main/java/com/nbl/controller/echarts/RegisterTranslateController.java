package com.nbl.controller.echarts;

import java.util.HashMap;
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

import com.nbl.services.customer.CustUserService;
import com.nbl.utils.json.ResponseJson;

/**
 * @author Donald
 * @createdate 2016年8月3日
 * @version 1.0 
 * @description :注册转换率
 */
@RequestMapping(value= "/registerTranslate")
@Controller
public class RegisterTranslateController {

	private final static Logger logger = LoggerFactory.getLogger(RegisterTranslateController.class); 
	
	@Resource(name="ehCacheManager")
	private EhCacheManager ehCacheManager;
	@Resource
	private CustUserService custUserService;
	
	@RequestMapping(value= "/query",method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody ResponseJson querybody(HttpServletRequest request, HttpServletResponse response){
		logger.info("/query===echarts");
		ResponseJson json = new ResponseJson();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		Cache<String, Map<String, Object>> cache =ehCacheManager.getCache("echartsAll");
		
		int certCount = custUserService.queryCountCustUser();
		int noCertCount = custUserService.queryNoCountCustUser();
		int lastMonthCount = custUserService.queryLastMonthCount();
		int noLastMonthCount = custUserService.queryNoLastMonthCount();
		int MonthCount = custUserService.queryMonthCount();
		int noMonthCount = custUserService.queryNoMonthCount();
		int weekCount = custUserService.queryWeekCount();
		int noWeekCount = custUserService.queryNoWeekCount();
		
		jsonMap.put("certCount", certCount);
		jsonMap.put("noCertCount", noCertCount);
		jsonMap.put("lastMonthCount", lastMonthCount);
		jsonMap.put("noLastMonthCount", noLastMonthCount);
		jsonMap.put("MonthCount", MonthCount);
		jsonMap.put("noMonthCount", noMonthCount);
		jsonMap.put("weekCount", weekCount);
		jsonMap.put("noWeekCount", noWeekCount);
		//把查询结果集放到缓存中
		cache.put("all", jsonMap);
		logger.info("------custUserService--【echartsAll】----"+cache.values());
		
		return json.success(jsonMap);
	}
	
	@RequestMapping(value= "/echarts",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryTop(HttpServletRequest request, HttpServletResponse response){
		logger.info("/registerTranslate===echarts");
		
		return "/WEB-INF/view/echarts/registerTranslate";
		
	}


}
